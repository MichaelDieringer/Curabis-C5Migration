

#pragma implicitwith disable
/// <summary>
/// Page C5 VendDiscGroup (ID 51886).
/// </summary>
page 51886 "C5 VendDiscGroup"
{
    PageType = Card;
    SourceTable = "C5 VendDiscGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Vendor Discount Groups';

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
