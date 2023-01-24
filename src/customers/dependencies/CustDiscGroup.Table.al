

table 51883 "C5 CustDiscGroup"
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
        field(3; DiscGroup; Code[10])
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

