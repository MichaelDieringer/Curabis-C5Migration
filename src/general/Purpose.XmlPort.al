

/// <summary>
/// XmlPort C5 Purpose (ID 51877).
/// </summary>
xmlport 51877 "C5 Purpose"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'PurposeDocument';
            tableelement(C5Purpose; "C5 Purpose")
            {
                fieldelement(Purpose; C5Purpose.Purpose) { }
                fieldelement(Name; C5Purpose.Name) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5Purpose.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

