

#pragma implicitwith disable
/// <summary>
/// Page C5 LedTable List (ID 51903).
/// </summary>
page 51903 "C5 LedTable List"
{
    PageType = List;
    SourceTable = "C5 LedTable";
    CardPageId = "C5 LedTable";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    Caption = 'Accounts';

    layout
    {
        area(content)
        {
            repeater(General)
            {
#pragma warning disable AA0218
                field("Error Message"; MigrationErrorText)
                {
                    ApplicationArea = All;

                    Enabled = false;
                }
                field(Account; Rec.Account) { ApplicationArea = All; }
                field(AccountName; Rec.AccountName) { ApplicationArea = All; }
                field(AccountType; Rec.AccountType) { ApplicationArea = All; }
                field(Code; Rec.Code) { ApplicationArea = All; }
                field(DCproposal; Rec.DCproposal) { ApplicationArea = All; }
                field(Department; Rec.Department) { ApplicationArea = All; }
                field(MandDepartment; Rec.MandDepartment) { ApplicationArea = All; }
                field(OffsetAccount; Rec.OffsetAccount) { ApplicationArea = All; }
                field(Access; Rec.Access) { ApplicationArea = All; }
                field(TotalFromAccount; Rec.TotalFromAccount) { ApplicationArea = All; }
                field(Vat; Rec.Vat) { ApplicationArea = All; }
                field(BalanceCur; Rec.BalanceCur) { ApplicationArea = All; }
                field(Currency; Rec.Currency) { ApplicationArea = All; }
                field(CostType; Rec.CostType) { ApplicationArea = All; }
                field(Counterunit; Rec.Counterunit) { ApplicationArea = All; }
                field(BalanceMST; Rec.BalanceMST) { ApplicationArea = All; }
                field(CompanyGroupAcc; Rec.CompanyGroupAcc) { ApplicationArea = All; }
                field(ExchAdjust; Rec.ExchAdjust) { ApplicationArea = All; }
                field(Balance02; Rec.Balance02) { ApplicationArea = All; }
                field(EDIIndex; Rec.EDIIndex) { ApplicationArea = All; }
                field(Centre; Rec.Centre) { ApplicationArea = All; }
                field(MandCentre; Rec.MandCentre) { ApplicationArea = All; }
                field(Purpose; Rec.Purpose) { ApplicationArea = All; }
                field(MandPurpose; Rec.MandPurpose) { ApplicationArea = All; }
                field(VatBlocked; Rec.VatBlocked) { ApplicationArea = All; }
                field(OpeningAccount; Rec.OpeningAccount) { ApplicationArea = All; }
                field(DEL_UserLock; Rec.DEL_UserLock) { ApplicationArea = All; }
#pragma warning restore
            }
        }
    }

    var
        C5MigrDashboardMgt: Codeunit "C5 Migr. Dashboard Mgt";
        MigrationErrorText: Text[250];

    trigger OnAfterGetRecord();
    var
        DataMigrationError: Record "Data Migration Error";
    begin
        DataMigrationError.GetErrorMessage(C5MigrDashboardMgt.GetC5MigrationTypeTxt(), Rec.RecordId(), MigrationErrorText);
    end;

}
#pragma implicitwith restore
