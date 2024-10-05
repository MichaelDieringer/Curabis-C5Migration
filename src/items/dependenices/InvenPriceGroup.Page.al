namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 InvenPriceGroup (ID 51868).
/// </summary>
page 51868 "C5 InvenPriceGroup"
{
    PageType = Card;
    SourceTable = "C5 InvenPriceGroup";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Inventory Price Groups';
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Group field.';
                }
                field(GroupName; Rec.GroupName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Group name field.';
                }
                field(InclVat; Rec.InclVat)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incl. VAT field.';
                }
                field(Roundoff1; Rec.Roundoff1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Round 1 field.';
                }
                field(Roundoff10; Rec.Roundoff10)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Round 10 field.';
                }
                field(Roundoff100; Rec.Roundoff100)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Round 100 field.';
                }
                field(Roundoff1000; Rec.Roundoff1000)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Round 1000 field.';
                }
                field(Roundoff1000Plus; Rec.Roundoff1000Plus)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Round 1000 Plus field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
