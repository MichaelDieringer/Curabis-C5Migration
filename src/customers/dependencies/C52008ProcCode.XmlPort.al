namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 ProcCode (ID 51876).
/// </summary>
xmlport 51876 "C5 2008 ProcCode"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'ProcCodeDocument';
            tableelement(C5ProcCode; "C5 2008 ProcCode")
            {
                fieldelement(Type; C5ProcCode.Type) { }
                fieldelement(Code; C5ProcCode.Code) { }
                fieldelement(Name; C5ProcCode.Name) { }
                fieldelement(Int1; C5ProcCode.Int1) { }
                fieldelement(Int2; C5ProcCode.Int2) { }
                fieldelement(Int3; C5ProcCode.Int3) { }
                fieldelement(Int4; C5ProcCode.Int4) { }
                fieldelement(NoYes1; C5ProcCode.NoYes1) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5ProcCode.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

