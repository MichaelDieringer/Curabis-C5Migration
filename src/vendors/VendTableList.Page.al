namespace CurabisC5.CurabisCMigration;
using System.Integration;

#pragma implicitwith disable
/// <summary>
/// Page C5 VendTable List (ID 51900).
/// </summary>
page 51900 "C5 VendTable List"
{
    PageType = List;
    SourceTable = "C5 VendTable";
    CardPageId = "C5 VendTable";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    Caption = 'Vendors';
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Error Message"; MigrationErrorText)
                {
                    Caption = 'Error Message';
                    Enabled = false;
                    ToolTip = 'Specifies the value of the MigrationErrorText field.';
                }
                field(Account; Rec.Account)
                {
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address1; Rec.Address1)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Address2; Rec.Address2)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(ZipCity; Rec.ZipCity)
                {
                    ToolTip = 'Specifies the value of the Zip code/City field.';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country/region field.';
                }
                field(Attention; Rec.Attention)
                {
                    ToolTip = 'Specifies the value of the Attention field.';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field(Fax; Rec.Fax)
                {
                    ToolTip = 'Specifies the value of the Fax field.';
                }
                field(InvoiceAccount; Rec.InvoiceAccount)
                {
                    ToolTip = 'Specifies the value of the Invoice a/c field.';
                }
                field(Group; Rec.Group)
                {
                    ToolTip = 'Specifies the value of the Group field.';
                }
                field(FixedDiscPct; Rec.FixedDiscPct)
                {
                    ToolTip = 'Specifies the value of the Fixed discount field.';
                }
                field(DiscGroup; Rec.DiscGroup)
                {
                    ToolTip = 'Specifies the value of the Discount group field.';
                }
                field(CashDisc; Rec.CashDisc)
                {
                    ToolTip = 'Specifies the value of the Cash discount field.';
                }
                field(Approved; Rec.Approved)
                {
                    ToolTip = 'Specifies the value of the Approved field.';
                }
                field(DEL_ExclDuty; Rec.DEL_ExclDuty)
                {
                    ToolTip = 'Specifies the value of the Excl. duty field.';
                }
                field(InclVat; Rec.InclVat)
                {
                    ToolTip = 'Specifies the value of the Incl. VAT field.';
                }
                field(Currency; Rec.Currency)
                {
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(Language_; Rec.Language_)
                {
                    ToolTip = 'Specifies the value of the Language field.';
                }
                field(Payment; Rec.Payment)
                {
                    ToolTip = 'Specifies the value of the Payment field.';
                }
                field(Delivery; Rec.Delivery)
                {
                    ToolTip = 'Specifies the value of the Delivery field.';
                }
                field(Interest; Rec.Interest)
                {
                    ToolTip = 'Specifies the value of the Interest field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Locked field.';
                }
                field(Purchaser; Rec.Purchaser)
                {
                    ToolTip = 'Specifies the value of the Purchaser field.';
                }
                field(Vat; Rec.Vat)
                {
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(DEL_StatType; Rec.DEL_StatType)
                {
                    ToolTip = 'Specifies the value of the DELETEStatistics field.';
                }
                field(ESRnumber; Rec.ESRnumber)
                {
                    ToolTip = 'Specifies the value of the Nets no. field.';
                }
                field(GiroNumber; Rec.GiroNumber)
                {
                    ToolTip = 'Specifies the value of the FIK/Giro field.';
                }
                field(OurAccount; Rec.OurAccount)
                {
                    ToolTip = 'Specifies the value of the Our a/c field.';
                }
                field(BankAccount; Rec.BankAccount)
                {
                    ToolTip = 'Specifies the value of the Bank a/c field.';
                }
                field(VatNumber; Rec.VatNumber)
                {
                    ToolTip = 'Specifies the value of the VAT No. field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(OnetimeSupplier; Rec.OnetimeSupplier)
                {
                    ToolTip = 'Specifies the value of the One-off vendor field.';
                }
                field(ImageFile; Rec.ImageFile)
                {
                    ToolTip = 'Specifies the value of the Image field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ToolTip = 'Specifies the value of the Inventory field.';
                }
                field(EDIAddress; Rec.EDIAddress)
                {
                    ToolTip = 'Specifies the value of the EDI address field.';
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field(Balance30; Rec.Balance30)
                {
                    ToolTip = 'Specifies the value of the 0-30 days field.';
                }
                field(Balance60; Rec.Balance60)
                {
                    ToolTip = 'Specifies the value of the 31-60 days field.';
                }
                field(Balance90; Rec.Balance90)
                {
                    ToolTip = 'Specifies the value of the 61-90 days field.';
                }
                field(Balance120; Rec.Balance120)
                {
                    ToolTip = 'Specifies the value of the 91-120 days field.';
                }
                field(Balance120Plus; Rec.Balance120Plus)
                {
                    ToolTip = 'Specifies the value of the More than 120 days field.';
                }
                field(AmountDue; Rec.AmountDue)
                {
                    ToolTip = 'Specifies the value of the Due field.';
                }
                field(CalculationDate; Rec.CalculationDate)
                {
                    ToolTip = 'Specifies the value of the Calculated field.';
                }
                field(BalanceMax; Rec.BalanceMax)
                {
                    ToolTip = 'Specifies the value of the Max. balance field.';
                }
                field(BalanceMST; Rec.BalanceMST)
                {
                    ToolTip = 'Specifies the value of the Balance LCY field.';
                }
                field(SearchName; Rec.SearchName)
                {
                    ToolTip = 'Specifies the value of the Search name field.';
                }
                field(DEL_Transport; Rec.DEL_Transport)
                {
                    ToolTip = 'Specifies the value of the DELETETransport field.';
                }
                field(CashPayment; Rec.CashPayment)
                {
                    ToolTip = 'Specifies the value of the Cash payment field.';
                }
                field(PaymentMode; Rec.PaymentMode)
                {
                    ToolTip = 'Specifies the value of the Paym. method field.';
                }
                field(PaymSpec; Rec.PaymSpec)
                {
                    ToolTip = 'Specifies the value of the Paym. spec. field.';
                }
                field(Telex; Rec.Telex)
                {
                    ToolTip = 'Specifies the value of the Telex field.';
                }
                field(PaymId; Rec.PaymId)
                {
                    ToolTip = 'Specifies the value of the PaymID field.';
                }
                field(PurchGroup; Rec.PurchGroup)
                {
                    ToolTip = 'Specifies the value of the Purchase group field.';
                }
                field(TradeCode; Rec.TradeCode)
                {
                    ToolTip = 'Specifies the value of the Transact. type field.';
                }
                field(TransportCode; Rec.TransportCode)
                {
                    ToolTip = 'Specifies the value of the Transport field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(URL; Rec.URL)
                {
                    ToolTip = 'Specifies the value of the Homepage field.';
                }
                field(CellPhone; Rec.CellPhone)
                {
                    ToolTip = 'Specifies the value of the Cell phone field.';
                }
                field(KrakNumber; Rec.KrakNumber)
                {
                    ToolTip = 'Specifies the value of the Krak no. field.';
                }
                field(Centre; Rec.Centre)
                {
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(LastInvoiceDate; Rec.LastInvoiceDate)
                {
                    ToolTip = 'Specifies the value of the Invoice date field.';
                }
                field(LastPaymentDate; Rec.LastPaymentDate)
                {
                    ToolTip = 'Specifies the value of the Payment field.';
                }
                field(LastInvoiceNumber; Rec.LastInvoiceNumber)
                {
                    ToolTip = 'Specifies the value of the Invoice field.';
                }
                field(XMLImport; Rec.XMLImport)
                {
                    ToolTip = 'Specifies the value of the XML import field.';
                }
                field(EanNumber; Rec.EanNumber)
                {
                    ToolTip = 'Specifies the value of the EAN field.';
                }
                field(VatGroup; Rec.VatGroup)
                {
                    ToolTip = 'Specifies the value of the VAT group field.';
                }
                field(CardType; Rec.CardType)
                {
                    ToolTip = 'Specifies the value of the Card type field.';
                }
                field(StdAccount; Rec.StdAccount)
                {
                    ToolTip = 'Specifies the value of the Default field.';
                }
                field(VatNumberType; Rec.VatNumberType)
                {
                    ToolTip = 'Specifies the value of the VAT number type field.';
                }
#pragma warning restore
            }
        }
    }

    var
        C5MigrDashboardMgt: Codeunit "C5 Migr. Dashboard Mgt";
        MigrationErrorText: Text[250];

    trigger OnAfterGetRecord();
    var
        DataMigrationError: Record "Data Migration Error";
    begin
        DataMigrationError.GetErrorMessage(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Rec.RecordId(), MigrationErrorText);
    end;

}
#pragma implicitwith restore
