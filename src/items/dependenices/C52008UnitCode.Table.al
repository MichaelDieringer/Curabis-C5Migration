namespace CurabisC5.CurabisCMigration;

table 51870 "C5 2008 UnitCode"
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
        field(3; UnitCode; Code[10])
        {
            Caption = 'Unit';
        }
        field(4; Txt; Text[30])
        {
            Caption = 'Text';
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

