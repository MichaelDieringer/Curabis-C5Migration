namespace CurabisC5.CurabisCMigration;

table 51895 "C5 2008 ExchRate"
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
        field(3; Currency; Code[3])
        {
            Caption = 'Currency';
        }
        field(4; ExchRate; Decimal)
        {
            Caption = 'Exch. rate';
        }
        field(5; FromDate; Date)
        {
            Caption = 'From date';
        }
        field(6; Comment; Text[50])
        {
            Caption = 'Comment';
        }
        field(7; Triangulation; Option)
        {
            Caption = 'Triangulation';
            OptionMembers = No,Yes;
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

