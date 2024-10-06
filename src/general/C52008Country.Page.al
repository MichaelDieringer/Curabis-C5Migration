namespace CurabisC5.CurabisCMigration;

page 51805 "C5 2008 Country"
{
    ApplicationArea = All;
    Caption = '2008 Country';
    PageType = Card;
    SourceTable = "C5 2008 Country";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(RecId; Rec.RecId)
                {
                    ToolTip = 'Specifies the value of the Row number field.', Comment = '%';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country/region field.', Comment = '%';
                }
                field(ExtCountryName; Rec.ExtCountryName)
                {
                    ToolTip = 'Specifies the value of the Country name field.', Comment = '%';
                }
                field(IntrastatCode; Rec.IntrastatCode)
                {
                    ToolTip = 'Specifies the value of the Intrastat field.', Comment = '%';
                }
                field(Language_; Rec.Language_)
                {
                    ToolTip = 'Specifies the value of the Language field.', Comment = '%';
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
                field(Currency; Rec.Currency)
                {
                    ToolTip = 'Specifies the value of the Currency field.', Comment = '%';
                }
                field(LastChanged; Rec.LastChanged)
                {
                    ToolTip = 'Specifies the value of the Last changed field.', Comment = '%';
                }
                field(VatCountryCode; Rec.VatCountryCode)
                {
                    ToolTip = 'Specifies the value of the Country code field.', Comment = '%';
                }
            }
        }
    }
}
