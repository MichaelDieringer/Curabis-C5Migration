namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 VendGroup (ID 51893).
/// </summary>
page 51893 "C5 VendGroup"
{
    PageType = Card;
    SourceTable = "C5 VendGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Vendor Groups';
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
                    ToolTip = 'Specifies the value of the Vendor group field.';
                }
                field(GroupName; Rec.GroupName)
                {
                    ToolTip = 'Specifies the value of the Group name field.';
                }
                field(InventoryInflowAcc; Rec.InventoryInflowAcc)
                {
                    ToolTip = 'Specifies the value of the Inven. inflow field.';
                }
                field(RESERVED1; Rec.RESERVED1)
                {
                    ToolTip = 'Specifies the value of the RESERVED1 field.';
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
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
