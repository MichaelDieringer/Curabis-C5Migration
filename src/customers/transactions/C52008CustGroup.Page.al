namespace CurabisC5.CurabisCMigration;


/// <summary>
/// Page C5 CustGroup (ID 51891).
/// </summary>
page 51891 "C5 2008 CustGroup"
{
    PageType = Card;
    SourceTable = "C5 2008 CustGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 2008  Customer Groups';
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Group; Rec.Group)
                {
                    ToolTip = 'Specifies the value of the Customer group field.';
                }
                field(GroupName; Rec.GroupName)
                {
                    ToolTip = 'Specifies the value of the Group name field.';
                }
                field(SalesAcc; Rec.SalesAcc)
                {
                    ToolTip = 'Specifies the value of the Sales a/c field.';
                }
                field(COGSAcc; Rec.COGSAcc)
                {
                    ToolTip = 'Specifies the value of the COGS a/c field.';
                }
                field(InvoiceDisc; Rec.InvoiceDisc)
                {
                    ToolTip = 'Specifies the value of the Invoice disc. field.';
                }
                field(FeeTaxable; Rec.FeeTaxable)
                {
                    ToolTip = 'Specifies the value of the Fee taxable field.';
                }
                field(FeeTaxfree; Rec.FeeTaxfree)
                {
                    ToolTip = 'Specifies the value of the Fee tax free field.';
                }
                field(GroupAccount; Rec.GroupAccount)
                {
                    ToolTip = 'Specifies the value of the Group a/c field.';
                }
                field(CashPayment; Rec.CashPayment)
                {
                    ToolTip = 'Specifies the value of the Cash payment field.';
                }
                field(LineDisc; Rec.LineDisc)
                {
                    ToolTip = 'Specifies the value of the Line disc. field.';
                }
            }
        }
    }
}
#pragma implicitwith restore
