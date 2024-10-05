namespace CurabisC5.CurabisCMigration;
using System.Integration;

/// <summary>
/// Page C5 LedTrans List (ID 1902).
/// </summary>
#pragma implicitwith disable
page 51902 "C5 LedTrans List"
{
    PageType = List;
    SourceTable = "C5 LedTrans";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    Caption = 'C5 Ledger Entries';
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Error Message"; MigrationErrorText)
                {
                    ApplicationArea = All;
                    Caption = 'Error Message';

                    Enabled = false;
                    ToolTip = 'Specifies the value of the Error Message field.';
                }
                field(Account; Rec.Account)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(BudgetCode; Rec.BudgetCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget code field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Date_; Rec.Date_)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Voucher; Rec.Voucher)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Voucher field.';
                }
                field(Txt; Rec.Txt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Text field.';
                }
                field(AmountMST; Rec.AmountMST)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount LCY field.';
                }
                field(AmountCur; Rec.AmountCur)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount in cur. field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(Vat; Rec.Vat)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(VatAmount; Rec.VatAmount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT amount LCY field.';
                }
                field(Qty; Rec.Qty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field(TransType; Rec.TransType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry type field.';
                }
                field(DueDate; Rec.DueDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Due field.';
                }
                field(Transaction; Rec.Transaction)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction field.';
                }
                field(CreatedBy; Rec.CreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created by field.';
                }
                field(JourNumber; Rec.JourNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Journal no. field.';
                }
                field(Amount2; Rec.Amount2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount in field.';
                }
                field(LockAmount2; Rec.LockAmount2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lock Amount 2 field.';
                }
                field(Centre; Rec.Centre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(ReconcileNo; Rec.ReconcileNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reconciliation no. field.';
                }
                field(VatRepCounter; Rec.VatRepCounter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT report counter field.';
                }
                field(VatPeriodRecId; Rec.VatPeriodRecId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Settlement period field.';
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
