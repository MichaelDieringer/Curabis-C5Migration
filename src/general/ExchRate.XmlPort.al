namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 Exch. Rate (ID 51895).
/// </summary>
xmlport 51895 "C5 Exch. Rate"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'ExchRateDocument';
            tableelement(C5ExchRate; "C5 ExchRate")
            {
                /* A */
                fieldelement(Currency; C5ExchRate.Currency) { }
                /* B */
                fieldelement(ExchRate; C5ExchRate.ExchRate) { }
                /* C */
                textelement(FromDateText)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(FromDateText, CopyStr(DateFormatStringTxt, 1, 20), C5ExchRate.FromDate);
                    end;
                }
                /* D */
                fieldelement(Comment; C5ExchRate.Comment) { }
                /* E */
                fieldelement(Triangulation; C5ExchRate.Triangulation) { }



                trigger OnBeforeInsertRecord();
                begin
                    C5ExchRate.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        C5HelperFunctions: Codeunit "C5 Helper Functions";
        DateFormatStringTxt: label 'yyyy/MM/dd', locked = true;

        Counter: Integer;
}

