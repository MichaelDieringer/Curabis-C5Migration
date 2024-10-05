namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 CN8Code (ID 51864).
/// </summary>
page 51864 "C5 2008 CN8Code"
{
    PageType = Card;
    SourceTable = "C5 2008 CN8Code";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Item CN8 Codes';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {

                field(CN8Code; Rec.CN8Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item CN8 codes field.';
                }
                field(Txt; Rec.Txt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Text field.';
                }
                field(SupplementaryUnits; Rec.SupplementaryUnits)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supplementary unit field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
