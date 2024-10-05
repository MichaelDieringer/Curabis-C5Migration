namespace CurabisC5.CurabisCMigration;

xmlport 51896 InvenLocationXmlPort
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'InvenLocationDocument';
            tableelement(C5InvenLocation; "C5 InvenLocation")
            {
                fieldelement(InvenLocation; C5InvenLocation.InvenLocation) { }
                fieldelement(Name; C5InvenLocation.Name) { }
                fieldelement(RESERVED1; C5InvenLocation.RESERVED1) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5InvenLocation.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}
