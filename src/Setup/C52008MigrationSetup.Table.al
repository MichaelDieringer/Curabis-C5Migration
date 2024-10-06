namespace CurabisC5.CurabisCMigration;

table 51801 "C5 2008 Migration Setup"
{
    Caption = '2008 Migration Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Conversion of items"; Enum "Conversion type")
        {
            Caption = 'Conversion of Items';
            InitValue = 3;
        }
        field(3; "Conversion of Vendors"; Enum "Conversion type")
        {
            Caption = 'Conversion of Vendors';
            InitValue = 3;
        }
        field(4; "Conversion of Customers"; Enum "Conversion type")
        {
            Caption = 'Conversion of Customers';
            InitValue = 3;
        }
        field(50; "Detailed G/L entries (start)"; Date)
        {
            Caption = 'Detailed G/L entries (start)';
        }
        field(51; "Accounting period (start)"; Integer)
        {
            Caption = 'Accounting period (start)';
            InitValue = 1;
        }
        field(52; "Create Accounting periods"; Boolean)
        {
            Caption = 'Create Accounting periods';
            InitValue = true;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
