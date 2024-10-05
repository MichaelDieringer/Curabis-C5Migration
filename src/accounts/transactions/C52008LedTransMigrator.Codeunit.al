namespace CurabisC5.CurabisCMigration;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Finance.GeneralLedger.Account;
using System.Integration;

/// <summary>
/// Codeunit C5 LedTrans Migrator (ID 1871).
/// </summary>
codeunit 51871 "C5 2008 LedTrans Migrator"
{
    var
        GeneralJournalBatchCodeTok: Label 'GLACCMIGR', Locked = true;

    trigger OnRun();
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
        GenJournalLine: Record "Gen. Journal Line";
        C5LedTrans: Record "C5 2008 LedTrans";
        GenJournalBatch: Record "Gen. Journal Batch";
        DataMigrationStatus: Record "Data Migration Status";
        DataMigrationStatusFacade: Codeunit "Data Migration Status Facade";
        C5MigrDashboardMgt: Codeunit "C5 2008 Migr. Dashboard Mgt";
        CurrentAccount: Code[10];
        TotalAmount: Decimal;
        PostingDate: Date;
        Batch: Integer;
    begin
        if not ChartOfAccountsMigrated() then begin
            DataMigrationStatus.SetRange("Migration Type", C5MigrDashboardMgt.GetC5MigrationTypeTxt());
            DataMigrationStatus.SetRange("Destination Table ID", Database::"C5 2008 LedTrans");
            DataMigrationStatus.FindFirst();
            DataMigrationStatusFacade.UpdateLineStatus(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", DataMigrationStatus.Status::Completed);
            DataMigrationStatusFacade.IncrementMigratedRecordCount(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", DataMigrationStatus."Total Number");
            exit;
        end;

        DataMigrationStatusFacade.UpdateLineStatus(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", DataMigrationStatus.Status::"In Progress");
        C5SchemaParameters.GetSingleInstance();

        PostingDate := CalcDate('<-1D>', C5SchemaParameters.CurrentPeriod);
        C5LedTrans.SetRange(BudgetCode, C5LedTrans.BudgetCode::Actual);
        C5LedTrans.SetFilter(Date_, '<%1&<>%2', C5SchemaParameters.CurrentPeriod, 0D);
        C5LedTrans.SetCurrentKey(Account, Date_, Transaction);
        if C5LedTrans.FindSet() then begin
            CreateGeneralJournalBatchIfNeeded(GenJournalBatch);
            repeat
                DataMigrationStatusFacade.IncrementMigratedRecordCount(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", 1);
#pragma warning disable AA0205
                if CurrentAccount <> C5LedTrans.Account then begin
                    if CurrentAccount <> '' then begin
                        InsertNewGenJournalLine(GenJournalLine, GenJournalBatch, TotalAmount, PostingDate, PostingDate, CurrentAccount, 'C5MIGRATE', '');
                        // Update the DashBoard after each Account balance has been Migrated
                        Commit();
                    end;
#pragma warning restore AA0205
                    CurrentAccount := C5LedTrans.Account;
                    TotalAmount := 0;
                end;
                TotalAmount += C5LedTrans.AmountMST;
            until C5LedTrans.Next() = 0;
            // Insert() last Account
            InsertNewGenJournalLine(GenJournalLine, GenJournalBatch, TotalAmount, PostingDate, PostingDate, CurrentAccount, 'C5MIGRATE', '');
        end;

        C5LedTrans.SetFilter(Date_, '>=%1', C5SchemaParameters.CurrentPeriod);
        C5LedTrans.SetCurrentKey(Date_, Transaction);
        if C5LedTrans.FindSet() then begin
            CreateGeneralJournalBatchIfNeeded(GenJournalBatch);
            repeat
                InsertNewGenJournalLine(GenJournalLine, GenJournalBatch, C5LedTrans.AmountMST, C5LedTrans.Date_, C5LedTrans.DueDate, C5LedTrans.Account, Format(C5LedTrans.Voucher), C5LedTrans.Txt);
                SetGenJournalLineDimensions(GenJournalLine, C5LedTrans);
                DataMigrationStatusFacade.IncrementMigratedRecordCount(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", 1);
                Batch += 1;
                if Batch = 100 then begin
                    // Update the DashBoard
                    Commit();
                    Batch := 0;
                end;
            until C5LedTrans.Next() = 0;
        end;

        // Update the dashboard with the number of system transactions that should not be migrated
        C5LedTrans.Reset();
        C5LedTrans.SetFilter(BudgetCode, '<>%1', C5LedTrans.BudgetCode::Actual);
        if C5LedTrans.FindSet() then
            DataMigrationStatusFacade.IncrementMigratedRecordCount(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", C5LedTrans.Count());
        C5LedTrans.Reset();
        C5LedTrans.SetRange(Date_, 0D);
        if C5LedTrans.FindSet() then
            DataMigrationStatusFacade.IncrementMigratedRecordCount(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", C5LedTrans.Count());
        DataMigrationStatusFacade.UpdateLineStatus(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Database::"C5 2008 LedTrans", DataMigrationStatus.Status::Completed);
    end;



    local procedure InsertNewGenJournalLine(var GenJournalLine: Record "Gen. Journal Line"; GenJournalBatch: Record "Gen. Journal Batch"; LineAmount: Decimal; PostingDate: Date; DueDate: Date; Account: Code[10]; DocumentNo: Text; DescriptionText: Text)
    var
        C5LedTableMigrator: Codeunit "C5 2008 LedTable Migrator";
        LineNo: Integer;
    begin
        if LineAmount = 0 then
            exit;

        GenJournalLine.SetCurrentKey("Line No.");
        GenJournalLine.SetAscending("Line No.", true);
        if GenJournalLine.FindLast() then
            LineNo := GenJournalLine."Line No." + 1;
        GenJournalLine.Init();
        GenJournalLine.Validate("Journal Template Name", GenJournalBatch."Journal Template Name");
        GenJournalLine.Validate("Journal Batch Name", GenJournalBatch.Name);
        GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"G/L Account");
        GenJournalLine.Validate("Account No.", C5LedTableMigrator.FillWithLeadingZeros(Account));
        // Description is filled with the Account Description on the validate above replace it only if not empty
        if DescriptionText <> '' then
            GenJournalLine.Validate(Description, CopyStr(DescriptionText, 1, MaxStrLen(GenJournalLine.Description)));
        GenJournalLine.Validate("Document No.", DocumentNo);
        GenJournalLine.Validate("Line No.", LineNo);
        GenJournalLine.Validate(Amount, LineAmount);
        GenJournalLine.Validate("Posting Date", PostingDate);
        GenJournalLine.Validate("Due Date", DueDate);
        GenJournalLine.Insert(true);

    end;

    local procedure SetGenJournalLineDimensions(var GenJournalLine: Record "Gen. Journal Line"; C5LedTrans: Record "C5 2008 LedTrans")
    var
        GLAccDataMigrationFacade: Codeunit "GL Acc. Data Migration Facade";
        C5HelperFunctions: Codeunit "C5 2008 Helper Functions";
    begin
        //To avoid migrating the Default Dimensions from the G/L Account
        GenJournalLine."Dimension Set Id" := 0;
        GLAccDataMigrationFacade.SetGeneralJournalLineDimension(
            GenJournalLine,
            C5HelperFunctions.GetDepartmentDimensionCodeTxt(),
            C5HelperFunctions.GetDepartmentDimensionDescTxt(),
            C5LedTrans.Department,
            C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Department", C5LedTrans.Department));
        GLAccDataMigrationFacade.SetGeneralJournalLineDimension(
            GenJournalLine,
            C5HelperFunctions.GetCostCenterDimensionCodeTxt(),
            C5HelperFunctions.GetCostCenterDimensionDescTxt(),
            C5LedTrans.Centre,
            C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Centre", C5LedTrans.Centre));
        GLAccDataMigrationFacade.SetGeneralJournalLineDimension(
            GenJournalLine,
            C5HelperFunctions.GetPurposeDimensionCodeTxt(),
            C5HelperFunctions.GetPurposeDimensionDescTxt(),
            C5LedTrans.Purpose,
            C5HelperFunctions.GetDimensionValueName(Database::"C5 2008 Purpose", C5LedTrans.Purpose));
    end;

    local procedure CreateGeneralJournalBatchIfNeeded(var GenJournalBatch: Record "Gen. Journal Batch")
    var
        TemplateName: Code[10];
    begin
        TemplateName := CreateGeneralJournalTemplateIfNeeded(CopyStr(GeneralJournalBatchCodeTok, 1, 10));
        GenJournalBatch.SetRange("Journal Template Name", TemplateName);
        GenJournalBatch.SetRange(Name, GeneralJournalBatchCodeTok);
        GenJournalBatch.SetRange("No. Series", '');
        GenJournalBatch.SetRange("Posting No. Series", '');
        if not GenJournalBatch.FindFirst() then begin
            GenJournalBatch.Init();
            GenJournalBatch.Validate("Journal Template Name", TemplateName);
            GenJournalBatch.SetupNewBatch();
            GenJournalBatch.Validate(Name, GeneralJournalBatchCodeTok);
            GenJournalBatch.Validate(Description, GeneralJournalBatchCodeTok);
            GenJournalBatch."No. Series" := '';
            GenJournalBatch."Posting No. Series" := '';
            GenJournalBatch.Insert(true);
        end;
    end;

    local procedure CreateGeneralJournalTemplateIfNeeded(GeneralJournalBatchCode: Code[10]): Code[10]
    VAR
        GenJournalTemplate: Record "Gen. Journal Template";
    begin
        GenJournalTemplate.SetRange(Type, GenJournalTemplate.Type::General);
        GenJournalTemplate.SetRange(Recurring, FALSE);
        if not GenJournalTemplate.FindFirst() then begin
            GenJournalTemplate.Init();
            GenJournalTemplate.Validate(Name, GeneralJournalBatchCode);
            GenJournalTemplate.Validate(Type, GenJournalTemplate.Type::General);
            GenJournalTemplate.Validate(Recurring, FALSE);
            GenJournalTemplate.Insert(true);
        end;
        exit(GenJournalTemplate.Name);
    end;

    local procedure ChartOfAccountsMigrated(): Boolean
    var
        DataMigrationStatus: Record "Data Migration Status";
        C5MigrDashboardMgt: Codeunit "C5 2008 Migr. Dashboard Mgt";
    begin
        DataMigrationStatus.SetRange("Migration Type", C5MigrDashboardMgt.GetC5MigrationTypeTxt());
        DataMigrationStatus.SetRange("Destination Table ID", Database::"G/L Account");
        exit(not DataMigrationStatus.IsEmpty());
    end;

    /// <summary>
    /// GetHardCodedBatchName.
    /// </summary>
    /// <returns>Return value of type Code[10].</returns>
    procedure GetHardCodedBatchName(): Code[10]
    begin
        exit(CopyStr(GeneralJournalBatchCodeTok, 1, 10));
    end;
}
