namespace CurabisC5.CurabisCMigration;

page 51802 "C5 2008 CustDiscGroupList"
{
    ApplicationArea = All;
    Caption = '2C5 008 CustDiscGroupList';
    InsertAllowed = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "C5 2008 CustDiscGroup";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(DiscGroup; Rec.DiscGroup)
                {
                    ToolTip = 'Specifies the value of the Discount group field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(LastChanged; Rec.LastChanged)
                {
                    ToolTip = 'Specifies the value of the Last changed field.', Comment = '%';
                }
            }
        }
    }
}
