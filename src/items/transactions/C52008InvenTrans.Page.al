namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenTrans (ID 51890).
/// </summary>
page 51890 "C5 2008 InvenTrans"
{
    PageType = List;
    SourceTable = "C5 2008 InvenTrans";
    DeleteAllowed = true;
    InsertAllowed = false;
    Caption = 'C5 Inventory Entries';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(ItemNumber; Rec.ItemNumber)
                {
                    ToolTip = 'Specifies the value of the Item number field.';
                }
                field(BudgetCode; Rec.BudgetCode)
                {
                    ToolTip = 'Specifies the value of the Budget code field.';
                }
                field(InvenLocation; Rec.InvenLocation)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Date_; Rec.Date_)
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Qty; Rec.Qty)
                {
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field(DutyAmount; Rec.DutyAmount)
                {
                    ToolTip = 'Specifies the value of the Duty amount field.';
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field.';
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
                field(Voucher; Rec.Voucher)
                {
                    ToolTip = 'Specifies the value of the Voucher field.';
                }
                field(InvoiceNumber; Rec.InvoiceNumber)
                {
                    ToolTip = 'Specifies the value of the Invoice field.';
                }
                field(Module; Rec.Module)
                {
                    ToolTip = 'Specifies the value of the Module field.';
                }
                field(Number; Rec.Number)
                {
                    ToolTip = 'Specifies the value of the Number field.';
                }
                field(Account; Rec.Account)
                {
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Employee; Rec.Employee)
                {
                    ToolTip = 'Specifies the value of the Employee field.';
                }
                field(Txt; Rec.Txt)
                {
                    ToolTip = 'Specifies the value of the Text field.';
                }
                field(InOutflow; Rec.InOutflow)
                {
                    ToolTip = 'Specifies the value of the Movement field.';
                }
                field(CostAmount; Rec.CostAmount)
                {
                    ToolTip = 'Specifies the value of the Cost value in LCY field.';
                }
                field(SerialNumber; Rec.SerialNumber)
                {
                    ToolTip = 'Specifies the value of the Serial/Batch number field.';
                }
                field(SettledQty; Rec.SettledQty)
                {
                    ToolTip = 'Specifies the value of the Settled qty field.';
                }
                field(SettledAmount; Rec.SettledAmount)
                {
                    ToolTip = 'Specifies the value of the Settled amount field.';
                }
                field(InvestTax; Rec.InvestTax)
                {
                    ToolTip = 'Specifies the value of the Invest. duty field.';
                }
                field(PostedDiffAmount; Rec.PostedDiffAmount)
                {
                    ToolTip = 'Specifies the value of the Adjustment field.';
                }
                field(Open; Rec.Open)
                {
                    ToolTip = 'Specifies the value of the Open field.';
                }
                field(InvenTransType; Rec.InvenTransType)
                {
                    ToolTip = 'Specifies the value of the Entry type field.';
                }
                field(RefRecId; Rec.RefRecId)
                {
                    ToolTip = 'Specifies the value of the EntryRef field.';
                }
                field(Transaction; Rec.Transaction)
                {
                    ToolTip = 'Specifies the value of the Transaction field.';
                }
                field(InvenStatus; Rec.InvenStatus)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(PackingSlip; Rec.PackingSlip)
                {
                    ToolTip = 'Specifies the value of the Packing slip field.';
                }
                field(InvenItemGroup; Rec.InvenItemGroup)
                {
                    ToolTip = 'Specifies the value of the Item group field.';
                }
                field(CustVendGroup; Rec.CustVendGroup)
                {
                    ToolTip = 'Specifies the value of the Cust./Vend. Group field.';
                }
                field(DiscAmount; Rec.DiscAmount)
                {
                    ToolTip = 'Specifies the value of the Disc. amount field.';
                }
                field(LedgerAccount; Rec.LedgerAccount)
                {
                    ToolTip = 'Specifies the value of the G/L account field.';
                }
                field(CostType; Rec.CostType)
                {
                    ToolTip = 'Specifies the value of the Cost type field.';
                }
                field(CommissionAmount; Rec.CommissionAmount)
                {
                    ToolTip = 'Specifies the value of the Commission amount field.';
                }
                field(CommissionSettled; Rec.CommissionSettled)
                {
                    ToolTip = 'Specifies the value of the Commission settled field.';
                }
                field(Vat; Rec.Vat)
                {
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(ProjCostPLPosted; Rec.ProjCostPLPosted)
                {
                    ToolTip = 'Specifies the value of the P/L posted in project field.';
                }
                field(ProjCostPLAcc; Rec.ProjCostPLAcc)
                {
                    ToolTip = 'Specifies the value of the Cost P/L a/c field.';
                }
                field(COGSAccount; Rec.COGSAccount)
                {
                    ToolTip = 'Specifies the value of the COGS account field.';
                }
                field(InventoryAcc; Rec.InventoryAcc)
                {
                    ToolTip = 'Specifies the value of the Inventory a/c field.';
                }
                field(ProfitLossAmount; Rec.ProfitLossAmount)
                {
                    ToolTip = 'Specifies the value of the Loss/Profit field.';
                }
                field(DEL_DutyCode; Rec.DEL_DutyCode)
                {
                    ToolTip = 'Specifies the value of the DELETEDuty field.';
                }
                field(ExchRate; Rec.ExchRate)
                {
                    ToolTip = 'Specifies the value of the Exch. rate field.';
                }
                field(ExchRateTri; Rec.ExchRateTri)
                {
                    ToolTip = 'Specifies the value of the Tri rate field.';
                }
                field(DELETED; Rec.DELETED)
                {
                    ToolTip = 'Specifies the value of the Deleted field.';
                }
                field(Centre; Rec.Centre)
                {
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(LineNumber; Rec.LineNumber)
                {
                    ToolTip = 'Specifies the value of the Orig linenumber field.';
                }
                field(ReversedQty; Rec.ReversedQty)
                {
                    ToolTip = 'Specifies the value of the Reversed quantity field.';
                }
                field(ReversedAmount; Rec.ReversedAmount)
                {
                    ToolTip = 'Specifies the value of the Reversed amount field.';
                }
                field(TmpFunction; Rec.TmpFunction)
                {
                    ToolTip = 'Specifies the value of the Tmp function field.';
                }
                field(CollectNumber; Rec.CollectNumber)
                {
                    ToolTip = 'Specifies the value of the Collective number field.';
                }
                field(SkipSettle; Rec.SkipSettle)
                {
                    ToolTip = 'Specifies the value of the Exclude from settlement field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
