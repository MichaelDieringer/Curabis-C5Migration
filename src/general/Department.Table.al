

table 51865 "C5 Department"
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
        field(3; Department; Code[10])
        {
            Caption = 'Department';
        }
        field(4; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(5; C4Department; Integer)
        {
            Caption = 'C4 dept.';
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

