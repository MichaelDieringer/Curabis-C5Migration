namespace CurabisC5.CurabisCMigration;


/// <summary>
/// Page C5 ProcCode (ID 51884).
/// </summary>
page 51884 "C5 2008 ProcCode"
{
    PageType = Card;
    SourceTable = "C5 2008 ProcCode";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Process Codes';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {

                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Int1; Rec.Int1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Int 1 field.';
                }
                field(Int2; Rec.Int2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Int 2 field.';
                }
                field(Int3; Rec.Int3)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Int 3 field.';
                }
                field(Int4; Rec.Int4)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Int 4 field.';
                }
                field(NoYes1; Rec.NoYes1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NoYes1 field.';
                }

            }
        }
    }
}
#pragma implicitwith restore
