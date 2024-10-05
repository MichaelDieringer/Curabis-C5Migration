namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 Payment (ID 51869).
/// </summary>
page 51869 "C5 Payment"
{
    PageType = Card;
    SourceTable = "C5 Payment";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Payment';
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {

                field(Payment; Rec.Payment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment field.';
                }
                field(Txt; Rec.Txt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Text field.';
                }
                field(Method; Rec.Method)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Method field.';
                }
                field(Qty; Rec.Qty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field(UnitCode; Rec.UnitCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
