namespace CurabisC5.CurabisCMigration;

page 51803 "C5 2008 ProcCodeList"
{
    ApplicationArea = All;
    Caption = '2008 ProcCodeList';
    PageType = List;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "C5 2008 ProcCode";
    SourceTable = "C5 2008 ProcCode";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }
}
