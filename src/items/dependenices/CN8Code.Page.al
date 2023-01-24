

#pragma implicitwith disable
/// <summary>
/// Page C5 CN8Code (ID 51864).
/// </summary>
page 51864 "C5 CN8Code"
{
    PageType = Card;
    SourceTable = "C5 CN8Code";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Item CN8 Codes';
    layout
    {
        area(content)
        {
            group(General)
            {
#pragma warning disable AA0218
                field(CN8Code; Rec.CN8Code) { ApplicationArea = All; }
                field(Txt; Rec.Txt) { ApplicationArea = All; }
                field(SupplementaryUnits; Rec.SupplementaryUnits) { ApplicationArea = All; }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
