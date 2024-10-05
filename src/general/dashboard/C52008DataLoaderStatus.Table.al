namespace CurabisC5.CurabisCMigration;
/// <summary>
/// Table C5 Data Loader Status (ID 51902).
/// </summary>
table 51902 "C5 2008 Data Loader Status"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; PK; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(2; Proccessed; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(3; Total; Integer)
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; PK)
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

    /// <summary>
    /// Initialize.
    /// </summary>
    /// <param name="TotalRecords">Integer.</param>
    procedure Initialize(TotalRecords: Integer)
    begin
        GetSingleInstance();
        Total := TotalRecords;
        Modify();
    end;

    /// <summary>
    /// GetProgressPercentage.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetProgressPercentage(): Integer
    begin
        GetSingleInstance();
        if Total <> 0 then
            exit(Round(Proccessed / Total * 100, 2));
    end;

    /// <summary>
    /// IncrementProccessedRecords.
    /// </summary>
    /// <param name="Records">Integer.</param>
    procedure IncrementProccessedRecords(Records: Integer)
    begin
        GetSingleInstance();
        Proccessed += Records;
        Modify();
        // Update Dashboard
        Commit();
    end;
}