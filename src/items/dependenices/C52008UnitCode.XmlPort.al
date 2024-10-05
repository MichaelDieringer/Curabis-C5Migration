namespace CurabisC5.CurabisCMigration;

xmlport 51878 "C5 2008 UnitCode"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'UnitCodeDocument';
            tableelement(C5UnitCode; "C5 2008 UnitCode")
            {
                fieldelement(UnitCode; C5UnitCode.UnitCode) { }
                fieldelement(Txt; C5UnitCode.Txt) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5UnitCode.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

