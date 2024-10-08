namespace CurabisC5.CurabisCMigration;

xmlport 51862 "C5 2008 CN8Code"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'CN8CodeDocument';
            tableelement(C5CN8Code; "C5 2008 CN8Code")
            {
                fieldelement(CN8Code; C5CN8Code.CN8Code) { }
                fieldelement(Txt; C5CN8Code.Txt) { }
                fieldelement(SupplementaryUnits; C5CN8Code.SupplementaryUnits) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5CN8Code.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

