namespace CurabisC5.CurabisCMigration;

table 51898 "C5 2008 InvenBOM"
{
    ReplicateData = false;

    fields
    {
        field(1; RecId; Integer) { }
        field(2; LastChanged; Date) { }
        field(3; BOMItemNumber; Code[20]) { }
        field(4; LineNumber; Decimal) { }
        field(5; ItemNumber; Code[20]) { }
        field(6; Qty; Decimal) { }
        field(7; Position; Text[10]) { }
        field(8; LeadTime; Decimal) { }
        field(9; Resource; Text[10]) { }
        field(10; InvenLocation; Text[10]) { }
        field(11; Comment; Text[30]) { }
        field(12; PriceGroup; Text[10]) { }
    }

    keys
    {
        key(PK; RecId)
        {
            Clustered = true;
        }
    }
}

