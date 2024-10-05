namespace CurabisC5.CurabisCMigration;
using System.Integration;

#pragma implicitwith disable
/// <summary>
/// Page C5 CustTable List (ID 51899).
/// </summary>
page 51899 "C5 2008 CustTable List"
{
    PageType = List;
    SourceTable = "C5 2008 CustTable";
    CardPageId = "C5 2008 CustTable";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    Caption = 'Customers';
    ApplicationArea = all;
    UsageCategory = Lists;

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
                    ToolTip = 'Specifies the value of the Address 1 field.';
                }
                field(Address2; Rec.Address2)
                {
                    ToolTip = 'Specifies the value of the Address 2 field.';
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
                    ToolTip = 'Specifies the value of the Fixed discount pct. field.';
                }
                field(Approved; Rec.Approved)
                {
                    ToolTip = 'Specifies the value of the Approved field.';
                }
                field(PriceGroup; Rec.PriceGroup)
                {
                    ToolTip = 'Specifies the value of the Price group field.';
                }
                field(DiscGroup; Rec.DiscGroup)
                {
                    ToolTip = 'Specifies the value of the Discount group field.';
                }
                field(CashDisc; Rec.CashDisc)
                {
                    ToolTip = 'Specifies the value of the Cash discount field.';
                }
                field(ImageFile; Rec.ImageFile)
                {
                    ToolTip = 'Specifies the value of the Image field.';
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
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Locked field.';
                }
                field(SalesRep; Rec.SalesRep)
                {
                    ToolTip = 'Specifies the value of the Sales rep. field.';
                }
                field(Vat; Rec.Vat)
                {
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(DEL_StatType; Rec.DEL_StatType)
                {
                    ToolTip = 'Specifies the value of the DELETEStatistics field.';
                }
                field(GiroNumber; Rec.GiroNumber)
                {
                    ToolTip = 'Specifies the value of the FIK/Giro field.';
                }
                field(VatNumber; Rec.VatNumber)
                {
                    ToolTip = 'Specifies the value of the VAT No. field.';
                }
                field(Interest; Rec.Interest)
                {
                    ToolTip = 'Specifies the value of the Interest field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(ReminderCode; Rec.ReminderCode)
                {
                    ToolTip = 'Specifies the value of the Max. reminder field.';
                }
                field(OnetimeCustomer; Rec.OnetimeCustomer)
                {
                    ToolTip = 'Specifies the value of the One-off customer field.';
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
                field(SalesGroup; Rec.SalesGroup)
                {
                    ToolTip = 'Specifies the value of the Order group field.';
                }
                field(ProjGroup; Rec.ProjGroup)
                {
                    ToolTip = 'Specifies the value of the Project group field.';
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
                field(EanNumber; Rec.EanNumber)
                {
                    ToolTip = 'Specifies the value of the EAN field.';
                }
                field(DimAccountCode; Rec.DimAccountCode)
                {
                    ToolTip = 'Specifies the value of the A/c dimension field.';
                }
                field(XMLInvoice; Rec.XMLInvoice)
                {
                    ToolTip = 'Specifies the value of the OIOXML field.';
                }
                field(LastInvoiceDate; Rec.LastInvoiceDate)
                {
                    ToolTip = 'Specifies the value of the Invoice date field.';
                }
                field(LastPaymentDate; Rec.LastPaymentDate)
                {
                    ToolTip = 'Specifies the value of the Payment field.';
                }
                field(LastReminderDate; Rec.LastReminderDate)
                {
                    ToolTip = 'Specifies the value of the Reminder field.';
                }
                field(LastInterestDate; Rec.LastInterestDate)
                {
                    ToolTip = 'Specifies the value of the Last Interest Date field.';
                }
                field(LastInvoiceNumber; Rec.LastInvoiceNumber)
                {
                    ToolTip = 'Specifies the value of the Invoice field.';
                }
                field(XMLImport; Rec.XMLImport)
                {
                    ToolTip = 'Specifies the value of the XML import field.';
                }
                field(VatGroup; Rec.VatGroup)
                {
                    ToolTip = 'Specifies the value of the VAT group field.';
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
        C5MigrDashboardMgt: Codeunit "C5 2008 Migr. Dashboard Mgt";
        MigrationErrorText: Text[250];

    trigger OnAfterGetRecord();
    var
        DataMigrationError: Record "Data Migration Error";
    begin
        DataMigrationError.GetErrorMessage(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Rec.RecordId(), MigrationErrorText);
    end;

}
#pragma implicitwith restore
