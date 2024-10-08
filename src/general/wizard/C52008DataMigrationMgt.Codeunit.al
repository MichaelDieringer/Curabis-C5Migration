namespace CurabisC5.CurabisCMigration;
using System.Integration;
using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Inventory.Item;

/// <summary>
/// Codeunit C5 Data Migration Mgt. (ID 51860).
/// </summary>
codeunit 51860 "C5 2008 Data Migration Mgt."
{
    var
        DataMigratorDescTxt: Label 'Import from Microsoft Dynamics C5 2008';
        C5FileTypeTxt: Label 'Zip Files (*.zip)|*.zip';
        SomethingWentWrongErr: Label 'Oops, something went wrong.\Please try again later.';
        AccountsNotSelectedQst: Label 'You are about to migrate data for one or more entities without migrating general ledger accounts. If you continue, transactions for the entities will not be migrated. To migrate transactions, you must migrate general ledger accounts. Do you want to continue without general ledger accounts?';
        LedgerEntriesErr: Label 'To migrate C5 ledger entries you must also migrate general ledger accounts.';

    /// <summary>
    /// ImportC5Data.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure ImportC5Data(): Boolean
    var
        ServerFile: Text;
        ZipInStream: InStream;
    begin
        if not UploadIntoStream(CopyStr(DataMigratorDescTxt, 1, 50), '', C5FileTypeTxt, ServerFile, ZipInStream) then
            exit(false);

        if not StoreStreamFileOnBlob(ZipInStream) then
            Error(SomethingWentWrongErr);

        if not Codeunit.Run(Codeunit::"C5 2008 Schema Reader") then
            Error(GetLastErrorText());
        exit(true);
    end;

    /// <summary>
    /// CreateDataMigrationEntites.
    /// </summary>
    /// <param name="DataMigrationEntity">VAR Record "Data Migration Entity".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure CreateDataMigrationEntites(var DataMigrationEntity: Record "Data Migration Entity"): Boolean
    var
        C5SchemaReader: Codeunit "C5 2008 Schema Reader";
    begin
        DataMigrationEntity.InsertRecord(Database::Customer, C5SchemaReader.GetNumberOfCustomers());
        DataMigrationEntity.InsertRecord(Database::Vendor, C5SchemaReader.GetNumberOfVendors());
        DataMigrationEntity.InsertRecord(Database::Item, C5SchemaReader.GetNumberOfItems());
        DataMigrationEntity.InsertRecord(Database::"G/L Account", C5SchemaReader.GetNumberOfAccounts());
        DataMigrationEntity.InsertRecord(Database::"C5 2008 LedTrans", C5SchemaReader.GetNumberOfHistoricalEntries());
        exit(true);
    end;

    /// <summary>
    /// ApplySelectedData.
    /// </summary>
    /// <param name="DataMigrationEntity">VAR Record "Data Migration Entity".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure ApplySelectedData(var DataMigrationEntity: Record "Data Migration Entity"): Boolean
    var
        DataMigrationStatus: Record "Data Migration Status";
        GeneralLedgerSetup: Record "General Ledger Setup";
        C5MigrDashboardMgt: Codeunit "C5 2008 Migr. Dashboard Mgt";
        DataMigrationFacade: Codeunit "Data Migration Facade";
        VendorsToMigrateNb: Integer;
        CustomersToMigrateNb: Integer;
        ItemsToMigrateNb: Integer;
        ChartOfAccountToMigrateNb: Integer;
        LegacyEntriesToMigrateNb: Integer;
    begin

        if DataMigrationEntity.Get(Database::Vendor) then
            if DataMigrationEntity.Selected then
                VendorsToMigrateNb := DataMigrationEntity."No. of Records";

        if DataMigrationEntity.Get(Database::Customer) then
            if DataMigrationEntity.Selected then
                CustomersToMigrateNb := DataMigrationEntity."No. of Records";

        if DataMigrationEntity.Get(Database::Item) then
            if DataMigrationEntity.Selected then
                ItemsToMigrateNb := DataMigrationEntity."No. of Records";

        if DataMigrationEntity.Get(Database::"G/L Account") then
            if DataMigrationEntity.Selected then
                ChartOfAccountToMigrateNb := DataMigrationEntity."No. of Records";

        if DataMigrationEntity.Get(Database::"C5 2008 LedTrans") then
            if DataMigrationEntity.Selected then
                LegacyEntriesToMigrateNb := DataMigrationEntity."No. of Records";

        if (ChartOfAccountToMigrateNb = 0) and not DataMigrationStatus.Get(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"G/L Account") then begin
            if (LegacyEntriesToMigrateNb > 0) then
                Error(LedgerEntriesErr);
            if (ItemsToMigrateNb + CustomersToMigrateNb + VendorsToMigrateNb > 0) then
                if not Confirm(AccountsNotSelectedQst) then
                    exit(false);
        end;



        if not GeneralLedgerSetup.Get() then begin
            GeneralLedgerSetup.Init();
            GeneralLedgerSetup.Insert();
        end;

        if (GeneralLedgerSetup."LCY Code" = '') or (LegacyEntriesToMigrateNb > 0) then
            Page.RunModal(Page::"C5 2008 Company Settings");


        C5MigrDashboardMgt.InitMigrationStatus(ItemsToMigrateNb, CustomersToMigrateNb, VendorsToMigrateNb, ChartOfAccountToMigrateNb, LegacyEntriesToMigrateNb);

        // run the actual migration in a background session
        if ItemsToMigrateNb + CustomersToMigrateNb + VendorsToMigrateNb + ChartOfAccountToMigrateNb + LegacyEntriesToMigrateNb > 0 then
            DataMigrationFacade.StartMigration(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), FALSE);

        exit(true);
    end;


    local procedure StoreStreamFileOnBlob(ZipInStream: InStream): Boolean
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
        BlobOutStream: OutStream;
    begin
        C5SchemaParameters.GetSingleInstance();
        C5SchemaParameters."Zip File Blob".CreateOutStream(BlobOutStream);
        if not CopyStream(BlobOutStream, ZipInStream) then begin
            OnCopyToDataBaseFailed();
            exit(false);
        end;
        C5SchemaParameters.Modify();
        Commit();
        exit(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCopyToDataBaseFailed()
    begin
    end;

}

