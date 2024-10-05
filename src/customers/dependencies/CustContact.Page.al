namespace CurabisC5.CurabisCMigration;

/// <summary>
/// Page C5 CustContact (ID 51906).
/// /// /// </summary>
#pragma implicitwith disable
page 51906 "C5 CustContact"
{
    PageType = List;
    SourceTable = "C5 CustContact";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Customer Contact Persons';
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field(Address1; Rec.Address1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address1 field.';
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address2 field.';
                }
                field(ZipCity; Rec.ZipCity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ZipCity field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
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
                field(LocalNumber; Rec.LocalNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LocalNumber field.';
                }
                field(CellPhone; Rec.CellPhone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CellPhone field.';
                }
                field(PrimaryContact; Rec.PrimaryContact)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PrimaryContact field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
