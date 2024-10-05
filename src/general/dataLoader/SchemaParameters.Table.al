namespace CurabisC5.CurabisCMigration;

/// <summary>
/// Table C5 Schema Parameters (ID 51887).
/// </summary>
table 51887 "C5 Schema Parameters"
{
    ReplicateData = false;

    fields
    {
        field(1; Dummy; Code[10])
        {
            Caption = 'Dummy';
        }
        field(2; "Zip File"; Text[250])
        {
            Caption = 'Zip File';
        }
        field(3; "Unziped Folder"; Text[250])
        {
            Caption = 'Unziped Folder';
        }
        field(4; "Total Items"; Integer)
        {
            Caption = 'Total Items';
        }
        field(5; "Total Accounts"; Integer)
        {
            Caption = 'Total Accounts';
        }
        field(6; "Total Customers"; Integer)
        {
            Caption = 'Total Customers';
        }
        field(7; "Total Vendors"; Integer)
        {
            Caption = 'Total Vendors';
        }
        field(8; "Total Historical Entries"; Integer)
        {
            Caption = 'Total Historical Entries';
        }
        field(9; "Zip File Blob"; Blob)
        {
            Caption = 'Zip File Blob';
        }
        field(10; CurrentPeriod; Date)
        {
            Caption = 'Current Period';
        }
        field(11; "Total Customer Entries"; Integer)
        {
            Caption = 'Total Historical Entries';
        }
        field(12; "Total Vendor Entries"; Integer)
        {
            Caption = 'Total Historical Entries';
        }
        field(13; "Total Item Entries"; Integer)
        {
            Caption = 'Total Historical Entries';
        }
        field(14; "Unit of measure Code"; code[10])
        {
            Caption = 'Item Unit of Measure Code';
        }
    }

    keys
    {
        key(PK; Dummy)
        {
            Clustered = true;
        }
    }

    /// <summary>
    /// GetSingleInstance.
    /// </summary>
    procedure GetSingleInstance()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert();
        end;
    end;
}