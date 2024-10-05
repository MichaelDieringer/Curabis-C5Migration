namespace CurabisC5.CurabisCMigration;

table 51869 "C5 2008 VatGroup"
{
    ReplicateData = false;

    fields
    {
        field(1; RecId; Integer)
        {
            Caption = 'Row number';
        }
        field(2; LastChanged; Date)
        {
            Caption = 'Last changed';
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = Inventory,Customer,Vendor;
        }
        field(4; Group; Code[10])
        {
            Caption = 'VAT group';
        }
        field(5; Description; Text[30])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; RecId)
        {
            Clustered = true;
        }
    }
}

