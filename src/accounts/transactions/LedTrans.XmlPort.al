

/// <summary>
/// XmlPort C5 LedTrans (ID 51897).
/// </summary>
xmlport 51897 "C5 LedTrans"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'LedTransDocument';
            tableelement(C5LedTrans; "C5 LedTrans")
            {   /* a */
                fieldelement(Account; C5LedTrans.Account) { }
                /* b */
                fieldelement(BudgetCode; C5LedTrans.BudgetCode) { }
                /* c */
                fieldelement(Department; C5LedTrans.Department) { }
                /* d */
                textelement(Date_Text)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(Date_Text, CopyStr(DateFormatStringTxt, 1, 20), C5LedTrans.Date_);
                    end;
                }
                /* e */
                fieldelement(Voucher; C5LedTrans.Voucher) { }
                /* f */
                fieldelement(Txt; C5LedTrans.Txt) { }
                /* g */
                fieldelement(AmountMST; C5LedTrans.AmountMST) { }
                /* h */
                fieldelement(AmountCur; C5LedTrans.AmountCur) { }
                /* i */
                fieldelement(Currency; C5LedTrans.Currency) { }
                /* j */
                fieldelement(Vat; C5LedTrans.Vat) { }
                /* k */
                fieldelement(VatAmount; C5LedTrans.VatAmount) { }
                /* l */
                fieldelement(Qty; C5LedTrans.Qty) { }
                /* m */
                fieldelement(TransType; C5LedTrans.TransType) { }
                /* n */
                textelement(DueDateText)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(DueDateText, CopyStr(DateFormatStringTxt, 1, 20), C5LedTrans.DueDate);
                    end;
                }

                /* o */
                fieldelement(Transaction; C5LedTrans.Transaction) { }
                /* p */
                fieldelement(CreatedBy; C5LedTrans.CreatedBy) { }
                /* q */
                fieldelement(JourNumber; C5LedTrans.JourNumber) { }
                /* r */
                fieldelement(Amount2; C5LedTrans.Amount2) { }
                /* s */
                fieldelement(LockAmount2; C5LedTrans.LockAmount2) { }
                /* t */
                fieldelement(Centre; C5LedTrans.Centre) { }
                /* u */
                fieldelement(Purpose; C5LedTrans.Purpose) { }
                /* v */
                fieldelement(ReconcileNo; C5LedTrans.ReconcileNo) { }
                /* w */
                fieldelement(VatRepCounter; C5LedTrans.VatRepCounter) { }
                /* x */
                fieldelement(VatPeriodRecId; C5LedTrans.VatPeriodRecId) { }
                /* y */
                fieldelement(Integer; C5LedTrans.Counter) { }
                /* z */
                textelement(NewDateText)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(NewDateText, CopyStr(DateFormatStringTxt, 1, 20), C5LedTrans.Date2);
                    end;
                }

                trigger OnBeforeInsertRecord();
                begin
                    C5LedTrans.RecId := Counter;
                    Counter += 1;
                    if Counter mod 1000 = 0 then
                        OnThousandAccountTransactionsRead();
                end;
            }
        }
    }

    var
        C5HelperFunctions: Codeunit "C5 Helper Functions";
        DateFormatStringTxt: label 'yyyy/MM/dd', locked = true;
        Counter: Integer;

    [IntegrationEvent(false, false)]
    local procedure OnThousandAccountTransactionsRead()
    begin
    end;
}
