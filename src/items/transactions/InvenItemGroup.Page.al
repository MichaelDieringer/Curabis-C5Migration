

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenItemGroup (ID 51867).
/// </summary>
page 51867 "C5 InvenItemGroup"
{
    PageType = Card;
    SourceTable = "C5 InvenItemGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Item Groups';

    layout
    {
        area(content)
        {
            group(General)
            {
#pragma warning disable AA0218
                field(Group; Rec.Group) { ApplicationArea = All; }
                field(GroupName; Rec.GroupName) { ApplicationArea = All; }
                field(SalesAcc; Rec.SalesAcc) { ApplicationArea = All; }
                field(COGSAcc; Rec.COGSAcc) { ApplicationArea = All; }
                field(SalesDiscAcc; Rec.SalesDiscAcc) { ApplicationArea = All; }
                field(InventoryInflowAcc; Rec.InventoryInflowAcc) { ApplicationArea = All; }
                field(InventoryOutflowAcc; Rec.InventoryOutflowAcc) { ApplicationArea = All; }
                field(LossAcc; Rec.LossAcc) { ApplicationArea = All; }
                field(ProfitAcc; Rec.ProfitAcc) { ApplicationArea = All; }
                field(InterimInflowOffset; Rec.InterimInflowOffset) { ApplicationArea = All; }
                field(InterimOutflowOffset; Rec.InterimOutflowOffset) { ApplicationArea = All; }
                field(ProfitMarginPct; Rec.ProfitMarginPct) { ApplicationArea = All; }
                field(InterimInflowAcc; Rec.InterimInflowAcc) { ApplicationArea = All; }
                field(InterimOutflowAcc; Rec.InterimOutflowAcc) { ApplicationArea = All; }
                field(PurchDiscAcc; Rec.PurchDiscAcc) { ApplicationArea = All; }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
