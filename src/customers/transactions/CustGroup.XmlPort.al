

/// <summary>
/// XmlPort C5 CustGroup (ID 51891).
/// </summary>
xmlport 51891 "C5 CustGroup"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'CustGroupDocument';
            tableelement(C5CustGroup; "C5 CustGroup")
            {
                fieldelement(Group; C5CustGroup.Group) { }
                fieldelement(GroupName; C5CustGroup.GroupName) { }
                fieldelement(SalesAcc; C5CustGroup.SalesAcc) { }
                fieldelement(COGSAcc; C5CustGroup.COGSAcc) { }
                fieldelement(InvoiceDisc; C5CustGroup.InvoiceDisc) { }
                fieldelement(FeeTaxable; C5CustGroup.FeeTaxable) { }
                fieldelement(FeeTaxfree; C5CustGroup.FeeTaxfree) { }
                fieldelement(GroupAccount; C5CustGroup.GroupAccount) { }
                fieldelement(CashPayment; C5CustGroup.CashPayment) { }
                fieldelement(LineDisc; C5CustGroup.LineDisc) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5CustGroup.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

