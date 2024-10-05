namespace CurabisC5.CurabisCMigration;

#pragma implicitwith disable
/// <summary>
/// Page C5 VendContact (ID 51905).
/// </summary>
page 51905 "C5 VendContact"
{
    PageType = List;
    SourceTable = "C5 VendContact";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Vendor Contact Persons';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Account; Rec.Account)
                {
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Position; Rec.Position)
                {
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field(Address1; Rec.Address1)
                {
                    ToolTip = 'Specifies the value of the Address1 field.';
                }
                field(Address2; Rec.Address2)
                {
                    ToolTip = 'Specifies the value of the Address2 field.';
                }
                field(ZipCity; Rec.ZipCity)
                {
                    ToolTip = 'Specifies the value of the ZipCity field.';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field(Fax; Rec.Fax)
                {
                    ToolTip = 'Specifies the value of the Fax field.';
                }
                field(LocalNumber; Rec.LocalNumber)
                {
                    ToolTip = 'Specifies the value of the LocalNumber field.';
                }
                field(CellPhone; Rec.CellPhone)
                {
                    ToolTip = 'Specifies the value of the CellPhone field.';
                }
                field(PrimaryContact; Rec.PrimaryContact)
                {
                    ToolTip = 'Specifies the value of the PrimaryContact field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
