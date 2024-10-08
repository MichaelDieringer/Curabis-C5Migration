namespace CurabisC5.CurabisCMigration;

table 51866 "C5 2008 InvenDiscGroup"
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
        field(3; DiscGroup; Code[20])
        {
            Caption = 'Discount group';
        }
        field(4; Comment; Text[30])
        {
            Caption = 'Comment';
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

