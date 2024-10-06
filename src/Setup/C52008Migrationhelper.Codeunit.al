namespace CurabisC5.CurabisCMigration;
using Microsoft.Foundation.Period;
using Microsoft.Finance.VAT.Setup;
using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;
using Microsoft.Foundation.Address;
using Microsoft.Inventory.Item;


codeunit 51802 "C5 2008 Migration helper"
{
    procedure CreateAccountingPeriods(C5migrationSetup: Record "C5 2008 Migration Setup")
    var
        Accountingperiod: Record "Accounting Period";
        CreateFiscalYear: Report "Create Fiscal Year";
        NewPeriod: DateFormula;
        AcceountingeperiodCreatedLbl: Label 'Accounting periods between %1 and %2 created.', Comment = '%1 = startingdate; %2 = endingdate';
        CreateAccountingperiodsConfirmationLbl: Label 'Create accounting periods from %1?', Comment = '%1 = startingdate';
    begin
        if not Confirm(CreateAccountingperiodsConfirmationLbl, true, C5migrationSetup."Detailed G/L entries (start)") then
            exit;

        evaluate(NewPeriod, '<1M>');
        while Accountingperiod."Starting Date" <= WorkDate() do begin
            clear(CreateFiscalYear);
            CreateFiscalYear.HideConfirmationDialog(true);
            CreateFiscalYear.InitializeRequest(12, NewPeriod, C5migrationSetup."Detailed G/L entries (start)");
            CreateFiscalYear.UseRequestPage(false);
            CreateFiscalYear.RunModal();
            Commit();
            Accountingperiod.FindLast();
        end;
        Message(AcceountingeperiodCreatedLbl, C5migrationSetup."Detailed G/L entries (start)", Accountingperiod."Starting Date");
    end;

    procedure CanCreateVATPostingsetup(): Boolean
    var
        Customer: Record Customer;
        Vendor: Record Vendor;
        Item: Record Item;
        HasCustomers: Boolean;
        HasVendors: Boolean;
        HasItems: Boolean;
    begin
        HasCustomers := not Customer.IsEmpty();
        HasVendors := not Vendor.IsEmpty();
        HasItems := not Item.IsEmpty();
        exit(HasCustomers and HasVendors and HasItems);
    end;

    procedure CheckCountrySetupIsDone(): Boolean
    var
        CountryRegion: Record "Country/Region";
        HasEUConfigurations: Boolean;
        HasOutsideConfigurations: Boolean;
    begin
        if CountryRegion.IsEmpty() then
            exit(true); // No countries will apply VAT calculation for domestic trade only

        CountryRegion.setrange("VAT Calculation Type", CountryRegion."VAT Calculation Type"::EU);
        HasEUConfigurations := not CountryRegion.IsEmpty;

        CountryRegion.setrange("VAT Calculation Type", CountryRegion."VAT Calculation Type"::Outside);
        HasOutsideConfigurations := not CountryRegion.IsEmpty;

        exit(HasEUConfigurations and HasOutsideConfigurations);
    end;

    procedure CreateVATPostingGroups(UpdateItems: Boolean; UpdateCustomers: Boolean; UpdateVendors: Boolean)
    var
        VATProductPostingGroup: Record "VAT Product Posting Group";
        VATBusinessPostingGroup: Record "VAT Business Posting Group";
        VATPostingsetup: Record "VAT Posting Setup";
        CountryRegion: Record "Country/Region";
        StdVATProdPostingLbl: Label 'STD';
        StdVATProdPostingDescriptionLbl: Label 'Standard VAT';
        DKVATBusPostingLbl: Label 'DK';
        DKVATBusPostingDescriptionLbl: Label 'Indland';
        EUVATBusPostingLbl: Label 'EU';
        EUVATBusPostingDescriptionLbl: Label 'European Community';
        RestVATBusPostingLbl: Label 'OUT';
        RestVATBusPostingDescriptionLbl: Label 'Outside EC';
        ConfirmSetupCountryLbl: Label 'Country VAT setup is not done. Do you want to call Countries/Regions page and start this work?';
        CountryVATSetupErrorLbl: Label 'Country VAT setup is not done. Please setup countries/regions before creating VAT posting groups.';
    begin
        if not CheckCountrySetupIsDone() then
            if confirm(ConfirmSetupCountryLbl, true) then begin
                page.RunModal(0, CountryRegion);
                if not CheckCountrySetupIsDone() then
                    exit;
            end else
                error(CountryVATSetupErrorLbl);

        if not VATProductPostingGroup.Get(StdVATProdPostingLbl) then begin
            VATProductPostingGroup.Init();
            VATProductPostingGroup.Code := StdVATProdPostingLbl;
            VATProductPostingGroup."Description" := StdVATProdPostingDescriptionLbl;
            VATProductPostingGroup.Insert();
        end;
        if not VATBusinessPostingGroup.Get(DKVATBusPostingLbl) then begin
            VATBusinessPostingGroup.Init();
            VATBusinessPostingGroup.Code := DKVATBusPostingLbl;
            VATBusinessPostingGroup."Description" := DKVATBusPostingDescriptionLbl;
            VATBusinessPostingGroup.Insert();
        end;
        if not VATBusinessPostingGroup.Get(EUVATBusPostingLbl) then begin
            VATBusinessPostingGroup.Init();
            VATBusinessPostingGroup.Code := EUVATBusPostingLbl;
            VATBusinessPostingGroup."Description" := EUVATBusPostingDescriptionLbl;
            VATBusinessPostingGroup.Insert();
        end;
        if not VATBusinessPostingGroup.Get(RestVATBusPostingLbl) then begin
            VATBusinessPostingGroup.Init();
            VATBusinessPostingGroup.Code := RestVATBusPostingLbl;
            VATBusinessPostingGroup."Description" := RestVATBusPostingDescriptionLbl;
            VATBusinessPostingGroup.Insert();
        end;

        if not VATPostingsetup.Get(DKVATBusPostingLbl, StdVATProdPostingLbl) then begin
            VATPostingsetup.Init();
            VATPostingsetup."VAT Bus. Posting Group" := DKVATBusPostingLbl;
            VATPostingsetup."VAT Prod. Posting Group" := StdVATProdPostingLbl;
            VATPostingsetup."VAT %" := 25;
            VATPostingsetup."VAT Identifier" := StdVATProdPostingLbl;
            VATPostingsetup.Insert();
        end;
        if not VATPostingsetup.Get(EUVATBusPostingLbl, StdVATProdPostingLbl) then begin
            VATPostingsetup.Init();
            VATPostingsetup."VAT Bus. Posting Group" := EUVATBusPostingLbl;
            VATPostingsetup."VAT Prod. Posting Group" := StdVATProdPostingLbl;
            VATPostingsetup."VAT %" := 25;
            VATPostingsetup."VAT Calculation Type" := VATPostingsetup."VAT Calculation Type"::"Reverse Charge VAT";
            VATPostingsetup."VAT Identifier" := StdVATProdPostingLbl;
            VATPostingsetup.Insert();
        end;
        if not VATPostingsetup.Get(RestVATBusPostingLbl, StdVATProdPostingLbl) then begin
            VATPostingsetup.Init();
            VATPostingsetup."VAT Bus. Posting Group" := RestVATBusPostingLbl;
            VATPostingsetup."VAT Prod. Posting Group" := StdVATProdPostingLbl;
            VATPostingsetup."VAT %" := 0;
            VATPostingsetup."VAT Identifier" := StdVATProdPostingLbl;
            VATPostingsetup.Insert();
        end;

        if UpdateItems then
            UpdtateItemVATPostingGroup(StdVATProdPostingLbl);

        if UpdateCustomers then
            UpdateCustomerVATPostingGroup(DKVATBusPostingLbl, EUVATBusPostingLbl, RestVATBusPostingLbl);

        if UpdateVendors then
            UpdateVendorVATPostingGroup(DKVATBusPostingLbl, EUVATBusPostingLbl, RestVATBusPostingLbl);

    end;

    procedure UpdtateItemVATPostingGroup(DefVATProdPostingGroup: Code[20])
    var
        Item: Record Item;
    begin
        Item.SetRange("VAT Prod. Posting Group", '');
        if Item.FindSet() then
            repeat
                Item."VAT Prod. Posting Group" := DefVATProdPostingGroup;
                Item.Modify();
            until Item.Next() = 0;
    end;

    procedure UpdateCustomerVATPostingGroup(DKVATBusPostingGroup: Code[20]; EUVATBusPostingGroup: Code[20]; RestVATBusPostingGroup: Code[20])
    var
        Customer: Record Customer;
        CountryRegion: Record "Country/Region";
    begin
        if Customer.FindSet() then
            repeat
                if CountryRegion.Get(Customer."Country/Region Code") then
                    case CountryRegion."VAT Calculation Type" of
                        CountryRegion."VAT Calculation Type"::EU:
                            Customer."VAT Bus. Posting Group" := EUVATBusPostingGroup;
                        CountryRegion."VAT Calculation Type"::Outside:
                            Customer."VAT Bus. Posting Group" := RestVATBusPostingGroup;
                        else
                            Customer."VAT Bus. Posting Group" := DKVATBusPostingGroup;
                    end;
                Customer.Modify();
            until Customer.Next() = 0;
    end;

    procedure UpdateVendorVATPostingGroup(DKVATBusPostingGroup: Code[20]; EUVATBusPostingGroup: Code[20]; RestVATBusPostingGroup: Code[20])
    var
        Vendor: Record Vendor;
        CountryRegion: Record "Country/Region";
    begin
        if Vendor.FindSet() then
            repeat
                if CountryRegion.Get(Vendor."Country/Region Code") then
                    case CountryRegion."VAT Calculation Type" of
                        CountryRegion."VAT Calculation Type"::EU:
                            Vendor."VAT Bus. Posting Group" := EUVATBusPostingGroup;
                        CountryRegion."VAT Calculation Type"::Outside:
                            Vendor."VAT Bus. Posting Group" := RestVATBusPostingGroup;
                        else
                            Vendor."VAT Bus. Posting Group" := DKVATBusPostingGroup;
                    end;
                Vendor.Modify();
            until Vendor.Next() = 0;
    end;

}
