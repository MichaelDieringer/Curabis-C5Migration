namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 Payment (ID 51875).
/// </summary>
xmlport 51875 "C5 2008 Payment"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'PaymentDocument';
            tableelement(C5Payment; "C5 2008 Payment")
            {
                fieldelement(Payment; C5Payment.Payment) { }
                fieldelement(Txt; C5Payment.Txt) { }
                fieldelement(Method; C5Payment.Method) { }
                fieldelement(Qty; C5Payment.Qty) { }
                fieldelement(UnitCode; C5Payment.UnitCode) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5Payment.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

