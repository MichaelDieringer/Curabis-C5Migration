namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 Delivery (ID 51865).
/// </summary>
xmlport 51865 "C5 Delivery"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'DeliveryDocument';
            tableelement(C5Delivery; "C5 Delivery")
            {
                fieldelement(Delivery; C5Delivery.Delivery) { }
                fieldelement(Name; C5Delivery.Name) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5Delivery.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

