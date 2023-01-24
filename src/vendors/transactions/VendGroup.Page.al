

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

    layout
    {
        area(content)
        {
            group(General)
            {
#pragma warning disable AA0218
                field(Group; Rec.Group) { ApplicationArea = All; }
                field(GroupName; Rec.GroupName) { ApplicationArea = All; }
                field(InventoryInflowAcc; Rec.InventoryInflowAcc) { ApplicationArea = All; }
                field(RESERVED1; Rec.RESERVED1) { ApplicationArea = All; }
                field(InvoiceDisc; Rec.InvoiceDisc) { ApplicationArea = All; }
                field(FeeTaxable; Rec.FeeTaxable) { ApplicationArea = All; }
                field(FeeTaxfree; Rec.FeeTaxfree) { ApplicationArea = All; }
                field(GroupAccount; Rec.GroupAccount) { ApplicationArea = All; }
                field(CashPayment; Rec.CashPayment) { ApplicationArea = All; }
                field(LineDisc; Rec.LineDisc) { ApplicationArea = All; }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
