namespace CurabisC5.CurabisCMigration;


/// <summary>
/// Page C5 CustTrans (ID 51892).
/// </summary>
page 51892 "C5 2008 CustTrans"
{
    PageType = List;
    SourceTable = "C5 2008 CustTrans";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Customer Entries';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(BudgetCode; Rec.BudgetCode)
                {
                    ToolTip = 'Specifies the value of the Budget code field.';
                }
                field(Account; Rec.Account)
                {
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Date_; Rec.Date_)
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(InvoiceNumber; Rec.InvoiceNumber)
                {
                    ToolTip = 'Specifies the value of the Invoice field.';
                }
                field(Voucher; Rec.Voucher)
                {
                    ToolTip = 'Specifies the value of the Voucher field.';
                }
                field(Txt; Rec.Txt)
                {
                    ToolTip = 'Specifies the value of the Text field.';
                }
                field(TransType; Rec.TransType)
                {
                    ToolTip = 'Specifies the value of the Entry type field.';
                }
                field(AmountMST; Rec.AmountMST)
                {
                    ToolTip = 'Specifies the value of the Amount in LCY field.';
                }
                field(AmountCur; Rec.AmountCur)
                {
                    ToolTip = 'Specifies the value of the Amount in currency field.';
                }
                field(Currency; Rec.Currency)
                {
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(Vat; Rec.Vat)
                {
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(VatAmount; Rec.VatAmount)
                {
                    ToolTip = 'Specifies the value of the VAT amount field.';
                }
                field(Approved; Rec.Approved)
                {
                    ToolTip = 'Specifies the value of the Approved field.';
                }
                field(ApprovedBy; Rec.ApprovedBy)
                {
                    ToolTip = 'Specifies the value of the Approved by field.';
                }
                field(CashDiscAmount; Rec.CashDiscAmount)
                {
                    ToolTip = 'Specifies the value of the Cash discount field.';
                }
                field(CashDiscDate; Rec.CashDiscDate)
                {
                    ToolTip = 'Specifies the value of the Cash disc. date field.';
                }
                field(DueDate; Rec.DueDate)
                {
                    ToolTip = 'Specifies the value of the Due field.';
                }
                field(Open; Rec.Open)
                {
                    ToolTip = 'Specifies the value of the Open field.';
                }
                field(ExchRate; Rec.ExchRate)
                {
                    ToolTip = 'Specifies the value of the Exch. rate field.';
                }
                field(RESERVED2; Rec.RESERVED2)
                {
                    ToolTip = 'Specifies the value of the RESERVED2 field.';
                }
                field(RESERVED3; Rec.RESERVED3)
                {
                    ToolTip = 'Specifies the value of the RESERVED3 field.';
                }
                field(PostedDiffAmount; Rec.PostedDiffAmount)
                {
                    ToolTip = 'Specifies the value of the Diff. posted field.';
                }
                field(RefRecID; Rec.RefRecID)
                {
                    ToolTip = 'Specifies the value of the RefRecID field.';
                }
                field(Transaction; Rec.Transaction)
                {
                    ToolTip = 'Specifies the value of the Transaction field.';
                }
                field(ReminderCode; Rec.ReminderCode)
                {
                    ToolTip = 'Specifies the value of the Reminder code field.';
                }
                field(CashDisc; Rec.CashDisc)
                {
                    ToolTip = 'Specifies the value of the Cash discount field.';
                }
                field(RemindedDate; Rec.RemindedDate)
                {
                    ToolTip = 'Specifies the value of the Reminder date field.';
                }
                field(ExchRateTri; Rec.ExchRateTri)
                {
                    ToolTip = 'Specifies the value of the Tri rate field.';
                }
                field(PaymentId; Rec.PaymentId)
                {
                    ToolTip = 'Specifies the value of the Payment ID field.';
                }
                field(Centre; Rec.Centre)
                {
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(PaymentMode; Rec.PaymentMode)
                {
                    ToolTip = 'Specifies the value of the Paym. method field.';
                }

            }
        }
    }
}

