namespace CurabisC5.CurabisCMigration;

xmlport 51879 "C5 VatGroup"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'VatGroupDocument';
            tableelement(C5VatGroup; "C5 VatGroup")
            {
                fieldelement(Type; C5VatGroup.Type) { }
                fieldelement(Group; C5VatGroup.Group) { }
                fieldelement(Description; C5VatGroup.Description) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5VatGroup.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

