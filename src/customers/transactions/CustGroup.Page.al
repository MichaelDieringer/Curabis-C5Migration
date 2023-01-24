


/// <summary>
/// Page C5 CustGroup (ID 51891).
/// </summary>
page 51891 "C5 CustGroup"
{
    PageType = Card;
    SourceTable = "C5 CustGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Customer Groups';

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Group; Rec.Group) { ApplicationArea = All; }
                field(GroupName; Rec.GroupName) { ApplicationArea = All; }
                field(SalesAcc; Rec.SalesAcc) { ApplicationArea = All; }
                field(COGSAcc; Rec.COGSAcc) { ApplicationArea = All; }
                field(InvoiceDisc; Rec.InvoiceDisc) { ApplicationArea = All; }
                field(FeeTaxable; Rec.FeeTaxable) { ApplicationArea = All; }
                field(FeeTaxfree; Rec.FeeTaxfree) { ApplicationArea = All; }
                field(GroupAccount; Rec.GroupAccount) { ApplicationArea = All; }
                field(CashPayment; Rec.CashPayment) { ApplicationArea = All; }
                field(LineDisc; Rec.LineDisc) { ApplicationArea = All; }
            }
        }
    }
}
#pragma implicitwith restore
