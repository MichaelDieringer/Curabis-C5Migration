

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenDiscGroup (ID 51885).
/// </summary>
page 51885 "C5 InvenDiscGroup"
{
    PageType = Card;
    SourceTable = "C5 InvenDiscGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Inventory Discount';
    layout
    {
        area(content)
        {
            group(General)
            {
#pragma warning disable AA0218
                field(DiscGroup; Rec.DiscGroup) { ApplicationArea = All; }
                field(Comment; Rec.Comment) { ApplicationArea = All; }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
