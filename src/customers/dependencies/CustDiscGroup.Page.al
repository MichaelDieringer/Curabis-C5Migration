


/// <summary>
/// Page C5 CustDiscGroup (ID 51883).
/// </summary>
page 51883 "C5 CustDiscGroup"
{
    PageType = Card;
    SourceTable = "C5 CustDiscGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Customer Discount Groups';
    layout
    {
        area(content)
        {
            group(General)
            {
                field(DiscGroup; Rec.DiscGroup) { ApplicationArea = All; }
                field(Comment; Rec.Comment) { ApplicationArea = All; }
            }
        }
    }
}
#pragma implicitwith restore
