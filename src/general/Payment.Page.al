

#pragma implicitwith disable
/// <summary>
/// Page C5 Payment (ID 51869).
/// </summary>
page 51869 "C5 Payment"
{
    PageType = Card;
    SourceTable = "C5 Payment";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Payment';

    layout
    {
        area(content)
        {
            group(General)
            {
#pragma warning disable AA0218
                field(Payment; Rec.Payment) { ApplicationArea = All; }
                field(Txt; Rec.Txt) { ApplicationArea = All; }
                field(Method; Rec.Method) { ApplicationArea = All; }
                field(Qty; Rec.Qty) { ApplicationArea = All; }
                field(UnitCode; Rec.UnitCode) { ApplicationArea = All; }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
