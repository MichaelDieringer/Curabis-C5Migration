namespace CurabisC5.CurabisCMigration;

table 51896 "C5 2008 InvenLocation"
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
        field(3; InvenLocation; Text[10])
        {
            Caption = 'Location';
        }
        field(4; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(5; RESERVED1; Text[10])
        {
            Caption = 'RESERVED1';
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

