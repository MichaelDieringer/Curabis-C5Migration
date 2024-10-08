namespace CurabisC5.CurabisCMigration;

table 51871 "C5 2008 ItemTrackGroup"
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
        field(3; Group; Code[10])
        {
            Caption = 'Group';
        }
        field(4; Prefix; Text[10])
        {
            Caption = 'Prefix';
        }
        field(5; NumberSeries; Text[20])
        {
            Caption = 'Voucher series';
        }
        field(6; PostFix; Text[10])
        {
            Caption = 'Postfix';
        }
        field(7; BOMUpdate; Option)
        {
            Caption = 'Update BOM';
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

