namespace CurabisC5.CurabisCMigration;

/// <summary>
/// Page C5 Delivery (ID 51882).
/// </summary>
#pragma implicitwith disable
page 51882 "C5 Delivery"
{
    PageType = Card;
    SourceTable = "C5 Delivery";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Delivery';
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {

                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
