


/// <summary>
/// Page C5 ProcCode (ID 51884).
/// </summary>
page 51884 "C5 ProcCode"
{
    PageType = Card;
    SourceTable = "C5 ProcCode";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Process Codes';
    layout
    {
        area(content)
        {
            group(General)
            {

                field(Type; Rec.Type) { ApplicationArea = All; }
                field(Code; Rec.Code) { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field(Int1; Rec.Int1) { ApplicationArea = All; }
                field(Int2; Rec.Int2) { ApplicationArea = All; }
                field(Int3; Rec.Int3) { ApplicationArea = All; }
                field(Int4; Rec.Int4) { ApplicationArea = All; }
                field(NoYes1; Rec.NoYes1) { ApplicationArea = All; }

            }
        }
    }
}
#pragma implicitwith restore
