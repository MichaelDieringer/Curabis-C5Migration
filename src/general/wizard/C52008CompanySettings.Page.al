namespace CurabisC5.CurabisCMigration;
using Microsoft.Foundation.Period;
using Microsoft.Finance.GeneralLedger.Setup;
using System.Environment.Configuration;
using Microsoft.Sales.Setup;

/// <summary>
/// Page C5 Company Settings (ID 51904).
/// </summary>
page 51904 "C5 2008 Company Settings"
{
    Caption = ' ';
    PageType = NavigatePage;

    layout
    {
        area(content)
        {
            label(Title)
            {
                Caption = 'Some information is missing.';
                Style = StrongAccent;
                ApplicationArea = All;
            }

            label(Line1)
            {
                Caption = 'The company that you are importing data to is missing some information. Without it, the migration will contain errors that you will have to fix later.';
                Style = Subordinate;
                ApplicationArea = All;
            }
            field(CurrentPeriod; CurrentPeriodValue)
            {
                ApplicationArea = All;
                Caption = 'Current Period';
                ToolTip = 'Specifies the start date of the current accounting period. Transactions after this date are migrated individually. Transactions before this date are aggregated per account, and migrated as a single amount.';
            }
            field(LocalCurrencyCode; LocalCurrencyCodeValue)
            {
                ApplicationArea = All;
                Caption = 'Local Currency Code';
                Visible = IsLocalCurrencyFieldVisible;
                ToolTip = 'Specifies the currency code for your company.';
            }
            field(CurrentUOM; CurrentUOMValue)
            {
                ApplicationArea = All;
                Caption = 'Unit of Measure Code';
                ToolTip = 'Specifies the Unit of Measure Code used for C5 items with a blank UOM Code. All C5 Items with a blank Unit Of measure will have this value assigned, when transfered to Business Central.';
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(OK)
            {
                InFooterBar = true;
                Image = NextRecord;
                ApplicationArea = All;
                ToolTip = 'Executes the OK action.';
                trigger OnAction();
                begin
                    SaveCurrentPeriod();
                    CurrPage.Close();
                end;
            }
            action(FeatureManagement)
            {

                ApplicationArea = All;
                Visible = not IsSalesPriceFeatureEnabled;
                Caption = 'Features';
                InFooterBar = true;
                Image = MaintenanceLedgerEntries;
                ToolTip = 'Open the Feature Management page.';
                trigger OnAction();
                var
                    FeatureManagementFacade: Codeunit "Feature Management Facade";
                begin
                    Page.RunModal(Page::"Feature Management");
                    IsSalesPriceFeatureEnabled := FeatureManagementFacade.IsEnabled('Salesprices');
                end;
            }
        }
    }
    var
        CurrentPeriodValue: Date;
        LocalCurrencyCodeValue: Code[3];
        IsLocalCurrencyFieldVisible: Boolean;
        IsSalesPriceFeatureEnabled: Boolean;
        CurrentUOMValue: code[10];


    trigger OnOpenPage();
    var
        AccountingPeriod: Record "Accounting Period";
        GeneralLedgerSetup: Record "General Ledger Setup";
        SalesReceivableSetup: Record "Sales & Receivables Setup";
        FeatureManagementFacade: Codeunit "Feature Management Facade";
    begin
        IsSalesPriceFeatureEnabled := FeatureManagementFacade.IsEnabled('Salesprices');
        GeneralLedgerSetup.Get();
        if GeneralLedgerSetup."LCY Code" = '' then
            IsLocalCurrencyFieldVisible := true;
        SalesReceivableSetup.Get();

        AccountingPeriod.SetRange("New Fiscal Year", true);
        AccountingPeriod.SetFilter("Starting Date", '<=%1', WorkDate());
        AccountingPeriod.SetAscending("Starting Date", true);
        if AccountingPeriod.FindLast() then
            CurrentPeriodValue := AccountingPeriod."Starting Date"
        else
            CurrentPeriodValue := CalcDate('<CY-1Y+1D>', WorkDate());
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean;
    begin
        if not IsSalesPriceFeatureEnabled then
            exit(false);
        SaveCurrentPeriod();
        SaveLocalCurrency();
        SaveDefaultITemUOMCode();
        exit(true);
    end;

    local procedure SaveCurrentPeriod()
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
    begin
        C5SchemaParameters.GetSingleInstance();
        C5SchemaParameters.Validate(CurrentPeriod, CurrentPeriodValue);
        C5SchemaParameters.Modify();
    end;

    local procedure SaveDefaultITemUOMCode()
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
    begin
        C5SchemaParameters.GetSingleInstance();
        C5SchemaParameters.Validate("Unit of Measure Code", CurrentUOMValue);
        C5SchemaParameters.Modify();
    end;

    local procedure SaveLocalCurrency()
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        if LocalCurrencyCodeValue = '' then
            exit;

        GeneralLedgerSetup.Get();
        GeneralLedgerSetup.Validate("LCY Code", LocalCurrencyCodeValue);
        GeneralLedgerSetup.Modify(true);

    end;

}

