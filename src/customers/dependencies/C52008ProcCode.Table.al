namespace CurabisC5.CurabisCMigration;

table 51884 "C5 2008 ProcCode"
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
            OptionMembers = None,Vendor,Customer;
        }
        field(4; Code; Code[10])
        {
            Caption = 'Code';
        }
        field(5; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(6; Int1; Integer)
        {
            Caption = 'Int 1';
        }
        field(7; Int2; Integer)
        {
            Caption = 'Int 2';
        }
        field(8; Int3; Integer)
        {
            Caption = 'Int 3';
        }
        field(9; Int4; Integer)
        {
            Caption = 'Int 4';
        }
        field(10; NoYes1; Option)
        {
            Caption = 'NoYes1';
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

