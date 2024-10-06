namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenBOM List (ID 51898).
/// </summary>
page 51898 "C5 2008 InvenBOM List"
{
    PageType = List;
    SourceTable = "C5 2008 InvenBOM";
    Caption = 'C5 2008 Bill of Materials';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(BOMItemNumber; Rec.BOMItemNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BOMItemNumber field.';
                }
                field(ItemNumber; Rec.ItemNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ItemNumber field.';
                }
                field(Qty; Rec.Qty)
                {
                    Caption = 'Quantity';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field(LeadTime; Rec.LeadTime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LeadTime field.';
                }
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Resource field.';
                }
                field(InvenLocation; Rec.InvenLocation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the InvenLocation field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(PriceGroup; Rec.PriceGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PriceGroup field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
