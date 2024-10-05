namespace CurabisC5.CurabisCMigration;

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
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {

                field(DiscGroup; Rec.DiscGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount group field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
