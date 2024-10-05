namespace CurabisC5.CurabisCMigration;
using System.Integration;

#pragma implicitwith disable
/// <summary>
/// Page C5 LedTable List (ID 51903).
/// </summary>
page 51903 "C5 LedTable List"
{
    PageType = List;
    SourceTable = "C5 LedTable";
    CardPageId = "C5 LedTable";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    Caption = 'Accounts';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            repeater(General)
            {

#pragma warning disable AA0225
                field("Error Message"; MigrationErrorText)
#pragma warning restore AA0225
                {
                    ApplicationArea = All;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the MigrationErrorText field.';
                }
                field(Account; Rec.Account)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(AccountName; Rec.AccountName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account name field.';
                }
                field(AccountType; Rec.AccountType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the A/c type field.';
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(DCproposal; Rec.DCproposal)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DC proposal field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(MandDepartment; Rec.MandDepartment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mandatory department field.';
                }
                field(OffsetAccount; Rec.OffsetAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offset a/c field.';
                }
                field(Access; Rec.Access)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Access field.';
                }
                field(TotalFromAccount; Rec.TotalFromAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total from field.';
                }
                field(Vat; Rec.Vat)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(BalanceCur; Rec.BalanceCur)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance currency field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(CostType; Rec.CostType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost type field.';
                }
                field(Counterunit; Rec.Counterunit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Counter total field.';
                }
                field(BalanceMST; Rec.BalanceMST)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance in LCY field.';
                }
                field(CompanyGroupAcc; Rec.CompanyGroupAcc)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Corporate a/c field.';
                }
                field(ExchAdjust; Rec.ExchAdjust)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exch. adjustment field.';
                }
                field(Balance02; Rec.Balance02)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance in field.';
                }
                field(EDIIndex; Rec.EDIIndex)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the EDI index field.';
                }
                field(Centre; Rec.Centre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }
                field(MandCentre; Rec.MandCentre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mandatory cost centre field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(MandPurpose; Rec.MandPurpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mandatory purpose field.';
                }
                field(VatBlocked; Rec.VatBlocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT locked field.';
                }
                field(OpeningAccount; Rec.OpeningAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Opening account field.';
                }
                field(DEL_UserLock; Rec.DEL_UserLock)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lock field.';
                }
#pragma warning restore
            }
        }
    }

    var
        C5MigrDashboardMgt: Codeunit "C5 Migr. Dashboard Mgt";
        MigrationErrorText: Text[250];

    trigger OnAfterGetRecord();
    var
        DataMigrationError: Record "Data Migration Error";
    begin
        DataMigrationError.GetErrorMessage(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Rec.RecordId(), MigrationErrorText);
    end;

}
#pragma implicitwith restore
