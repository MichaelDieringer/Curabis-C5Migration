namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenPrice (ID 51888).
/// </summary>
page 51888 "C5 2008 InvenPrice"
{
    PageType = Card;
    SourceTable = "C5 2008 InvenPrice";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Inventory Prices';
    UsageCategory = None;
    Applicationarea = All;
    layout
    {
        area(content)
        {
            group(General)
            {

                field(ItemNumber; Rec.ItemNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item number field.';
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(PriceUnit; Rec.PriceUnit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(PriceGroup; Rec.PriceGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Price group field.';
                }
                field(ContributionRatio; Rec.ContributionRatio)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contrib. ratio field.';
                }
                field(Date_; Rec.Date_)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(SalesVat; Rec.SalesVat)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales VAT field.';
                }
#pragma warning restore
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(RelatedEntities)
            {
                Caption = 'Related entities';

                action(C5InvenPriceGroup)
                {
                    ApplicationArea = All;
                    Caption = 'C5 InvenPriceGroup';
                    Image = Group;
                    RunObject = Page "C5 2008 InvenPriceGroup";
                    RunPageLink = Group = field(PriceGroup);
                    ToolTip = 'Executes the C5 InvenPriceGroup action.';
                }
            }
        }
    }
}

#pragma implicitwith restore
