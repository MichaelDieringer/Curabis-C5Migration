namespace CurabisC5.CurabisCMigration;
using Microsoft.Sales.Customer;

table 51899 "C5 2008 CustContact"
{
    ReplicateData = false;

    fields
    {
        field(1; RecId; Integer) { }
        field(2; LastChanged; Date) { }
        field(3; Account; Code[10])
        {
            TableRelation = Customer;
            ValidateTableRelation = false;
        }
        field(4; PrimaryContact; Option) { OptionMembers = No,Yes; }
        field(5; Name; Text[50]) { }
        field(6; Position; Text[10]) { }
        field(7; Address1; Text[50]) { }
        field(8; Address2; Text[50]) { }
        field(9; ZipCity; Text[50]) { }
        field(10; Country; Text[30]) { }
        field(11; Email; Text[80]) { }
        field(12; Phone; Text[20]) { }
        field(13; Fax; Text[20]) { }
        field(14; LocalNumber; Text[20]) { }
        field(15; CellPhone; Text[20]) { }
    }

    keys
    {
        key(PK; RecId)
        {
            Clustered = true;
        }
    }
}

