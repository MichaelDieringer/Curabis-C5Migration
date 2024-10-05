namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 Centre (ID 1861).
/// </summary>
xmlport 51861 "C5 Centre"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'CentreDocument';
            tableelement(C5Centre; "C5 Centre")
            {
                fieldelement(Centre; C5Centre.Centre) { }
                fieldelement(Name; C5Centre.Name) { }

                trigger OnBeforeInsertRecord();
                begin
                    Counter += 1;
                    C5Centre.RecId := Counter;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

