namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 Country (ID 51886).
/// </summary>
xmlport 51886 "C5 2008 Country"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'CountryDocument';
            tableelement(C5Country; "C5 2008 Country")
            {
                fieldelement(Country; C5Country.Country) { }
                fieldelement(Type; C5Country.Type) { }
                fieldelement(Currency; C5Country.Currency) { }
                fieldelement(Language_; C5Country.Language_) { }
                fieldelement(PurchVat; C5Country.PurchVat) { }
                fieldelement(SalesVat; C5Country.SalesVat) { }
                fieldelement(VatCountryCode; C5Country.VatCountryCode) { }
                fieldelement(IntrastatCode; C5Country.IntrastatCode) { }
                fieldelement(ExtCountryName; C5Country.ExtCountryName) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5Country.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

