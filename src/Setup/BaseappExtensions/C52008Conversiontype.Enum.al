namespace CurabisC5.CurabisCMigration;

enum 51800 "C5 2008 Conversion type"
{
    Extensible = true;

    value(0; Skip)
    {
        Caption = 'Skip';
    }
    value(1; "Base tables only")
    {
        Caption = 'Base tables only';
    }
    value(2; "Base and Transactions")
    {
        Caption = 'Base and Transactions';
    }
}
