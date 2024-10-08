namespace CurabisC5.CurabisCMigration;
using System.Integration;
using Microsoft.Inventory.Item;
using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;
using System.Threading;
using Microsoft.Finance.GeneralLedger.Account;

/// <summary>
/// Codeunit C5 Migr. Dashboard Mgt (ID 51870).
/// </summary>
codeunit 51870 "C5 2008 Migr. Dashboard Mgt"
{
    var
        C5MigrationTypeTxt: Label 'C5 2008', Locked = true;
        C5HelptTopicUrlTxt: Label 'https://go.microsoft.com/fwlink/?linkid=859310', Locked = true;

    /// <summary>
    /// InitMigrationStatus.
    /// </summary>
    /// <param name="TotalItemNb">Integer.</param>
    /// <param name="TotalCustomerNb">Integer.</param>
    /// <param name="TotalVendorNb">Integer.</param>
    /// <param name="TotalChartOfAccountNb">Integer.</param>
    /// <param name="TotalLegacyNb">Integer.</param>
    procedure InitMigrationStatus(TotalItemNb: Integer; TotalCustomerNb: Integer; TotalVendorNb: Integer; TotalChartOfAccountNb: Integer; TotalLegacyNb: Integer)
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
        DataMigrationStatus: Record "Data Migration Status";
        C5DataLoaderStatus: Record "C5 2008 Data Loader Status";
        DataMigrationStatusFacade: Codeunit "Data Migration Status Facade";
        TotalRecords: Integer;
    begin
        DataMigrationStatusFacade.InitStatusLine(GetC5MigrationTypeTxt(), Database::Item, TotalItemNb, Database::"C5 2008 InvenTable", Codeunit::"C5 2008 Item Migrator");
        DataMigrationStatusFacade.InitStatusLine(GetC5MigrationTypeTxt(), Database::Customer, TotalCustomerNb, Database::"C5 2008 CustTable", Codeunit::"C5 2008 CustTable Migrator");
        DataMigrationStatusFacade.InitStatusLine(GetC5MigrationTypeTxt(), Database::Vendor, TotalVendorNb, Database::"C5 2008 VendTable", Codeunit::"C5 2008 VendTable Migrator");
        DataMigrationStatusFacade.InitStatusLine(GetC5MigrationTypeTxt(), Database::"G/L Account", TotalChartOfAccountNb, Database::"C5 2008 LedTable", Codeunit::"C5 2008 LedTable Migrator");
        DataMigrationStatusFacade.InitStatusLine(GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", TotalLegacyNb, 0, Codeunit::"C5 2008 LedTrans Migrator");
        C5SchemaParameters.GetSingleInstance();
        TotalRecords := TotalCustomerNb + TotalVendorNb + TotalChartOfAccountNb + TotalLegacyNb + TotalItemNb;
        if (TotalChartOfAccountNb > 0) or DataMigrationStatus.Get(GetC5MigrationTypeTxt(), Database::"G/L Account") then begin
            if TotalCustomerNb > 0 then
                TotalRecords += C5SchemaParameters."Total Customer Entries";
            if TotalItemNb > 0 then
                TotalRecords += C5SchemaParameters."Total Item Entries";
            if TotalVendorNb > 0 then
                TotalRecords += C5SchemaParameters."Total Vendor Entries";
        end;
        C5DataLoaderStatus.Initialize(TotalRecords);
    end;

    /// <summary>
    /// GetC5MigrationTypeTxt.
    /// </summary>
    /// <returns>Return value of type Text[250].</returns>
    procedure GetC5MigrationTypeTxt(): Text[250]
    begin
        exit(CopyStr(C5MigrationTypeTxt, 1, 250));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Data Migration Facade", OnFindBatchForItemTransactions, '', false, false)]
    local procedure OnFindBatchForItemTransactions(MigrationType: Text[250]; var ItemJournalBatchName: Code[10])
    var
        C5ItemMigrator: Codeunit "C5 2008 Item Migrator";
    begin
        if MigrationType <> C5MigrationTypeTxt then
            exit;

        ItemJournalBatchName := C5ItemMigrator.GetHardCodedBatchName();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Data Migration Facade", OnFindBatchForCustomerTransactions, '', false, false)]
    local procedure OnFindBatchForCustomerTransactions(MigrationType: Text[250]; var GenJournalBatchName: Code[10])
    var
        C5CustTableMigrator: Codeunit "C5 2008 CustTable Migrator";
    begin
        if MigrationType <> C5MigrationTypeTxt then
            exit;

        GenJournalBatchName := C5CustTableMigrator.GetHardCodedBatchName();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Data Migration Facade", OnFindBatchForVendorTransactions, '', false, false)]
    local procedure OnFindBatchForVendorTransactions(MigrationType: Text[250]; var GenJournalBatchName: Code[10])
    var
        C5VendTableMigrator: Codeunit "C5 2008 VendTable Migrator";
    begin
        if MigrationType <> C5MigrationTypeTxt then
            exit;

        GenJournalBatchName := C5VendTableMigrator.GetHardCodedBatchName();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Data Migration Facade", OnFindBatchForAccountTransactions, '', false, false)]
    local procedure OnFindBatchForAccountTransactions(DataMigrationStatus: Record "Data Migration Status"; var GenJournalBatchName: Code[10])
    var
        C5LedTransMigrator: Codeunit "C5 2008 LedTrans Migrator";
    begin
        if DataMigrationStatus."Migration Type" <> C5MigrationTypeTxt then
            exit;

        if DataMigrationStatus."Destination Table ID" <> Database::"C5 2008 LedTrans" then
            exit;

        GenJournalBatchName := C5LedTransMigrator.GetHardCodedBatchName();
    end;

    [EventSubscriber(ObjectType::CodeUnit, CodeUnit::"Data Migration Facade", OnSelectRowFromDashboard, '', false, false)]
    local procedure OnSelectRecordSubscriber(var DataMigrationStatus: Record "Data Migration Status")
    var
        C5LedTrans: Record "C5 2008 LedTrans";
        C5CustTable: Record "C5 2008 CustTable";
        C5LedTable: Record "C5 2008 LedTable";
        C5InvenTable: Record "C5 2008 InvenTable";
        C5VendTable: Record "C5 2008 VendTable";
    begin
        if not (DataMigrationStatus."Migration Type" = C5MigrationTypeTxt) then
            exit;

        case DataMigrationStatus."Destination Table ID" of
            Database::"C5 2008 LedTrans":
                if not C5LedTrans.IsEmpty() then
                    Page.Run(Page::"C5 2008 LedTrans List");
            Database::Customer:
                if not C5CustTable.IsEmpty() then
                    Page.Run(Page::"C5 2008 CustTable List");
            Database::"G/L Account":
                if not C5LedTable.IsEmpty() then
                    Page.Run(Page::"C5 2008 LedTable List");
            Database::Item:
                if not C5InvenTable.IsEmpty() then
                    Page.Run(Page::"C5 2008 InvenTable List");
            Database::Vendor:
                if not C5VendTable.IsEmpty() then
                    Page.Run(Page::"C5 2008 VendTable List");
        end;
    end;

    [EventSubscriber(ObjectType::CodeUnit, CodeUnit::"Data Migration Facade", OnGetMigrationHelpTopicUrl, '', false, false)]
    local procedure OnGetMigrationHelpTopicUrl(MigrationType: Text; var Url: Text)
    begin
        if MigrationType = C5MigrationTypeTxt Then
            Url := C5HelptTopicUrlTxt;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Data Migration Facade", OnMigrationCompleted, '', false, false)]
    local procedure OnAllStepsCompletedSubscriber(DataMigrationStatus: Record "Data Migration Status")
    begin
        if not (DataMigrationStatus."Migration Type" = C5MigrationTypeTxt) then
            exit;

        ClearStagingTables();
    end;


    /// <summary>
    /// OnStatusChanged.
    /// C-MID: Timeout stalles the process
    /// </summary>
    /// <param name="Rec">Record "Job Queue Entry".</param>
    /// <param name="xRec">Record "Job Queue Entry".</param>
    /// <param name="RunTrigger">Boolean.</param>
    [EventSubscriber(ObjectType::Table, Database::"Job Queue Entry", OnAfterModifyEvent, '', false, false)]
    local procedure OnStatusChanged(Rec: Record "Job Queue Entry"; xRec: Record "Job Queue Entry"; RunTrigger: Boolean)
    var
        newDuration: Duration;
    begin
        newDuration := 1000 * 60 * 60 * 24;
        rec."Job Timeout" := newDuration;
    end;



    local procedure ClearStagingTables()
    var
        C5LedTrans: Record "C5 2008 LedTrans";
        C5LedTable: Record "C5 2008 LedTable";
        C5CustDiscGroup: Record "C5 2008 CustDiscGroup";
        C5ProcCode: Record "C5 2008 ProcCode";
        C5CustContact: Record "C5 2008 CustContact";
        C5CustGroup: Record "C5 2008 CustGroup";
        C5CustRrans: Record "C5 2008 CustTrans";
        C5CustTable: Record "C5 2008 CustTable";
        C5Department: Record "C5 2008 Department";
        C5Centre: Record "C5 2008 Centre";
        C5Purpose: Record "C5 2008 Purpose";
        C5Payment: Record "C5 2008 Payment";
        C5Employee: Record "C5 2008 Employee";
        C5Delivery: Record "C5 2008 Delivery";
        C5Country: Record "C5 2008 Country";
        C5ExchRate: Record "C5 2008 ExchRate";
        C5CN8Code: Record "C5 2008 CN8Code";
        C5InvenDiscGroup: Record "C5 2008 InvenDiscGroup";
        C5UnitCode: Record "C5 2008 UnitCode";
        C5ItemTrackGroup: Record "C5 2008 ItemTrackGroup";
        C5InvenPriceGroup: Record "C5 2008 InvenPriceGroup";
        C5InvenCustDisc: Record "C5 2008 InvenCustDisc";
        C5InvenPrice: Record "C5 2008 InvenPrice";
        C5InvenLocation: Record "C5 2008 InvenLocation";
        C5InvenItemGroup: Record "C5 2008 InvenItemGroup";
        C5VatGroup: Record "C5 2008 VatGroup";
        C5InvenTrans: Record "C5 2008 InvenTrans";
        C5InvenTable: Record "C5 2008 InvenTable";
        C5InvenBOM: Record "C5 2008 InvenBOM";
        C5VendDiscGroup: Record "C5 2008 VendDiscGroup";
        C5VendContact: Record "C5 2008 VendContact";
        C5VendGroup: Record "C5 2008 VendGroup";
        C5VendTrans: Record "C5 2008 VendTrans";
        C5VendTable: Record "C5 2008 VendTable";
    begin
        C5LedTrans.DeleteAll();
        C5LedTable.DeleteAll();
        C5CustDiscGroup.DeleteAll();
        C5ProcCode.DeleteAll();
        C5CustContact.DeleteAll();
        C5CustGroup.DeleteAll();
        C5CustRrans.DeleteAll();
        C5CustTable.DeleteAll();
        C5Department.DeleteAll();
        C5Centre.DeleteAll();
        C5Purpose.DeleteAll();
        C5Payment.DeleteAll();
        C5Employee.DeleteAll();
        C5Delivery.DeleteAll();
        C5Country.DeleteAll();
        C5ExchRate.DeleteAll();
        C5CN8Code.DeleteAll();
        C5InvenDiscGroup.DeleteAll();
        C5UnitCode.DeleteAll();
        C5ItemTrackGroup.DeleteAll();
        C5InvenPriceGroup.DeleteAll();
        C5InvenCustDisc.DeleteAll();
        C5InvenPrice.DeleteAll();
        C5InvenLocation.DeleteAll();
        C5InvenItemGroup.DeleteAll();
        C5VatGroup.DeleteAll();
        C5InvenTrans.DeleteAll();
        C5InvenTable.DeleteAll();
        C5InvenBOM.DeleteAll();
        C5VendDiscGroup.DeleteAll();
        C5VendContact.DeleteAll();
        C5VendGroup.DeleteAll();
        C5VendTrans.DeleteAll();
        C5VendTable.DeleteAll();
    end;

    [EventSubscriber(ObjectType::CodeUnit, CodeUnit::"Data Migration Facade", OnInitDataMigrationError, '', false, false)]
    local procedure OnInitDataMigrationError(MigrationType: Text[250]; var BulkFixErrorsButtonEnabled: Boolean)
    begin
        if MigrationType <> C5MigrationTypeTxt then
            exit;
        BulkFixErrorsButtonEnabled := true;
    end;

    [EventSubscriber(ObjectType::CodeUnit, CodeUnit::"Data Migration Facade", OnBatchEditFromErrorView, '', false, false)]
    local procedure OnBatchEditFromErrorView(MigrationType: Text[250]; DestinationTableId: Integer)
    var
        C5LedTrans: Record "C5 2008 LedTrans";
        C5CustTable: Record "C5 2008 CustTable";
        C5LedTable: Record "C5 2008 LedTable";
        C5InventTable: Record "C5 2008 InvenTable";
        C5VendTable: Record "C5 2008 VendTable";
        DataMigrationError: Record "Data Migration Error";
        C5LedTransList: Page "C5 2008 LedTrans List";
        C5CustTableList: Page "C5 2008 CustTable List";
        C5LedTableList: Page "C5 2008 LedTable List";
        C5InventTableList: Page "C5 2008 InvenTable List";
        C5VendTableList: Page "C5 2008 VendTable List";
    begin
        if MigrationType <> C5MigrationTypeTxt Then
            exit;

        case DestinationTableId of
            Database::"C5 2008 LedTrans":
                if C5LedTrans.FindSet() then begin
                    repeat
                        if DataMigrationError.ExistsEntry(MigrationType, DestinationTableId, C5LedTrans.RecordId()) then
                            C5LedTrans.Mark(true);
                    until C5LedTrans.Next() = 0;
                    C5LedTrans.MarkedOnly(true);
                    C5LedTransList.SetTableView(C5LedTrans);
                    C5LedTransList.RunModal();
                end;
            Database::Customer:
                if C5CustTable.FindSet() then begin
                    repeat
                        if DataMigrationError.ExistsEntry(MigrationType, DestinationTableId, C5CustTable.RecordId()) then
                            C5CustTable.Mark(true);
                    until C5CustTable.Next() = 0;
                    C5CustTable.MarkedOnly(true);
                    C5CustTableList.SetTableView(C5CustTable);
                    C5CustTableList.RunModal();
                end;
            Database::"G/L Account":
                if C5LedTable.FindSet() then begin
                    repeat
                        if DataMigrationError.ExistsEntry(MigrationType, DestinationTableId, C5LedTable.RecordId()) then
                            C5LedTable.Mark(true);
                    until C5LedTable.Next() = 0;
                    C5LedTable.MarkedOnly(true);
                    C5LedTableList.SetTableView(C5LedTable);
                    C5LedTableList.RunModal();
                end;
            Database::Item:
                if C5InventTable.FindSet() then begin
                    repeat
                        if DataMigrationError.ExistsEntry(MigrationType, DestinationTableId, C5InventTable.RecordId()) then
                            C5InventTable.Mark(true);
                    until C5InventTable.Next() = 0;
                    C5InventTable.MarkedOnly(true);
                    C5InventTableList.SetTableView(C5InventTable);
                    C5InventTableList.RunModal();
                end;
            Database::Vendor:
                if C5VendTable.FindSet() then begin
                    repeat
                        if DataMigrationError.ExistsEntry(MigrationType, DestinationTableId, C5VendTable.RecordId()) then
                            C5VendTable.Mark(true);
                    until C5VendTable.Next() = 0;
                    C5VendTable.MarkedOnly(true);
                    C5VendTableList.SetTableView(C5VendTable);
                    C5VendTableList.RunModal();
                end;
        end;
    end;
}