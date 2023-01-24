

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
    layout
    {
        area(content)
        {
            repeater(General)
            {
#pragma warning disable AA0218
                field(Account; Rec.Account) { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field(Position; Rec.Position) { ApplicationArea = All; }
                field(Address1; Rec.Address1) { ApplicationArea = All; }
                field(Address2; Rec.Address2) { ApplicationArea = All; }
                field(ZipCity; Rec.ZipCity) { ApplicationArea = All; }
                field(Country; Rec.Country) { ApplicationArea = All; }
                field(Email; Rec.Email) { ApplicationArea = All; }
                field(Phone; Rec.Phone) { ApplicationArea = All; }
                field(Fax; Rec.Fax) { ApplicationArea = All; }
                field(LocalNumber; Rec.LocalNumber) { ApplicationArea = All; }
                field(CellPhone; Rec.CellPhone) { ApplicationArea = All; }
                field(PrimaryContact; Rec.PrimaryContact) { ApplicationArea = All; }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
