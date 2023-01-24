

/// <summary>
/// Page C5 Delivery (ID 51882).
/// </summary>
#pragma implicitwith disable
page 51882 "C5 Delivery"
{
    PageType = Card;
    SourceTable = "C5 Delivery";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Delivery';
    layout
    {
        area(content)
        {
            group(General)
            {
#pragma warning disable AA0218
                field(Delivery; Rec.Delivery) { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
