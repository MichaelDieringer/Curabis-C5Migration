namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 CustTable (ID 51860).
/// </summary>
page 51860 "C5 CustTable"
{
    PageType = Card;
    SourceTable = "C5 CustTable";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Customer Table';
    PromotedActionCategories = 'Related Entities';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {
                field(Account; Rec.Account)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address1; Rec.Address1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address 1 field.';
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(ZipCity; Rec.ZipCity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Zip code/City field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country/region field.';
                }
                field(Attention; Rec.Attention)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Attention field.';
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field(Fax; Rec.Fax)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fax field.';
                }
                field(InvoiceAccount; Rec.InvoiceAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice a/c field.';
                }
                field(Group; Rec.Group)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Group field.';
                }
                field(FixedDiscPct; Rec.FixedDiscPct)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fixed discount pct. field.';
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved field.';
                }
                field(PriceGroup; Rec.PriceGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Price group field.';
                }
                field(DiscGroup; Rec.DiscGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount group field.';
                }
                field(CashDisc; Rec.CashDisc)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash discount field.';
                }
                field(ImageFile; Rec.ImageFile)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Image field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(Language_; Rec.Language_)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Language field.';
                }
                field(Payment; Rec.Payment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment field.';
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Locked field.';
                }
                field(SalesRep; Rec.SalesRep)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales rep. field.';
                }
                field(Vat; Rec.Vat)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(DEL_StatType; Rec.DEL_StatType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DELETEStatistics field.';
                }
                field(GiroNumber; Rec.GiroNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the FIK/Giro field.';
                }
                field(VatNumber; Rec.VatNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT No. field.';
                }
                field(Interest; Rec.Interest)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interest field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(ReminderCode; Rec.ReminderCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Max. reminder field.';
                }
                field(OnetimeCustomer; Rec.OnetimeCustomer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the One-off customer field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory field.';
                }
                field(EDIAddress; Rec.EDIAddress)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the EDI address field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field(Balance30; Rec.Balance30)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0-30 days field.';
                }
                field(Balance60; Rec.Balance60)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31-60 days field.';
                }
                field(Balance90; Rec.Balance90)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61-90 days field.';
                }
                field(Balance120; Rec.Balance120)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91-120 days field.';
                }
                field(Balance120Plus; Rec.Balance120Plus)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the More than 120 days field.';
                }
                field(AmountDue; Rec.AmountDue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Due field.';
                }
                field(CalculationDate; Rec.CalculationDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Calculated field.';
                }
                field(BalanceMax; Rec.BalanceMax)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Max. balance field.';
                }
                field(BalanceMST; Rec.BalanceMST)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance LCY field.';
                }
                field(SearchName; Rec.SearchName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Search name field.';
                }
                field(DEL_Transport; Rec.DEL_Transport)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DELETETransport field.';
                }
                field(CashPayment; Rec.CashPayment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash payment field.';
                }
                field(PaymentMode; Rec.PaymentMode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paym. method field.';
                }
                field(SalesGroup; Rec.SalesGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order group field.';
                }
                field(ProjGroup; Rec.ProjGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project group field.';
                }
                field(TradeCode; Rec.TradeCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transact. type field.';
                }
                field(TransportCode; Rec.TransportCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Homepage field.';
                }
                field(CellPhone; Rec.CellPhone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cell phone field.';
                }
                field(KrakNumber; Rec.KrakNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Krak no. field.';
                }
                field(Centre; Rec.Centre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(EanNumber; Rec.EanNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the EAN field.';
                }
                field(DimAccountCode; Rec.DimAccountCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the A/c dimension field.';
                }
                field(XMLInvoice; Rec.XMLInvoice)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OIOXML field.';
                }
                field(LastInvoiceDate; Rec.LastInvoiceDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice date field.';
                }
                field(LastPaymentDate; Rec.LastPaymentDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment field.';
                }
                field(LastReminderDate; Rec.LastReminderDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reminder field.';
                }
                field(LastInterestDate; Rec.LastInterestDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Interest Date field.';
                }
                field(LastInvoiceNumber; Rec.LastInvoiceNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice field.';
                }
                field(XMLImport; Rec.XMLImport)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the XML import field.';
                }
                field(VatGroup; Rec.VatGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT group field.';
                }
                field(StdAccount; Rec.StdAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default field.';
                }
                field(VatNumberType; Rec.VatNumberType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT number type field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(RelatedEntities)
            {
                Caption = 'Related entities';

                action(C5SalesRep)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Representative';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = SalesPerson;
                    RunObject = Page "C5 Employee";
                    RunPageLink = Employee = field(SalesRep);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Sales Representative action.';
                }

                action(C5Payment)
                {
                    ApplicationArea = All;
                    Caption = 'Payment';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Payment;
                    RunObject = Page "C5 Payment";
                    RunPageLink = Payment = field(Payment);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Payment action.';
                }

                action(C5Delivery)
                {
                    ApplicationArea = All;
                    Caption = 'Delivery';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Delivery;
                    RunObject = Page "C5 Delivery";
                    RunPageLink = Delivery = field(Delivery);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Delivery action.';
                }

                action(C5CustDiscGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Discount Group';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Discount;
                    RunObject = Page "C5 CustDiscGroup";
                    RunPageLink = DiscGroup = field(DiscGroup);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Customer Discount Group action.';
                }

                action(C5PriceGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Price Group';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Price;
                    RunObject = Page "C5 InvenPriceGroup";
                    RunPageLink = Group = field(PriceGroup);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Price Group action.';
                }

                action(C5PaymentMode)
                {
                    ApplicationArea = All;
                    Caption = 'Payment Mode';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = SuggestPayment;
                    RunObject = Page "C5 ProcCode";
                    RunPageLink = Code = field(PaymentMode);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Payment Mode action.';
                }

                action(C5CustGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Group';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Group;
                    RunObject = Page "C5 CustGroup";
                    RunPageLink = Group = field(Group);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Customer Group action.';
                }

                action(C5CustTrans)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Entries';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = EntriesList;
                    RunObject = Page "C5 CustTrans";
                    RunPageLink = Account = field(Account), Open = const(Yes), BudgetCode = const(Actual);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Customer Entries action.';
                }

                action(C5CustContact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact Persons';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = ContactPerson;
                    RunObject = Page "C5 CustContact";
                    RunPageLink = Account = field(Account);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Contact Persons action.';
                }
            }
        }
    }
}
#pragma implicitwith restore
