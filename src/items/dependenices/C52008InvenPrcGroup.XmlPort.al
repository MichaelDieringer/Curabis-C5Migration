namespace CurabisC5.CurabisCMigration;

xmlport 51871 "C5 2008 InvenPrcGroup"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'InvenPriceGroupDocument';
            tableelement(C5InvenPriceGroup; "C5 2008 InvenPriceGroup")
            {
                fieldelement(Group; C5InvenPriceGroup.Group) { }
                fieldelement(GroupName; C5InvenPriceGroup.GroupName) { }
                fieldelement(InclVat; C5InvenPriceGroup.InclVat) { }
                fieldelement(Roundoff1; C5InvenPriceGroup.Roundoff1) { }
                fieldelement(Roundoff10; C5InvenPriceGroup.Roundoff10) { }
                fieldelement(Roundoff100; C5InvenPriceGroup.Roundoff100) { }
                fieldelement(Roundoff1000; C5InvenPriceGroup.Roundoff1000) { }
                fieldelement(Roundoff1000Plus; C5InvenPriceGroup.Roundoff1000Plus) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5InvenPriceGroup.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

