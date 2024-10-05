namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenTable (ID 51862).
/// </summary>
page 51862 "C5 2008 InvenTable"
{
    PageType = Card;
    SourceTable = "C5 2008 InvenTable";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Inventory Table';
    PromotedActionCategories = 'Related Entities';
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {

                field(ItemNumber; Rec.ItemNumber)
                {
                    ToolTip = 'Specifies the value of the Item number field.';
                }
                field(ItemName1; Rec.ItemName1)
                {
                    ToolTip = 'Specifies the value of the Item name field.';
                }
                field(ItemName2; Rec.ItemName2)
                {
                    ToolTip = 'Specifies the value of the Suppl. item name 1 field.';
                }
                field(ItemName3; Rec.ItemName3)
                {
                    ToolTip = 'Specifies the value of the Suppl. item name 2 field.';
                }
                field(ItemType; Rec.ItemType)
                {
                    ToolTip = 'Specifies the value of the Item type field.';
                }
                field(DiscGroup; Rec.DiscGroup)
                {
                    ToolTip = 'Specifies the value of the Discount group field.';
                }
                field(CostCurrency; Rec.CostCurrency)
                {
                    ToolTip = 'Specifies the value of the Cost currency field.';
                }
                field(CostPrice; Rec.CostPrice)
                {
                    ToolTip = 'Specifies the value of the Cost price field.';
                }
                field(Group; Rec.Group)
                {
                    ToolTip = 'Specifies the value of the Group field.';
                }
                field(SalesModel; Rec.SalesModel)
                {
                    ToolTip = 'Specifies the value of the Sales model field.';
                }
                field(CostingMethod; Rec.CostingMethod)
                {
                    ToolTip = 'Specifies the value of the Inven. model field.';
                }
                field(PurchSeriesSize; Rec.PurchSeriesSize)
                {
                    ToolTip = 'Specifies the value of the Purch. qty field.';
                }
                field(PrimaryVendor; Rec.PrimaryVendor)
                {
                    ToolTip = 'Specifies the value of the Primary Vendor field.';
                }
                field(VendItemNumber; Rec.VendItemNumber)
                {
                    ToolTip = 'Specifies the value of the Vendor item no. field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Locked field.';
                }
                field(Alternative; Rec.Alternative)
                {
                    ToolTip = 'Specifies the value of the Alternative field.';
                }
                field(AltItemNumber; Rec.AltItemNumber)
                {
                    ToolTip = 'Specifies the value of the Alt. item field.';
                }
                field(Decimals_; Rec.Decimals_)
                {
                    ToolTip = 'Specifies the value of the Decimals field.';
                }
                field(DEL_SalesDuty; Rec.DEL_SalesDuty)
                {
                    ToolTip = 'Specifies the value of the DELETESalesDuty field.';
                }
                field(Commission; Rec.Commission)
                {
                    ToolTip = 'Specifies the value of the Commission field.';
                }
                field(ImageFile; Rec.ImageFile)
                {
                    ToolTip = 'Specifies the value of the Image field.';
                }
                field(NetWeight; Rec.NetWeight)
                {
                    ToolTip = 'Specifies the value of the Net weight field.';
                }
                field(Volume; Rec.Volume)
                {
                    ToolTip = 'Specifies the value of the Volume field.';
                }
                field(TariffNumber; Rec.TariffNumber)
                {
                    ToolTip = 'Specifies the value of the Item CN8 codes field.';
                }
                field(UnitCode; Rec.UnitCode)
                {
                    ToolTip = 'Specifies the value of the Unit field.';
                }
                field(OneTimeItem; Rec.OneTimeItem)
                {
                    ToolTip = 'Specifies the value of the One-off item field.';
                }
                field(CostType; Rec.CostType)
                {
                    ToolTip = 'Specifies the value of the Cost type field.';
                }
                field(ExtraCost; Rec.ExtraCost)
                {
                    ToolTip = 'Specifies the value of the Misc. charges field.';
                }
                field(PurchCostModel; Rec.PurchCostModel)
                {
                    ToolTip = 'Specifies the value of the Purch. cost model field.';
                }
                field(MainLocation; Rec.MainLocation)
                {
                    ToolTip = 'Specifies the value of the Main inventory field.';
                }
                field(InvenLocation; Rec.InvenLocation)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(PurchVat; Rec.PurchVat)
                {
                    ToolTip = 'Specifies the value of the Purch. VAT field.';
                }
                field(RESERVED2; Rec.RESERVED2)
                {
                    ToolTip = 'Specifies the value of the RESERVED2 field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ToolTip = 'Specifies the value of the Inventory field.';
                }
                field(Delivered; Rec.Delivered)
                {
                    ToolTip = 'Specifies the value of the Delivered field.';
                }
                field(Reserved; Rec.Reserved)
                {
                    ToolTip = 'Specifies the value of the Reserved field.';
                }
                field(Received; Rec.Received)
                {
                    ToolTip = 'Specifies the value of the Received field.';
                }
                field(Ordered; Rec.Ordered)
                {
                    ToolTip = 'Specifies the value of the Ordered field.';
                }
                field(InventoryValue; Rec.InventoryValue)
                {
                    ToolTip = 'Specifies the value of the Inventory value in LCY field.';
                }
                field(DeliveredValue; Rec.DeliveredValue)
                {
                    ToolTip = 'Specifies the value of the Value delivered in LCY field.';
                }
                field(ReceivedValue; Rec.ReceivedValue)
                {
                    ToolTip = 'Specifies the value of the Value received in LCY field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(CostPriceUnit; Rec.CostPriceUnit)
                {
                    ToolTip = 'Specifies the value of the Cost price unit field.';
                }
                field(DEL_PurchDuty; Rec.DEL_PurchDuty)
                {
                    ToolTip = 'Specifies the value of the DELETEPurchDuty field.';
                }
                field(Level; Rec.Level)
                {
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field(Pulled; Rec.Pulled)
                {
                    ToolTip = 'Specifies the value of the Pulled field.';
                }
                field(WarnNegativeInventory; Rec.WarnNegativeInventory)
                {
                    ToolTip = 'Specifies the value of the Warning field.';
                }
                field(NegativeInventory; Rec.NegativeInventory)
                {
                    ToolTip = 'Specifies the value of the Negative field.';
                }
                field(IgnoreListCode; Rec.IgnoreListCode)
                {
                    ToolTip = 'Specifies the value of the -Lst field.';
                }
                field(PayCType; Rec.PayCType)
                {
                    ToolTip = 'Specifies the value of the Payroll CT field.';
                }
                field(ItemTracking; Rec.ItemTracking)
                {
                    ToolTip = 'Specifies the value of the Item tracking field.';
                }
                field(ItemTrackGroup; Rec.ItemTrackGroup)
                {
                    ToolTip = 'Specifies the value of the Tracking group field.';
                }
                field(ProjCostFactor; Rec.ProjCostFactor)
                {
                    ToolTip = 'Specifies the value of the Proj. factor field.';
                }
                field(Centre; Rec.Centre)
                {
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(SupplFactor; Rec.SupplFactor)
                {
                    ToolTip = 'Specifies the value of the Suppl. factor field.';
                }
                field(SupplementaryUnits; Rec.SupplementaryUnits)
                {
                    ToolTip = 'Specifies the value of the Supplementary unit field.';
                }
                field(MarkedPhysical; Rec.MarkedPhysical)
                {
                    ToolTip = 'Specifies the value of the Mrk. physical field.';
                }
                field(LastMovementDate; Rec.LastMovementDate)
                {
                    ToolTip = 'Specifies the value of the Latest movement field.';
                }
                field(VatGroup; Rec.VatGroup)
                {
                    ToolTip = 'Specifies the value of the VAT group field.';
                }
                field(StdItemNumber; Rec.StdItemNumber)
                {
                    ToolTip = 'Specifies the value of the Default field.';
                }
#pragma warning restore
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

                action(C5InvenCustDisc)
                {
                    Caption = 'Item Discount';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Discount;
                    RunObject = Page "C5 2008 InvenDiscGroup";
                    RunPageLink = DiscGroup = field(DiscGroup);
                    RunPageMode = Edit;
                    Enabled = Rec.DiscGroup <> '';
                    ToolTip = 'Executes the Item Discount action.';
                }

                action(C5InvenPrice)
                {
                    Caption = 'Inventory Prices';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Price;
                    RunObject = Page "C5 2008 InvenPrice";
                    RunPageLink = ItemNumber = field(ItemNumber);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Inventory Prices action.';
                }

                action(C5CN8Code)
                {
                    Caption = 'Item CN8 Codes';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = BarCode;
                    RunObject = Page "C5 2008 CN8Code";
                    RunPageLink = CN8Code = field(TariffNumber);
                    RunPageMode = Edit;
                    Enabled = Rec.TariffNumber <> '';
                    ToolTip = 'Executes the Item CN8 Codes action.';
                }

                action(InvenItemGroup)
                {
                    Caption = 'Item Groups';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Group;
                    RunObject = Page "C5 2008 InvenItemGroup";
                    RunPageLink = Group = field(Group);
                    RunPageMode = Edit;
                    Enabled = Rec.Group <> '';
                    ToolTip = 'Executes the Item Groups action.';
                }

                action(InvenTrans)
                {
                    Caption = 'Inventory Entries';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = EntriesList;
                    RunObject = Page "C5 2008 InvenTrans";
                    RunPageLink = ItemNumber = field(ItemNumber), Open = const(Yes), BudgetCode = const(Actual);
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Inventory Entries action.';
                }

                action(BOM)
                {
                    Caption = 'Bill of Materials';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = BOM;
                    RunObject = Page "C5 2008 InvenBOM List";
                    RunPageLink = BOMItemNumber = field(ItemNumber);
                    RunPageMode = Edit;
                    Enabled = BOMActionEnabled;
                    ToolTip = 'Executes the Bill of Materials action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        C5InvenBOM: Record "C5 2008 InvenBOM";
    begin
        C5InvenBOM.SetRange(BOMItemNumber, Rec.ItemNumber);
        BOMActionEnabled := not C5InvenBOM.IsEmpty();
    end;

    var
        BOMActionEnabled: Boolean;
}
#pragma implicitwith restore
