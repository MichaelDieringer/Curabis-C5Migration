namespace CurabisC5.CurabisCMigration;
using Microsoft.Utilities;
using Microsoft.Purchases.Vendor;
using Microsoft.Inventory.Item;
using System.Utilities;
using Microsoft.Sales.Customer;
using Microsoft.Finance.GeneralLedger.Account;
using System.Integration;

/// <summary>
/// Codeunit C5 Data Loader (ID 51868).
/// </summary>
codeunit 51868 "C5 2008 Data Loader"
{
    var
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        HelperFunctions: Codeunit "C5 2008 Helper Functions";


    /// <summary>
    /// FillStagingTables.
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Data Migration Facade", OnFillStagingTables, '', false, false)]
    local procedure FillStagingTables()
    var
        DataMigrationStatus: Record "Data Migration Status";
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
        C5DataLoaderStatus: Record "C5 2008 Data Loader Status";
        C5MigrDashboardMgt: Codeunit "C5 2008 Migr. Dashboard Mgt";
        AccountsLoaded: Boolean;
        VendorsLoaded: Boolean;
        CustomersLoaded: Boolean;
        DurationAsInt: BigInteger;
        StartTime: DateTime;
    begin
        StartTime := CurrentDateTime();
        OnFillStagingTablesStarted();
        C5SchemaParameters.GetSingleInstance();

        if not Codeunit.Run(Codeunit::"C5 2008 Unzip", TempNameValueBuffer) then
            StopPendingMigrationsAndSurfaceErrors();

        DataMigrationStatus.SetRange("Migration Type", C5MigrDashboardMgt.GetC5MigrationTypeTxt());
        DataMigrationStatus.SetRange(Status, DataMigrationStatus.Status::Pending);
        DataMigrationStatus.SetRange("Destination Table ID", Database::"G/L Account");
        if DataMigrationStatus.FindFirst() then begin
            LoadC5Accounts();
            AccountsLoaded := true;
        end;

        C5DataLoaderStatus.IncrementProccessedRecords(C5SchemaParameters."Total Accounts");

        DataMigrationStatus.SetRange("Destination Table ID", Database::Vendor);
        if DataMigrationStatus.FindFirst() then begin
            if not AccountsLoaded then
                LoadC5Accounts();
            LoadCustomerVendorItemCommonTables();
            LoadCustomerVendorCommonTables();
            LoadVendorRelatedTables();
            LoadC5Vendors();
            LoadC5VendorGroups();
            LoadC5VendorTrans();
            VendorsLoaded := true;
        end;

        C5DataLoaderStatus.IncrementProccessedRecords(C5SchemaParameters."Total Vendors");
        C5DataLoaderStatus.IncrementProccessedRecords(C5SchemaParameters."Total Vendor Entries" mod 1000);

        DataMigrationStatus.SetRange("Destination Table ID", Database::Customer);
        if DataMigrationStatus.FindFirst() then begin
            if not AccountsLoaded then
                LoadC5Accounts();
            if not VendorsLoaded then begin
                LoadCustomerVendorCommonTables();
                LoadCustomerVendorItemCommonTables();
            end;
            LoadCustomerRelatedTables();
            LoadCustomerItemCommonTables();
            LoadC5Customers();
            LoadC5CustomerGroups();
            LoadC5CustomerTrans();
            CustomersLoaded := true;
        end;

        C5DataLoaderStatus.IncrementProccessedRecords(C5SchemaParameters."Total Customers");
        C5DataLoaderStatus.IncrementProccessedRecords(C5SchemaParameters."Total Customer Entries" mod 1000);

        DataMigrationStatus.SetRange("Destination Table ID", Database::Item);
        if DataMigrationStatus.FindFirst() then begin
            if not AccountsLoaded then
                LoadC5Accounts();
            if not (VendorsLoaded and CustomersLoaded) then
                LoadCustomerVendorItemCommonTables();

            if not CustomersLoaded then
                LoadCustomerItemCommonTables();

            LoadItemRelatedTables();
            LoadC5Items();
            LoadC5InvenBOM();
        end;

        C5DataLoaderStatus.IncrementProccessedRecords(C5SchemaParameters."Total Items");
        C5DataLoaderStatus.IncrementProccessedRecords(C5SchemaParameters."Total Item Entries" mod 1000);

        DataMigrationStatus.SetRange("Destination Table ID", Database::"C5 2008 LedTrans");
        if not DataMigrationStatus.IsEmpty() then begin
            if not AccountsLoaded then
                LoadC5Accounts();
            LoadC5LedTrans();
        end;

        // Delete the blob we no longer need it
        Clear(C5SchemaParameters."Zip File Blob");
        C5SchemaParameters.Modify();

        C5DataLoaderStatus.GetSingleInstance();
        C5DataLoaderStatus.IncrementProccessedRecords(C5DataLoaderStatus.Total - C5DataLoaderStatus.Proccessed);

        DurationAsInt := CurrentDateTime() - StartTime;
        OnFillStagingTablesFinished(DurationAsInt);
    end;

    [EventSubscriber(ObjectType::XmlPort, XMLPORT::"C5 2008 LedTrans", OnThousandAccountTransactionsRead, '', true, true)]
    local procedure OnThousandRecordsRead()
    var
        C5DataLoaderStatus: Record "C5 2008 Data Loader Status";
    begin
        C5DataLoaderStatus.IncrementProccessedRecords(1000);
    end;

    [EventSubscriber(ObjectType::XmlPort, XMLPORT::"C5 2008 CustTrans", OnThousandCustomerTransactionsRead, '', true, true)]
    local procedure OnThousandCustomerTransactionsRead()
    var
        C5DataLoaderStatus: Record "C5 2008 Data Loader Status";
    begin
        C5DataLoaderStatus.IncrementProccessedRecords(1000);
    end;

    [EventSubscriber(ObjectType::XmlPort, XMLPORT::"C5 2008 VendTrans", OnThousandVendorTransactionsRead, '', true, true)]
    local procedure OnThousandVendorTransactionsRead()
    var
        C5DataLoaderStatus: Record "C5 2008 Data Loader Status";
    begin
        C5DataLoaderStatus.IncrementProccessedRecords(1000);
    end;

    [EventSubscriber(ObjectType::XmlPort, XMLPORT::"C5 2008 InvenTrans", OnThousandItemTransactionsRead, '', true, true)]
    local procedure OnThousandItemTransactionsRead()
    var
        C5DataLoaderStatus: Record "C5 2008 Data Loader Status";
    begin
        C5DataLoaderStatus.IncrementProccessedRecords(1000);
    end;

    local procedure LoadVendorRelatedTables()
    begin
        LoadC5VendorDiscGroups();
        LoadC5VendContact();
    end;

    local procedure LoadItemRelatedTables()
    begin
        LoadC5UnitCode();
        LoadC5CN8Code();
        LoadC5InvenCustDisc();
        LoadC5InvenPrice();
        LoadC5InvenItemGroups();
        LoadC5InvenLocation();
        LoadC5InvenTrans();
    end;

    local procedure LoadCustomerVendorItemCommonTables()
    begin
        LoadC5ExchangeRates();
        LoadC5Centre();
        LoadC5Department();
        LoadC5Purpose();
    end;

    local procedure LoadCustomerItemCommonTables()
    begin
        LoadC5InvenPriceGroups();
    end;

    local procedure LoadCustomerVendorCommonTables()
    begin
        LoadC5Payments();
        LoadC5Employees();
        LoadC5Deliveries();
        LoadC5Countries();
    end;

    local procedure LoadCustomerRelatedTables()
    begin
        LoadC5CustDiscGroups();
        LoadC5ProcCodes();
        LoadC5CustContact();
    end;

    local procedure LoadC5InvenPrice()
    var
        C5InvenPrice: Record "C5 2008 InvenPrice";
        TempBlob: Codeunit "Temp Blob";
        C5InvenPriceXmlPort: XmlPort "C5 2008 InvenPrice";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5InvenPrice, CsvProcessedStream, TempBlob) then
            exit;

        C5InvenPriceXmlPort.SetSource(CsvProcessedStream);
        C5InvenPriceXmlPort.Import();
    end;

    local procedure LoadC5InvenItemGroups()
    var
        C5InvenItemGroup: Record "C5 2008 InvenItemGroup";
        TempBlob: Codeunit "Temp Blob";
        C5InvenItemGroupXmlPort: XmlPort "C5 2008 InvenItemGroup";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5InvenItemGroup, CsvProcessedStream, TempBlob) then
            exit;

        C5InvenItemGroupXmlPort.SetSource(CsvProcessedStream);
        C5InvenItemGroupXmlPort.Import();
    end;

    local procedure LoadC5InvenTrans()
    var
        C5InvenTrans: Record "C5 2008 InvenTrans";
        TempBlob: Codeunit "Temp Blob";
        C5InvenTransXmlPort: XmlPort "C5 2008 InvenTrans";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5InvenTrans, CsvProcessedStream, TempBlob) then
            exit;

        C5InvenTransXmlPort.SetSource(CsvProcessedStream);
        C5InvenTransXmlPort.Import();
    end;

    local procedure LoadC5InvenLocation()
    var
        C5InvenLocation: Record "C5 2008 InvenLocation";
        TempBlob: Codeunit "Temp Blob";
        InvenLocationXmlPort: XmlPort "C5 2008 InvenLocationXmlPort";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5InvenLocation, CsvProcessedStream, TempBlob) then
            exit;

        InvenLocationXmlPort.SetSource(CsvProcessedStream);
        InvenLocationXmlPort.Import();
    end;

    local procedure LoadC5Countries()
    var
        C5Country: Record "C5 2008 Country";
        TempBlob: Codeunit "Temp Blob";
        C5CountryXmlPort: XmlPort "C5 2008 Country";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5Country, CsvProcessedStream, TempBlob) then
            exit;

        C5CountryXmlPort.SetSource(CsvProcessedStream);
        C5CountryXmlPort.Import();
    end;

    local procedure LoadC5InvenCustDisc()
    var
        C5InvenCustDisc: Record "C5 2008 InvenCustDisc";
        TempBlob: Codeunit "Temp Blob";
        C5InvenCustDiscXmlPort: XmlPort "C5 2008 InvenCustDisc";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5InvenCustDisc, CsvProcessedStream, TempBlob) then
            exit;

        C5InvenCustDiscXmlPort.SetSource(CsvProcessedStream);
        C5InvenCustDiscXmlPort.Import();
    end;

    local procedure LoadC5InvenPriceGroups()
    var
        C5InvenPriceGroup: Record "C5 2008 InvenPriceGroup";
        TempBlob: Codeunit "Temp Blob";
        C5InvenPrcGroupXmlPort: XmlPort "C5 2008 InvenPrcGroup";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5InvenPriceGroup, CsvProcessedStream, TempBlob) then
            exit;

        C5InvenPrcGroupXmlPort.SetSource(CsvProcessedStream);
        C5InvenPrcGroupXmlPort.Import();
    end;

    local procedure LoadC5CN8Code()
    var
        C5CN8Code: Record "C5 2008 CN8Code";
        TempBlob: Codeunit "Temp Blob";
        C5CN8CodeXmlPort: XmlPort "C5 2008 CN8Code";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5CN8Code, CsvProcessedStream, TempBlob) then
            exit;

        C5CN8CodeXmlPort.SetSource(CsvProcessedStream);
        C5CN8CodeXmlPort.Import();
    end;

    local procedure LoadC5ProcCodes()
    var
        C5ProcCode: Record "C5 2008 ProcCode";
        TempBlob: Codeunit "Temp Blob";
        C5ProcCodeXmlPort: XmlPort "C5 2008 ProcCode";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5ProcCode, CsvProcessedStream, TempBlob) then
            exit;

        C5ProcCodeXmlPort.SetSource(CsvProcessedStream);
        C5ProcCodeXmlPort.Import();
    end;

    local procedure LoadC5UnitCode()
    var
        C5UnitCode: Record "C5 2008 UnitCode";
        TempBlob: Codeunit "Temp Blob";
        C5UnitCodeXmlPort: XmlPort "C5 2008 UnitCode";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5UnitCode, CsvProcessedStream, TempBlob) then
            exit;

        C5UnitCodeXmlPort.SetSource(CsvProcessedStream);
        C5UnitCodeXmlPort.Import();
    end;

    local procedure LoadC5Centre()
    var
        C5Centre: Record "C5 2008 Centre";
        TempBlob: Codeunit "Temp Blob";
        C5CentreXmlPort: XmlPort "C5 2008 Centre";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5Centre, CsvProcessedStream, TempBlob) then
            exit;

        C5CentreXmlPort.SetSource(CsvProcessedStream);
        C5CentreXmlPort.Import();
    end;

    local procedure LoadC5Department()
    var
        C5Department: Record "C5 2008 Department";
        TempBlob: Codeunit "Temp Blob";
        C5DepartmentXmlPort: XmlPort "C5 2008 Department";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5Department, CsvProcessedStream, TempBlob) then
            exit;

        C5DepartmentXmlPort.SetSource(CsvProcessedStream);
        C5DepartmentXmlPort.Import();
    end;

    local procedure LoadC5Purpose()
    var
        C5Purpose: Record "C5 2008 Purpose";
        TempBlob: Codeunit "Temp Blob";
        C5PurposeXmlPort: XmlPort "C5 2008 Purpose";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5Purpose, CsvProcessedStream, TempBlob) then
            exit;

        C5PurposeXmlPort.SetSource(CsvProcessedStream);
        C5PurposeXmlPort.Import();
    end;


    local procedure LoadC5CustDiscGroups()
    var
        C5CustDiscGroup: Record "C5 2008 CustDiscGroup";
        TempBlob: Codeunit "Temp Blob";
        C5CustDiscGroupXmlPort: XmlPort "C5 2008 CustDiscGroup";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5CustDiscGroup, CsvProcessedStream, TempBlob) then
            exit;

        C5CustDiscGroupXmlPort.SetSource(CsvProcessedStream);
        C5CustDiscGroupXmlPort.Import();
    end;

    local procedure LoadC5VendorDiscGroups()
    var
        C5VendDiscGroup: Record "C5 2008 VendDiscGroup";
        TempBlob: Codeunit "Temp Blob";
        C5VendDiscGroupXmlPort: XmlPort "C5 2008 VendDiscGroup";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5VendDiscGroup, CsvProcessedStream, TempBlob) then
            exit;

        C5VendDiscGroupXmlPort.SetSource(CsvProcessedStream);
        C5VendDiscGroupXmlPort.Import();
    end;

    local procedure LoadC5Employees()
    var
        C5Employee: Record "C5 2008 Employee";
        TempBlob: Codeunit "Temp Blob";
        C5EmployeeXmlPort: XmlPort "C5 2008 Employee";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5Employee, CsvProcessedStream, TempBlob) then
            exit;

        C5EmployeeXmlPort.SetSource(CsvProcessedStream);
        C5EmployeeXmlPort.Import();
    end;

    local procedure LoadC5Customers()
    var
        C5CustTable: Record "C5 2008 CustTable";
        TempBlob: Codeunit "Temp Blob";
        C5CustTableXmlPort: XmlPort "C5 2008 CustTable";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5CustTable, CsvProcessedStream, TempBlob) then
            exit;

        C5CustTableXmlPort.SetSource(CsvProcessedStream);
        C5CustTableXmlPort.Import();
    end;

    local procedure LoadC5CustomerGroups()
    var
        C5CustGroup: Record "C5 2008 CustGroup";
        TempBlob: Codeunit "Temp Blob";
        C5CustGroupXmlPort: XmlPort "C5 2008 CustGroup";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5CustGroup, CsvProcessedStream, TempBlob) then
            exit;

        C5CustGroupXmlPort.SetSource(CsvProcessedStream);
        C5CustGroupXmlPort.Import();
    end;

    local procedure LoadC5CustomerTrans()
    var
        C5CustTrans: Record "C5 2008 CustTrans";
        TempBlob: Codeunit "Temp Blob";
        C5CustTransXmlPort: XmlPort "C5 2008 CustTrans";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5CustTrans, CsvProcessedStream, TempBlob) then
            exit;

        C5CustTransXmlPort.SetSource(CsvProcessedStream);
        C5CustTransXmlPort.Import();
    end;

    local procedure LoadC5Accounts()
    var
        C5LedTable: Record "C5 2008 LedTable";
        TempBlob: Codeunit "Temp Blob";
        C5LedTableXmlPort: XmlPort "C5 2008 LedTable";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5LedTable, CsvProcessedStream, TempBlob) then
            exit;

        C5LedTableXmlPort.SetSource(CsvProcessedStream);
        C5LedTableXmlPort.Import();
    end;

    local procedure LoadC5Items()
    var
        C5InvenTable: Record "C5 2008 InvenTable";
        TempBlob: Codeunit "Temp Blob";
        C5InvenTableXmlPort: XmlPort "C5 2008 InvenTable";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5InvenTable, CsvProcessedStream, TempBlob) then
            exit;

        C5InvenTableXmlPort.SetSource(CsvProcessedStream);
        C5InvenTableXmlPort.Import();
    end;

    local procedure LoadC5Vendors()
    var
        C5VendTable: Record "C5 2008 VendTable";
        TempBlob: Codeunit "Temp Blob";
        C5VendTableXmlPort: XmlPort "C5 2008 VendTable";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5VendTable, CsvProcessedStream, TempBlob) then
            exit;

        C5VendTableXmlPort.SetSource(CsvProcessedStream);
        C5VendTableXmlPort.Import();
    end;

    local procedure LoadC5VendorGroups()
    var
        C5VendGroup: Record "C5 2008 VendGroup";
        TempBlob: Codeunit "Temp Blob";
        C5VendGroupXmlPort: XmlPort "C5 2008 VendGroup";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5VendGroup, CsvProcessedStream, TempBlob) then
            exit;

        C5VendGroupXmlPort.SetSource(CsvProcessedStream);
        C5VendGroupXmlPort.Import();
    end;

    local procedure LoadC5VendorTrans()
    var
        C5VendTrans: Record "C5 2008 VendTrans";
        TempBlob: Codeunit "Temp Blob";
        C5VendTransXmlPort: XmlPort "C5 2008 VendTrans";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5VendTrans, CsvProcessedStream, TempBlob) then
            exit;

        C5VendTransXmlPort.SetSource(CsvProcessedStream);
        C5VendTransXmlPort.Import();
    end;

    local procedure LoadC5Deliveries()
    var
        C5Delivery: Record "C5 2008 Delivery";
        TempBlob: Codeunit "Temp Blob";
        C5DeliveryXmlPort: XmlPort "C5 2008 Delivery";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5Delivery, CsvProcessedStream, TempBlob) then
            exit;

        C5DeliveryXmlPort.SetSource(CsvProcessedStream);
        C5DeliveryXmlPort.Import();
    end;

    local procedure LoadC5Payments()
    var
        C5Payment: Record "C5 2008 Payment";
        TempBlob: Codeunit "Temp Blob";
        C5PaymentXmlPort: XmlPort "C5 2008 Payment";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5Payment, CsvProcessedStream, TempBlob) then
            exit;

        C5PaymentXmlPort.SetSource(CsvProcessedStream);
        C5PaymentXmlPort.Import();
    end;

    local procedure LoadC5ExchangeRates()
    var
        C5ExchRate: Record "C5 2008 ExchRate";
        TempBlob: Codeunit "Temp Blob";
        C5ExchRateXmlPort: XmlPort "C5 2008 Exch. Rate";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5ExchRate, CsvProcessedStream, TempBlob) then
            exit;

        C5ExchRateXmlPort.SetSource(CsvProcessedStream);
        C5ExchRateXmlPort.Import();
    end;

    /// <summary>
    /// LoadC5LedTrans.
    /// </summary>
    procedure LoadC5LedTrans()
    var
        C5LedTrans: Record "C5 2008 LedTrans";
        TempBlob: Codeunit "Temp Blob";
        C5LedTransXmlPort: XmlPort "C5 2008 LedTrans";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5LedTrans, CsvProcessedStream, TempBlob) then
            exit;

        C5LedTransXmlPort.SetSource(CsvProcessedStream);
        C5LedTransXmlPort.Import();
    end;

    local procedure LoadC5InvenBOM()
    var
        C5InvenBOM: Record "C5 2008 InvenBOM";
        TempBlob: Codeunit "Temp Blob";
        C5InvenBOMXmlPort: XmlPort "C5 2008 InvenBOM";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5InvenBOM, CsvProcessedStream, TempBlob) then
            exit;

        C5InvenBOMXmlPort.SetSource(CsvProcessedStream);
        C5InvenBOMXmlPort.Import();
    end;

    local procedure LoadC5CustContact()
    var
        C5CustContact: Record "C5 2008 CustContact";
        TempBlob: Codeunit "Temp Blob";
        C5CustContactXmlPort: XmlPort "C5 2008 CustContact";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5CustContact, CsvProcessedStream, TempBlob) then
            exit;

        C5CustContactXmlPort.SetSource(CsvProcessedStream);
        C5CustContactXmlPort.Import();
    end;

    local procedure LoadC5VendContact()
    var
        C5VendContact: Record "C5 2008 VendContact";
        TempBlob: Codeunit "Temp Blob";
        C5VendContactXmlPort: XmlPort "C5 2008 VendContact";
        CsvProcessedStream: InStream;
    begin
        if not OpenRecordFileAndProcessSubsts(C5VendContact, CsvProcessedStream, TempBlob) then
            exit;

        C5VendContactXmlPort.SetSource(CsvProcessedStream);
        C5VendContactXmlPort.Import();
    end;

    local procedure OpenRecordFileAndProcessSubsts(RecordVariant: Variant; var ProcessedStream: InStream; var TempBlob: Codeunit "Temp Blob"): Boolean
    var
        HelperFunction: Codeunit "C5 2008 Helper Functions";
        FileDefinition: Codeunit "C5 2008 File definition";
        Filename: Text;
        FileContentStream: InStream;
    begin
        FileDefinition.GetFileNameForRecord(RecordVariant, Filename);
        if not HelperFunction.GetFileContentAsStream(Filename, TempNameValueBuffer, FileContentStream) then
            exit(false);

        HelperFunctions.ProcessStreamForSubstitutions(TempBlob, FileContentStream, ProcessedStream);
        exit(true);
    end;

    local procedure StopPendingMigrationsAndSurfaceErrors()
    var
        DataMigrationStatus: Record "Data Migration Status";
        DataMigrationError: Record "Data Migration Error";
        C5DataMigrDashboardMgt: Codeunit "C5 2008 Migr. Dashboard Mgt";
    begin
        DataMigrationStatus.SetRange("Migration Type", C5DataMigrDashboardMgt.GetC5MigrationTypeTxt());
        DataMigrationStatus.SetRange(Status, DataMigrationStatus.Status::Pending);
        if DataMigrationStatus.FindSet() then
            repeat
                DataMigrationStatus.Validate(Status, DataMigrationStatus.Status::Stopped);
                DataMigrationStatus.Modify(true);
                DataMigrationError.CreateEntryNoStagingTable(DataMigrationStatus."Migration Type", DataMigrationStatus."Destination Table ID");
            until DataMigrationStatus.Next() = 0;
        // Fail the background session
        Commit();
        Error('');
    end;

    [IntegrationEvent(false, false)]
    local procedure OnFillStagingTablesStarted()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnFillStagingTablesFinished(DurationAsInt: Integer)
    begin
    end;


}
