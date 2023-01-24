

/// <summary>
/// Table C5 CN8Code (ID 51864).
/// </summary>
table 51864 "C5 CN8Code"
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
        field(3; CN8Code; Code[20])  // extended from 10 to 20 MID 2023-01-06
        {
            Caption = 'Item CN8 codes';
        }
        field(4; Txt; Text[30])
        {
            Caption = 'Text';
        }
        field(5; SupplementaryUnits; Text[13])
        {
            Caption = 'Supplementary unit';
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

