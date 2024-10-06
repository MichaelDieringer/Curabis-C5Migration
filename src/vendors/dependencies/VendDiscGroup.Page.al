namespace CurabisC5.CurabisCMigration;

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
    Caption = 'C5 2008 Vendor Discount Groups';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {

                field(DiscGroup; Rec.DiscGroup)
                {
                    ToolTip = 'Specifies the value of the Discount group field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
