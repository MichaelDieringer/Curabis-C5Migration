namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenItemGroup (ID 51867).
/// </summary>
page 51867 "C5 2008 InvenItemGroup"
{
    PageType = Card;
    SourceTable = "C5 2008 InvenItemGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Item Groups';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {

                field(Group; Rec.Group)
                {
                    ToolTip = 'Specifies the value of the Group field.';
                }
                field(GroupName; Rec.GroupName)
                {
                    ToolTip = 'Specifies the value of the Group name field.';
                }
                field(SalesAcc; Rec.SalesAcc)
                {
                    ToolTip = 'Specifies the value of the Sales a/c field.';
                }
                field(COGSAcc; Rec.COGSAcc)
                {
                    ToolTip = 'Specifies the value of the COGS a/c field.';
                }
                field(SalesDiscAcc; Rec.SalesDiscAcc)
                {
                    ToolTip = 'Specifies the value of the LineDiscSales field.';
                }
                field(InventoryInflowAcc; Rec.InventoryInflowAcc)
                {
                    ToolTip = 'Specifies the value of the Inven. inflow field.';
                }
                field(InventoryOutflowAcc; Rec.InventoryOutflowAcc)
                {
                    ToolTip = 'Specifies the value of the Inven. outflow field.';
                }
                field(LossAcc; Rec.LossAcc)
                {
                    ToolTip = 'Specifies the value of the Loss field.';
                }
                field(ProfitAcc; Rec.ProfitAcc)
                {
                    ToolTip = 'Specifies the value of the Profit field.';
                }
                field(InterimInflowOffset; Rec.InterimInflowOffset)
                {
                    ToolTip = 'Specifies the value of the Int. off. inflow a/c field.';
                }
                field(InterimOutflowOffset; Rec.InterimOutflowOffset)
                {
                    ToolTip = 'Specifies the value of the Int. off. outflow a/c field.';
                }
                field(ProfitMarginPct; Rec.ProfitMarginPct)
                {
                    ToolTip = 'Specifies the value of the Profit margin field.';
                }
                field(InterimInflowAcc; Rec.InterimInflowAcc)
                {
                    ToolTip = 'Specifies the value of the Interim inflow field.';
                }
                field(InterimOutflowAcc; Rec.InterimOutflowAcc)
                {
                    ToolTip = 'Specifies the value of the Interim outflow field.';
                }
                field(PurchDiscAcc; Rec.PurchDiscAcc)
                {
                    ToolTip = 'Specifies the value of the LineDiscPurchase field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
