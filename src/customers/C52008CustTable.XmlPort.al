namespace CurabisC5.CurabisCMigration;

/// <summary>
/// XmlPort C5 CustTable (ID 51864).
/// </summary>
xmlport 51864 "C5 2008 CustTable"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'CustTableDocument';
            tableelement(C5CustTable; "C5 2008 CustTable")
            {
                /*  A  */
                fieldelement(DEL_UserLock; C5CustTable.DEL_UserLock) { }
                /*  B  */
                fieldelement(Account; C5CustTable.Account) { }
                /*  C  */
                fieldelement(Name; C5CustTable.Name) { }
                /*  D  */
                fieldelement(Address1; C5CustTable.Address1) { }
                /*  E  */
                fieldelement(Address2; C5CustTable.Address2) { }
                /*  F  */
                fieldelement(ZipCity; C5CustTable.ZipCity) { }
                /*  G  */
                fieldelement(Country; C5CustTable.Country) { }
                /*  H  */
                fieldelement(Attention; C5CustTable.Attention) { }
                /*  I  */
                fieldelement(Phone; C5CustTable.Phone) { }
                /*  J  */
                fieldelement(Fax; C5CustTable.Fax) { }
                /*  K  */
                fieldelement(InvoiceAccount; C5CustTable.InvoiceAccount) { }
                /*  L  */
                fieldelement(Group; C5CustTable.Group) { }
                /*  M  */
                fieldelement(FixedDiscPct; C5CustTable.FixedDiscPct) { }
                /*  N  */
                fieldelement(Approved; C5CustTable.Approved) { }
                /*  O  */
                fieldelement(PriceGroup; C5CustTable.PriceGroup) { }
                /*  P  */
                fieldelement(DiscGroup; C5CustTable.DiscGroup) { }
                /*  Q  */
                fieldelement(CashDisc; C5CustTable.CashDisc) { }
                /*  R  */
                fieldelement(ImageFile; C5CustTable.ImageFile) { }
                /*  S  */
                fieldelement(Currency; C5CustTable.Currency) { }
                /*  T  */
                fieldelement(Language_; C5CustTable.Language_) { }
                /*  U  */
                fieldelement(Payment; C5CustTable.Payment) { }
                /*  V  */
                fieldelement(Delivery; C5CustTable.Delivery) { }
                /*  W  */
                fieldelement(Blocked; C5CustTable.Blocked) { }
                /*  X  */
                fieldelement(SalesRep; C5CustTable.SalesRep) { }
                /*  Y  */
                fieldelement(Vat; C5CustTable.Vat) { }
                /*  Z  */
                fieldelement(DEL_StatType; C5CustTable.DEL_StatType) { }
                /*  AA  */
                fieldelement(GiroNumber; C5CustTable.GiroNumber) { }
                /*  AB  */
                fieldelement(VatNumber; C5CustTable.VatNumber) { }
                /*  AC  */
                fieldelement(Interest; C5CustTable.Interest) { }
                /*  AD  */
                fieldelement(Department; C5CustTable.Department) { }
                /*  AE  */
                fieldelement(ReminderCode; C5CustTable.ReminderCode) { }
                /*  AF  */
                fieldelement(OnetimeCustomer; C5CustTable.OnetimeCustomer) { }
                /*  AG  */
                fieldelement(Inventory; C5CustTable.Inventory) { }
                /*  AH  */
                fieldelement(EDIAddress; C5CustTable.EDIAddress) { }
                /*  AI  */
                fieldelement(Balance; C5CustTable.Balance) { }
                /*  AJ  */
                fieldelement(Balance30; C5CustTable.Balance30) { }
                /*  AK  */
                fieldelement(Balance60; C5CustTable.Balance60) { }
                /*  AL  */
                fieldelement(Balance90; C5CustTable.Balance90) { }
                /*  AM  */
                fieldelement(Balance120; C5CustTable.Balance120) { }
                /*  AN  */
                fieldelement(Balance120Plus; C5CustTable.Balance120Plus) { }
                /*  AO  */
                fieldelement(AmountDue; C5CustTable.AmountDue) { }
                /*  AP  */
                textelement(CalculationDateText)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(CalculationDateText, CopyStr(DateFormatStringTxt, 1, 20), C5CustTable.CalculationDate);
                    end;
                }
                /*  AQ  */
                fieldelement(BalanceMax; C5CustTable.BalanceMax) { }
                /*  AR  */
                fieldelement(BalanceMST; C5CustTable.BalanceMST) { }
                /*  AS  */
                fieldelement(SearchName; C5CustTable.SearchName) { }
                /*  AT  */
                fieldelement(DEL_Transport; C5CustTable.DEL_Transport) { }
                /*  AU  */
                fieldelement(CashPayment; C5CustTable.CashPayment) { }
                /*  AV  */
                fieldelement(PaymentMode; C5CustTable.PaymentMode) { }
                /*  AW  */
                fieldelement(SalesGroup; C5CustTable.SalesGroup) { }
                /*  AX  */
                fieldelement(ProjGroup; C5CustTable.ProjGroup) { }
                /*  AY  */
                fieldelement(TradeCode; C5CustTable.TradeCode) { }
                /*  AZ  */
                fieldelement(TransportCode; C5CustTable.TransportCode) { }
                /*  BA  */
                fieldelement(Email; C5CustTable.Email) { }
                /*  BB  */
                fieldelement(URL; C5CustTable.URL) { }
                /*  BC  */
                fieldelement(CellPhone; C5CustTable.CellPhone) { }
                /*  BD  */
                fieldelement(KrakNumber; C5CustTable.KrakNumber) { }
                /*  BE  */
                fieldelement(Centre; C5CustTable.Centre) { }
                /*  BF  */
                fieldelement(Purpose; C5CustTable.Purpose) { }
                /*  BG  */
                fieldelement(EanNumber; C5CustTable.EanNumber) { }
                /*  BH  */
                fieldelement(DimAccountCode; C5CustTable.DimAccountCode) { }
                /*  BI  */
                fieldelement(XMLInvoice; C5CustTable.XMLInvoice) { }
                /*  BJ  */
                textelement(LastInvoiceDateText)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(LastInvoiceDateText, CopyStr(DateFormatStringTxt, 1, 20), C5CustTable.LastInvoiceDate);
                    end;
                }
                /*  BK  */
                textelement(LastPaymentDateText)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(LastPaymentDateText, CopyStr(DateFormatStringTxt, 1, 20), C5CustTable.LastPaymentDate);
                    end;
                }
                /*  BL  */
                textelement(LastReminderDateText)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(LastReminderDateText, CopyStr(DateFormatStringTxt, 1, 20), C5CustTable.LastReminderDate);
                    end;
                }
                /*  BM  */
                textelement(LastInterestDateText)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        C5HelperFunctions.TryConvertFromStringDate(LastInterestDateText, CopyStr(DateFormatStringTxt, 1, 20), C5CustTable.LastInterestDate);
                    end;
                }
                /*  BN  */
                fieldelement(LastInvoiceNumber; C5CustTable.LastInvoiceNumber) { }
                /*  BO  */
                fieldelement(XMLImport; C5CustTable.XMLImport) { }

                //fieldelement(VatGroup; C5CustTable.VatGroup) { }
                //fieldelement(StdAccount; C5CustTable.StdAccount) { }
                //fieldelement(VatNumberType; C5CustTable.VatNumberType) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5CustTable.RecId := Counter;
                    Counter += 1;
                    if C5CustTable.Language_ <= C5CustTable.Language_::Default then
                        C5CustTable.Language_ := C5CustTable.Language_::Danish;
                end;
            }
        }
    }

    var
        C5HelperFunctions: Codeunit "C5 2008 Helper Functions";
        DateFormatStringTxt: label 'yyyy/MM/dd', locked = true;
        Counter: Integer;
}

