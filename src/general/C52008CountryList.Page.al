namespace CurabisCMigration.CurabisCMigration;

using CurabisC5.CurabisCMigration;

page 51804 "C5 2008 CountryList"
{
    ApplicationArea = All;
    Caption = '2008 CountryList';
    PageType = List;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = "C5 2008 Country";
    CardPageId = "C5 2008 Country";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(RecId; Rec.RecId)
                {
                    ToolTip = 'Specifies the value of the Row number field.', Comment = '%';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country/region field.', Comment = '%';
                }
                field(Currency; Rec.Currency)
                {
                    ToolTip = 'Specifies the value of the Currency field.', Comment = '%';
                }
                field(ExtCountryName; Rec.ExtCountryName)
                {
                    ToolTip = 'Specifies the value of the Country name field.', Comment = '%';
                }
                field(PurchVat; Rec.PurchVat)
                {
                    ToolTip = 'Specifies the value of the Purch. VAT field.', Comment = '%';
                }
                field(SalesVat; Rec.SalesVat)
                {
                    ToolTip = 'Specifies the value of the Sales VAT field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field(VatCountryCode; Rec.VatCountryCode)
                {
                    ToolTip = 'Specifies the value of the Country code field.', Comment = '%';
                }
                field(IntrastatCode; Rec.IntrastatCode)
                {
                    ToolTip = 'Specifies the value of the Intrastat field.', Comment = '%';
                }
            }
        }
    }
}
