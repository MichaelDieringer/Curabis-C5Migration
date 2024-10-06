namespace CurabisC5.CurabisCMigration;


/// <summary>
/// Page C5 CustDiscGroup (ID 51883).
/// </summary>
page 51883 "C5 2008 CustDiscGroup"
{
    PageType = Card;
    SourceTable = "C5 2008 CustDiscGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Customer Discount Groups';
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
            }
        }
    }
}
#pragma implicitwith restore
