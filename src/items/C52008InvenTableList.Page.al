namespace CurabisC5.CurabisCMigration;
using System.Integration;

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenTable List (ID 51901).
/// </summary>
page 51901 "C5 2008 InvenTable List"
{
    PageType = List;
    SourceTable = "C5 2008 InvenTable";
    CardPageId = "C5 2008 InvenTable";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    Caption = 'Items';
    ApplicationArea = all;
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
                    ApplicationArea = All;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the MigrationErrorText field.';
                }
                field(ItemNumber; Rec.ItemNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item number field.';
                }
                field(ItemName1; Rec.ItemName1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item name field.';
                }
                field(ItemName2; Rec.ItemName2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Suppl. item name 1 field.';
                }
                field(ItemName3; Rec.ItemName3)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Suppl. item name 2 field.';
                }
                field(ItemType; Rec.ItemType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item type field.';
                }
                field(DiscGroup; Rec.DiscGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount group field.';
                }
                field(CostCurrency; Rec.CostCurrency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost currency field.';
                }
                field(CostPrice; Rec.CostPrice)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost price field.';
                }
                field(Group; Rec.Group)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Group field.';
                }
                field(SalesModel; Rec.SalesModel)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales model field.';
                }
                field(CostingMethod; Rec.CostingMethod)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inven. model field.';
                }
                field(PurchSeriesSize; Rec.PurchSeriesSize)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purch. qty field.';
                }
                field(PrimaryVendor; Rec.PrimaryVendor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Vendor field.';
                }
                field(VendItemNumber; Rec.VendItemNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor item no. field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Locked field.';
                }
                field(Alternative; Rec.Alternative)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Alternative field.';
                }
                field(AltItemNumber; Rec.AltItemNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Alt. item field.';
                }
                field(Decimals_; Rec.Decimals_)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Decimals field.';
                }
                field(DEL_SalesDuty; Rec.DEL_SalesDuty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DELETESalesDuty field.';
                }
                field(Commission; Rec.Commission)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Commission field.';
                }
                field(ImageFile; Rec.ImageFile)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Image field.';
                }
                field(NetWeight; Rec.NetWeight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net weight field.';
                }
                field(Volume; Rec.Volume)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Volume field.';
                }
                field(TariffNumber; Rec.TariffNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item CN8 codes field.';
                }
                field(UnitCode; Rec.UnitCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit field.';
                }
                field(OneTimeItem; Rec.OneTimeItem)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the One-off item field.';
                }
                field(CostType; Rec.CostType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost type field.';
                }
                field(ExtraCost; Rec.ExtraCost)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Misc. charges field.';
                }
                field(PurchCostModel; Rec.PurchCostModel)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purch. cost model field.';
                }
                field(MainLocation; Rec.MainLocation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Main inventory field.';
                }
                field(InvenLocation; Rec.InvenLocation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(PurchVat; Rec.PurchVat)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purch. VAT field.';
                }
                field(RESERVED2; Rec.RESERVED2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the RESERVED2 field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory field.';
                }
                field(Delivered; Rec.Delivered)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivered field.';
                }
                field(Reserved; Rec.Reserved)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reserved field.';
                }
                field(Received; Rec.Received)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received field.';
                }
                field(Ordered; Rec.Ordered)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ordered field.';
                }
                field(InventoryValue; Rec.InventoryValue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory value in LCY field.';
                }
                field(DeliveredValue; Rec.DeliveredValue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Value delivered in LCY field.';
                }
                field(ReceivedValue; Rec.ReceivedValue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Value received in LCY field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(CostPriceUnit; Rec.CostPriceUnit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost price unit field.';
                }
                field(DEL_PurchDuty; Rec.DEL_PurchDuty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DELETEPurchDuty field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field(Pulled; Rec.Pulled)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pulled field.';
                }
                field(WarnNegativeInventory; Rec.WarnNegativeInventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Warning field.';
                }
                field(NegativeInventory; Rec.NegativeInventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Negative field.';
                }
                field(IgnoreListCode; Rec.IgnoreListCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the -Lst field.';
                }
                field(PayCType; Rec.PayCType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll CT field.';
                }
                field(ItemTracking; Rec.ItemTracking)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item tracking field.';
                }
                field(ItemTrackGroup; Rec.ItemTrackGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tracking group field.';
                }
                field(ProjCostFactor; Rec.ProjCostFactor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Proj. factor field.';
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
                field(SupplFactor; Rec.SupplFactor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Suppl. factor field.';
                }
                field(SupplementaryUnits; Rec.SupplementaryUnits)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supplementary unit field.';
                }
                field(MarkedPhysical; Rec.MarkedPhysical)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mrk. physical field.';
                }
                field(LastMovementDate; Rec.LastMovementDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Latest movement field.';
                }
                field(VatGroup; Rec.VatGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT group field.';
                }
                field(StdItemNumber; Rec.StdItemNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default field.';
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
