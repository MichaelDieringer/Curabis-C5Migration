namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 Department (ID 51866).
/// </summary>
xmlport 51866 "C5 Department"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'DepartmentDocument';
            tableelement(C5Department; "C5 Department")
            {
                fieldelement(Department; C5Department.Department) { }
                fieldelement(Name; C5Department.Name) { }
                fieldelement(C4Department; C5Department.C4Department) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5Department.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

