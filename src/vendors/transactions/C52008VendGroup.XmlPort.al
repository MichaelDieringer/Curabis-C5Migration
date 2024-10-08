namespace CurabisC5.CurabisCMigration;

xmlport 51893 "C5 2008 VendGroup"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;

    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'VendGroupDocument';
            tableelement(C5VendGroup; "C5 2008 VendGroup")
            {
                fieldelement(Group; C5VendGroup.Group) { }
                fieldelement(GroupName; C5VendGroup.GroupName) { }
                fieldelement(InventoryInflowAcc; C5VendGroup.InventoryInflowAcc) { }
                fieldelement(RESERVED1; C5VendGroup.RESERVED1) { }
                fieldelement(InvoiceDisc; C5VendGroup.InvoiceDisc) { }
                fieldelement(FeeTaxable; C5VendGroup.FeeTaxable) { }
                fieldelement(FeeTaxfree; C5VendGroup.FeeTaxfree) { }
                fieldelement(GroupAccount; C5VendGroup.GroupAccount) { }
                fieldelement(CashPayment; C5VendGroup.CashPayment) { }
                fieldelement(LineDisc; C5VendGroup.LineDisc) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5VendGroup.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

