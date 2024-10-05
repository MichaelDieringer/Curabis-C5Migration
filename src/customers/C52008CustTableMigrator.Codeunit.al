namespace CurabisC5.CurabisCMigration;
using System.Integration;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Sales.Customer;
using Microsoft.Finance.Currency;

/// <summary>
/// Codeunit C5 CustTable Migrator (ID 1866).
/// </summary>
codeunit 51866 "C5 2008 CustTable Migrator"
{
    TableNo = "C5 2008 CustTable";

    var
        CustomerDataMigrationFacade: Codeunit "Customer Data Migration Facade";
        ReferencedCustomerDoesNotExistErr: Label 'Customer %1 is related to %2, but we couldn’t find %2. Try migrating again.', Comment = '%1 is the current customer number, %2 is the referenced customer''s number';
        CustDiscGroupGroupNotFoundErr: Label 'The CustDiscGroup ''%1'' was not found.', Comment = '%1 = customer discount group';
        DeliveryNotFoundErr: Label 'The Delivery ''%1'' was not found.', Comment = '%1 = customer discount group';
        EmployeeNotFoundErr: Label 'The Employee ''%1'' was not found.', Comment = '%1 = employee';
        InventPriceGroupNotFoundErr: Label 'The InventPriceGroup ''%1'' was not found.', Comment = '%1 = invent price group group';
        ProcCodeNotFoundErr: Label 'The ProcCode ''%1'' was not found.', Comment = '%1 = proc Code ';
        PaymentNotFoundErr: Label 'The Payment ''%1'' was not found.', Comment = '%1 = payment';
        GeneralJournalBatchNameTxt: Label 'CUSTMIGR', Locked = true;

    /// <summary>
    /// OnMigrateCustomer.
    /// </summary>
    /// <param name="VAR Sender">Codeunit "Customer Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Data Migration Facade", OnMigrateCustomer, '', true, true)]
    local procedure OnMigrateCustomer(VAR Sender: Codeunit "Customer Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5CustTable: Record "C5 2008 CustTable";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 CustTable" then
            exit;
        C5CustTable.Get(RecordIdToMigrate);
        MigrateCustomerDetails(C5CustTable, Sender);
    end;

    /// <summary>
    /// OnMigrateCustomerDimensions.
    /// </summary>
    /// <param name="VAR Sender">Codeunit "Customer Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Data Migration Facade", OnMigrateCustomerDimensions, '', true, true)]
    local procedure OnMigrateCustomerDimensions(VAR Sender: Codeunit "Customer Data Migration Facade"; RecordIdToMigrate: RecordId)
    var
        C5CustTable: Record "C5 2008 CustTable";
        C5HelperFunctions: Codeunit "C5 2008 Helper Functions";
    begin
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 CustTable" then
            exit;

        C5CustTable.Get(RecordIdToMigrate);
        if C5CustTable.Department <> '' then
            Sender.CreateDefaultDimensionAndRequirementsIfNeeded(C5HelperFunctions.GetDepartmentDimensionCodeTxt(),
                C5HelperFunctions.GetDepartmentDimensionDescTxt(),
                C5CustTable.Department,
                C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Department", C5CustTable.Department));
        if C5CustTable.Centre <> '' then
            Sender.CreateDefaultDimensionAndRequirementsIfNeeded(C5HelperFunctions.GetCostCenterDimensionCodeTxt(),
                C5HelperFunctions.GetCostCenterDimensionDescTxt(),
                C5CustTable.Centre,
                C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Centre", C5CustTable.Centre));
        if C5CustTable.Purpose <> '' then
            Sender.CreateDefaultDimensionAndRequirementsIfNeeded(C5HelperFunctions.GetPurposeDimensionCodeTxt(),
                C5HelperFunctions.GetPurposeDimensionDescTxt(),
                C5CustTable.Purpose,
                C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Purpose", C5CustTable.Purpose));
    end;

    /// <summary>
    /// OnMigrateCustomerPostingGroups.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Customer Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    /// <param name="ChartOfAccountsMigrated">Boolean.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Data Migration Facade", OnMigrateCustomerPostingGroups, '', true, true)]
    local procedure OnMigrateCustomerPostingGroups(var Sender: Codeunit "Customer Data Migration Facade"; RecordIdToMigrate: RecordId; ChartOfAccountsMigrated: Boolean)
    var
        C5CustTable: Record "C5 2008 CustTable";
        C5CustGroup: Record "C5 2008 CustGroup";
        C5LedTableMigrator: Codeunit "C5 2008 LedTable Migrator";
    begin
        if not ChartOfAccountsMigrated then
            exit;
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 CustTable" then
            exit;

        C5CustTable.Get(RecordIdToMigrate);
        C5CustGroup.SetRange(Group, C5CustTable.Group);
        C5CustGroup.FindFirst();

        if ChartOfAccountsMigrated and (C5CustGroup.GroupAccount <> '') then
            Sender.CreatePostingSetupIfNeeded(C5CustGroup.Group,
                                              C5CustGroup.GroupName,
                                              C5LedTableMigrator.FillWithLeadingZeros(C5CustGroup.GroupAccount))
        else
            Sender.CreatePostingSetupIfNeeded(C5CustGroup.Group, C5CustGroup.GroupName, '');
        Sender.SetCustomerPostingGroup(C5CustGroup.Group);
        Sender.ModifyCustomer(true);
    end;

    /// <summary>
    /// OnMigrateCustomerTransactions.
    /// </summary>
    /// <param name="Sender">VAR Codeunit "Customer Data Migration Facade".</param>
    /// <param name="RecordIdToMigrate">RecordId.</param>
    /// <param name="ChartOfAccountsMigrated">Boolean.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Data Migration Facade", OnMigrateCustomerTransactions, '', true, true)]
    local procedure OnMigrateCustomerTransactions(var Sender: Codeunit "Customer Data Migration Facade"; RecordIdToMigrate: RecordId; ChartOfAccountsMigrated: Boolean)
    var
        C5CustTable: Record "C5 2008 CustTable";
        C5CustGroup: Record "C5 2008 CustGroup";
        C5CustTrans: Record "C5 2008 CustTrans";
        GLAccount: Record "G/L Account";
        C5HelperFunctions: Codeunit "C5 2008 Helper Functions";
        C5LedTableMigrator: Codeunit "C5 2008 LedTable Migrator";
    begin
        if not ChartOfAccountsMigrated then
            exit;
        if RecordIdToMigrate.TableNo() <> Database::"C5 2008 CustTable" then
            exit;

        C5CustTable.Get(RecordIdToMigrate);

        Sender.CreateGeneralJournalBatchIfNeeded(GetHardCodedBatchName(), '', '');

        C5CustGroup.SetRange(Group, C5CustTable.Group);
        C5CustGroup.FindFirst();

        If GLAccount.get(C5LedTableMigrator.FillWithLeadingZeros(C5CustGroup.GroupAccount)) then begin
            GLAccount."Direct Posting" := true;
            GLAccount.Modify();
        end;

        C5CustTrans.SetRange(Account, C5CustTable.Account);
        C5CustTrans.SetRange(Open, C5CustTrans.Open::Yes);
        C5CustTrans.SetRange(BudgetCode, C5CustTrans.BudgetCode::Actual);
        if C5CustTrans.FindSet() then
            repeat
                C5HelperFunctions.MigrateExchangeRatesForCurrency(C5CustTrans.Currency);

                Sender.CreateGeneralJournalLine(
                    GetHardCodedBatchName(),
                    'C5MIGRATE',
                    CopyStr(STRSUBSTNO('%1 %2', C5CustTrans.InvoiceNumber, C5CustTrans.Txt), 1, 50),
                    C5CustTrans.Date_,
                    C5CustTrans.DueDate,
                    C5CustTrans.AmountCur,
                    C5CustTrans.AmountMST,
                    C5CustTrans.Currency,
                    C5LedTableMigrator.FillWithLeadingZeros(C5CustGroup.GroupAccount));
                Sender.SetGeneralJournalLineDimension(C5HelperFunctions.GetDepartmentDimensionCodeTxt(),
                    C5HelperFunctions.GetDepartmentDimensionDescTxt(),
                    C5CustTrans.Department,
                    C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Department", C5CustTrans.Department));
                Sender.SetGeneralJournalLineDimension(C5HelperFunctions.GetCostCenterDimensionCodeTxt(),
                C5HelperFunctions.GetCostCenterDimensionDescTxt(),
                C5CustTrans.Centre,
                C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Centre", C5CustTrans.Centre));
                Sender.SetGeneralJournalLineDimension(C5HelperFunctions.GetPurposeDimensionCodeTxt(),
                    C5HelperFunctions.GetPurposeDimensionDescTxt(),
                    C5CustTrans.Purpose,
                    C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Purpose", C5CustTrans.Purpose));
            until C5CustTrans.Next() = 0;
    end;

    local procedure ClearPhoneNumber(OldPhoneNo: Text[20]): Text[20]
    begin
        exit(DelChr(OldPhoneNo, '=', 'ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ ,.-_:=abcdefghijklmenoqrstuvwxyz'));
    end;

    local procedure MigrateCustomerDetails(C5CustTable: Record "C5 2008 CustTable"; CustomerDataMigrationFacadeLocal: Codeunit "Customer Data Migration Facade")
    var
        C5CustContact: Record "C5 CustContact";
        CurrencyLocal: Record Currency;
        C5HelperFunctions: Codeunit "C5 2008 Helper Functions";
        PostCode: Code[20];
        City: Text[30];
        CountryRegionCode: Code[10];
    begin
        if not CustomerDataMigrationFacadeLocal.CreateCustomerIfNeeded(C5CustTable.Account, C5CustTable.Name) then
            exit;

        if C5CustTable.Currency <> '' then
            if not CurrencyLocal.Get(C5CustTable.Currency) then begin
                CurrencyLocal.Code := C5CustTable.Currency;
                CurrencyLocal.Description := 'C5 - ' + C5CustTable.Currency;
                CurrencyLocal.Insert();
            end;

        CustomerDataMigrationFacadeLocal.SetSearchName(C5CustTable.SearchName);

        C5HelperFunctions.ExtractPostCodeAndCity(C5CustTable.ZipCity, C5CustTable.Country, PostCode, City, CountryRegionCode);
        CustomerDataMigrationFacadeLocal.SetAddress(C5CustTable.Address1, C5CustTable.Address2, CountryRegionCode, PostCode, City);

        CustomerDataMigrationFacadeLocal.SetPhoneNo(ClearPhoneNumber(C5CustTable.Phone));
        CustomerDataMigrationFacadeLocal.SetEmail(C5CustTable.Email);
        CustomerDataMigrationFacadeLocal.SetTelexNo(ClearPhoneNumber(C5CustTable.CellPhone));
        CustomerDataMigrationFacadeLocal.SetCreditLimitLCY(C5CustTable.BalanceMax);
        CustomerDataMigrationFacadeLocal.SetCurrencyCode(C5HelperFunctions.FixLCYCode(C5CustTable.Currency)); // assume the currency is already present
        CustomerDataMigrationFacadeLocal.SetCustomerPriceGroup(CreateCustomerPriceGroupIfNeeded(C5CustTable.PriceGroup));
        CustomerDataMigrationFacadeLocal.SetLanguageCode(C5HelperFunctions.GetLanguageCodeForC5Language(C5CustTable.Language_));
        CustomerDataMigrationFacadeLocal.SetPaymentTermsCode(CreatePaymentTermsIfNeeded(C5CustTable.Payment));
        CustomerDataMigrationFacadeLocal.SetSalespersonCode(CreateSalespersonPurchaserIfNeeded(C5CustTable.SalesRep));
        CustomerDataMigrationFacadeLocal.SetShipmentMethodCode(CreateShipmentMethodIfNeeded(C5CustTable.Delivery));
        CustomerDataMigrationFacadeLocal.SetInvoiceDiscCode(CreateCustomerDiscountGroupIfNeeded(C5CustTable.DiscGroup));

        CustomerDataMigrationFacadeLocal.SetBlocked(ConvertBlocked(C5CustTable));

        // reference to another customer
        // to make sure the bill to customer exists
        if (C5CustTable.InvoiceAccount <> '') and not CustomerDataMigrationFacadeLocal.DoesCustomerExist(C5CustTable.InvoiceAccount) then
            Error(ReferencedCustomerDoesNotExistErr, C5CustTable.Account, C5CustTable.InvoiceAccount);

        CustomerDataMigrationFacadeLocal.SetBillToCustomerNo(C5CustTable.InvoiceAccount);

        CustomerDataMigrationFacadeLocal.SetPaymentMethodCode(CreatePaymentMethodIfNeeded(C5CustTable.PaymentMode));
        CustomerDataMigrationFacadeLocal.SetFaxNo(C5CustTable.Fax);
        CustomerDataMigrationFacadeLocal.SetVATRegistrationNo(CopyStr(C5CustTable.VatNumber, 1, 20)); // VAT field length on the customer table is 20
        CustomerDataMigrationFacadeLocal.SetHomePage(C5CustTable.URL);
        CustomerDataMigrationFacadeLocal.SetContact(C5CustTable.Attention);

        C5CustContact.SetRange(Account, C5CustTable.Account);
        C5CustContact.SetRange(PrimaryContact, C5CustContact.PrimaryContact::No);
        if C5CustContact.FindSet() then
            repeat
                C5HelperFunctions.ExtractPostCodeAndCity(C5CustContact.ZipCity, C5CustContact.Country, PostCode, City, CountryRegionCode);
                CustomerDataMigrationFacadeLocal.SetCustomerAlternativeContact(
                    C5CustContact.Name, C5CustContact.Address1, C5CustContact.Address2,
                    PostCode, City, CountryRegionCode, C5CustContact.Email, ClearPhoneNumber(C5CustContact.Phone),
                    C5CustContact.Fax, ClearPhoneNumber(C5CustContact.CellPhone));
            until C5CustContact.Next() = 0;

        CustomerDataMigrationFacadeLocal.ModifyCustomer(true);
    end;

    local procedure CreatePaymentTermsIfNeeded(C5PaymentTxt: Code[10]): Code[10]
    var
        C5Payment: Record "C5 2008 Payment";
        DueDateAsDateFormula: DateFormula;
        DueDateCalculation: Text;
        DayCalcLbl: Label ' +%1D', Locked = true;
        WeekCalcLbl: Label ' +%1W', Locked = true;
        MonthCalcLbl: Label ' +%1M', Locked = true;
    begin
        if C5PaymentTxt = '' then
            exit(C5PaymentTxt);

        C5Payment.SetRange(Payment, C5PaymentTxt);
        if not C5Payment.FindFirst() then
            Error(PaymentNotFoundErr, C5PaymentTxt);

        case C5Payment.Method of
            C5Payment.Method::Net:
                DueDateCalculation := '';
            C5Payment.Method::"Cur. month":
                DueDateCalculation := 'CM';
            C5Payment.Method::"Cur. quarter":
                DueDateCalculation := 'CQ';
            C5Payment.Method::"Cur. year":
                DueDateCalculation := 'CY';
            C5Payment.Method::"Cur. week":
                DueDateCalculation := 'CW';
        end;
        case C5Payment.UnitCode of
            C5Payment.UnitCode::Day:
                DueDateCalculation += StrSubstNo(DayCalcLbl, C5Payment.Qty);
            C5Payment.UnitCode::Week:
                DueDateCalculation += StrSubstNo(WeekCalcLbl, C5Payment.Qty);
            C5Payment.UnitCode::Month:
                DueDateCalculation += StrSubstNo(MonthCalcLbl, C5Payment.Qty);
        end;
        DueDateCalculation := StrSubstNo('<%1>', DueDateCalculation);
        Evaluate(DueDateAsDateFormula, DueDateCalculation);

        exit(CustomerDataMigrationFacade.CreatePaymentTermsIfNeeded(
            C5Payment.Payment,
            C5Payment.Txt,
            DueDateAsDateFormula));
    end;

    local procedure CreatePaymentMethodIfNeeded(C5ProcCodeTxt: Text[10]): Code[10]
    var
        C5ProcCode: Record "C5 ProcCode";
    begin
        if C5ProcCodeTxt = '' then
            exit(C5ProcCodeTxt);

        C5ProcCode.SetRange(Code, C5ProcCodeTxt);
        // only migrates the payment methods for customers
        C5ProcCode.SetRange(Type, C5ProcCode.Type::Customer);
        if not C5ProcCode.FindFirst() then
            Error(ProcCodeNotFoundErr, C5ProcCode);

        exit(CustomerDataMigrationFacade.CreatePaymentMethodIfNeeded(C5ProcCode.Code, C5ProcCode.Name));
        // specifications from C5 table 102 are not migrated
    end;

    local procedure CreateCustomerPriceGroupIfNeeded(C5InvenPriceGroupTxt: Code[10]): Code[10]
    var
        C5InvenPriceGroup: Record "C5 2008 InvenPriceGroup";
    begin
        if C5InvenPriceGroupTxt = '' then
            exit(C5InvenPriceGroupTxt);

        C5InvenPriceGroup.SetRange(Group, C5InvenPriceGroupTxt);
        if not C5InvenPriceGroup.FindFirst() then
            Error(InventPriceGroupNotFoundErr, C5InvenPriceGroup);

        exit(CustomerDataMigrationFacade.CreateCustomerPriceGroupIfNeeded(
            C5InvenPriceGroup.Group,
            C5InvenPriceGroup.GroupName,
            C5InvenPriceGroup.InclVat = C5InvenPriceGroup.InclVat::Yes));
    end;

    local procedure CreateSalespersonPurchaserIfNeeded(C5EmployeeTxt: Code[10]): Code[20]
    var
        C5Employee: Record "C5 2008 Employee";
    begin
        if C5EmployeeTxt = '' then
            exit(C5EmployeeTxt);

        C5Employee.SetRange(Employee, C5EmployeeTxt);
        if not C5Employee.FindFirst() then
            Error(EmployeeNotFoundErr, C5Employee);

        exit(CustomerDataMigrationFacade.CreateSalespersonPurchaserIfNeeded(
            C5Employee.Employee,
            C5Employee.Name,
            ClearPhoneNumber(C5Employee.Phone),
            C5Employee.Email));
    end;

    local procedure CreateShipmentMethodIfNeeded(C5DeliveryTxt: Code[10]): Code[10]
    var
        C5Delivery: Record "C5 2008 Delivery";
    begin
        if C5DeliveryTxt = '' then
            exit(C5DeliveryTxt);

        C5Delivery.SetRange(Delivery, C5DeliveryTxt);
        if not C5Delivery.FindFirst() then
            Error(DeliveryNotFoundErr, C5Delivery);

        exit(CustomerDataMigrationFacade.CreateShipmentMethodIfNeeded(C5Delivery.Delivery, C5Delivery.Name));
    end;

    local procedure CreateCustomerDiscountGroupIfNeeded(C5DiscGroup: Code[10]): Code[20]
    var
        C5CustDiscGroup: Record "C5 CustDiscGroup";
    begin
        if C5DiscGroup = '' then
            exit(C5DiscGroup);

        C5CustDiscGroup.SetRange(DiscGroup, C5DiscGroup);
        if not C5CustDiscGroup.FindFirst() then
            Error(CustDiscGroupGroupNotFoundErr, C5DiscGroup);

        exit(CustomerDataMigrationFacade.CreateCustomerDiscountGroupIfNeeded(C5CustDiscGroup.DiscGroup, C5CustDiscGroup.Comment));
    end;

    local procedure ConvertBLocked(C5CustTable: Record "C5 2008 CustTable"): enum "Customer Blocked"
    var
        Blocked: enum "Customer Blocked";
    begin
        case C5CustTable.Blocked of
            C5CustTable.Blocked::No:
                exit(Blocked::" ");
            C5CustTable.Blocked::Invoicing:
                exit(Blocked::Invoice);
            C5CustTable.Blocked::Delivery:
                exit(Blocked::Ship);
            C5CustTable.Blocked::Yes:
                exit(Blocked::All);
        end;
    end;

    /// <summary>
    /// GetHardCodedBatchName.
    /// </summary>
    /// <returns>Return value of type Code[10].</returns>
    procedure GetHardCodedBatchName(): Code[10]
    begin
        exit(CopyStr(GeneralJournalBatchNameTxt, 1, 10));
    end;
}