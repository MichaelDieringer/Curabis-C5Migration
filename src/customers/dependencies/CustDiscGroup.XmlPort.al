namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 CustDiscGroup (ID 51863).
/// </summary>
xmlport 51863 "C5 CustDiscGroup"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'CustDiscGroupDocument';
            tableelement(C5CustDiscGroup; "C5 CustDiscGroup")
            {
                fieldelement(DiscGroup; C5CustDiscGroup.DiscGroup) { }
                fieldelement(Comment; C5CustDiscGroup.Comment) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5CustDiscGroup.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

