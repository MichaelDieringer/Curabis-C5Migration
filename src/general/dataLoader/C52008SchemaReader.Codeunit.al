namespace CurabisC5.CurabisCMigration;
using Microsoft.Utilities;

/// <summary>
/// Codeunit C5 Schema Reader (ID 51863).
/// </summary>
codeunit 51863 "C5 2008 Schema Reader"
{
    var
        DefinitionFileMissingErr: Label 'Oops, it seems the definition file (exp00000.def) was missing from the zip file.';

    trigger OnRun()
    begin
        ProcessZipFile();
    end;

    local procedure ProcessZipFile()
    var
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
    begin
        Codeunit.Run(Codeunit::"C5 2008 Unzip", TempNameValueBuffer);
        ReadDefinitionFile(TempNameValueBuffer);
    end;

    /// <summary>
    /// GetNumberOfAccounts.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetNumberOfAccounts(): Integer
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
    begin
        C5SchemaParameters.GetSingleInstance();
        exit(C5SchemaParameters."Total Accounts");
    end;

    /// <summary>
    /// GetNumberOfHistoricalEntries.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetNumberOfHistoricalEntries(): Integer
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
    begin
        C5SchemaParameters.GetSingleInstance();
        exit(C5SchemaParameters."Total Historical Entries");
    end;

    /// <summary>
    /// GetNumberOfItems.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetNumberOfItems(): Integer
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
    begin
        C5SchemaParameters.GetSingleInstance();
        exit(C5SchemaParameters."Total Items");
    end;

    /// <summary>
    /// GetNumberOfCustomers.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetNumberOfCustomers(): Integer
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
    begin
        C5SchemaParameters.GetSingleInstance();
        exit(C5SchemaParameters."Total Customers");
    end;

    /// <summary>
    /// GetNumberOfVendors.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetNumberOfVendors(): Integer
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
    begin
        C5SchemaParameters.GetSingleInstance();
        exit(C5SchemaParameters."Total Vendors");
    end;

    /// <summary>
    /// GetDefinitionFileMissingErrorTxt.
    /// </summary>
    /// <returns>Return value of type Text[250].</returns>
    procedure GetDefinitionFileMissingErrorTxt(): Text[250]
    begin
        exit(CopyStr(DefinitionFileMissingErr, 1, 250));
    end;

    local procedure ReadDefinitionFile(var NameValueBuffer: Record "Name/Value Buffer")
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
        Line: Text;
        TableName: Text;
        AccountsFound: Boolean;
        CustomersFound: Boolean;
        VendorsFound: Boolean;
        ItemsFound: Boolean;
        HistoryFound: Boolean;
        CustomerTransactionsFound: Boolean;
        ItemTransactionsFound: Boolean;
        VendorTransactionsFound: Boolean;
        Number: Integer;
        StreamContent: InStream;
    begin
        C5SchemaParameters.GetSingleInstance();
        NameValueBuffer.SetFilter(Name, '*exp00000.def');
        if not NameValueBuffer.FindSet() then begin
            OnDefinitionFileMissing();
            Error(DefinitionFileMissingErr);
        end;
        NameValueBuffer.CalcFields("Value BLOB");
        NameValueBuffer."Value BLOB".CreateInStream(StreamContent);

        repeat
            StreamContent.ReadText(Line);
            if (StrPos(Line, ',') > 0) and (SelectStr(1, Line) = '11') then begin
                TableName := SELECTSTR(2, Line);
                case TableName of
                    '"LedTable"':
                        if not AccountsFound then begin
                            AccountsFound := true;
                            Evaluate(Number, SelectStr(3, Line));
                            C5SchemaParameters."Total Accounts" := Number;
                        end;
                    '"VendTable"':
                        if not VendorsFound then begin
                            VendorsFound := true;
                            Evaluate(Number, SelectStr(3, Line));
                            C5SchemaParameters."Total Vendors" := Number;
                        end;
                    '"CustTable"':
                        if not CustomersFound then begin
                            CustomersFound := true;
                            Evaluate(Number, SelectStr(3, Line));
                            C5SchemaParameters."Total Customers" := Number;
                        end;
                    '"InvenTable"':
                        if not ItemsFound then begin
                            ItemsFound := true;
                            Evaluate(Number, SelectStr(3, Line));
                            C5SchemaParameters."Total Items" := Number;
                        end;
                    '"LedTrans"':
                        if not HistoryFound then begin
                            HistoryFound := true;
                            Evaluate(Number, SelectStr(3, Line));
                            C5SchemaParameters."Total Historical Entries" := Number;
                        end;
                    '"CustTrans"':
                        if not CustomerTransactionsFound then begin
                            CustomerTransactionsFound := true;
                            Evaluate(Number, SelectStr(3, Line));
                            C5SchemaParameters."Total Customer Entries" := Number;
                        end;
                    '"InvenTrans"':
                        if not ItemTransactionsFound then begin
                            ItemTransactionsFound := true;
                            Evaluate(Number, SelectStr(3, Line));
                            C5SchemaParameters."Total Item Entries" := Number;
                        end;
                    '"VendTrans"':
                        if not VendorTransactionsFound then begin
                            VendorTransactionsFound := true;
                            Evaluate(Number, SelectStr(3, Line));
                            C5SchemaParameters."Total Vendor Entries" := Number;
                        end;
                end;
            end;
        until (StreamContent.EOS()) Or
              (AccountsFound and
               CustomersFound and
               VendorsFound and
               ItemsFound and
               HistoryFound and
               CustomerTransactionsFound and
               ItemTransactionsFound and
               VendorTransactionsFound);
        C5SchemaParameters.Modify();
        Commit();

    end;

    [IntegrationEvent(false, false)]
    local procedure OnDefinitionFileMissing()
    begin
    end;

}

