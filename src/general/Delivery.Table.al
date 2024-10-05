namespace CurabisC5.CurabisCMigration;

table 51882 "C5 Delivery"
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
        field(3; Delivery; Code[10])
        {
            Caption = 'Delivery';
        }
        field(4; Name; Text[30])
        {
            Caption = 'Name';
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

