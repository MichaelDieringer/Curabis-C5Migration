namespace CurabisC5.CurabisCMigration;



/// <summary>
/// Page C5 LedTable (ID 51863).
/// /// /// </summary>
#pragma implicitwith disable
page 51863 "C5 LedTable"
{
    PageType = Card;
    SourceTable = "C5 LedTable";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 G/L Table';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {

                field(Account; Rec.Account)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account field.';
                }
                field(AccountName; Rec.AccountName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account name field.';
                }
                field(AccountType; Rec.AccountType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the A/c type field.';
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(DCproposal; Rec.DCproposal)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DC proposal field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(MandDepartment; Rec.MandDepartment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mandatory department field.';
                }
                field(OffsetAccount; Rec.OffsetAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offset a/c field.';
                }
                field(Access; Rec.Access)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Access field.';
                }
                field(TotalFromAccount; Rec.TotalFromAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total from field.';
                }
                field(Vat; Rec.Vat)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(BalanceCur; Rec.BalanceCur)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance currency field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(CostType; Rec.CostType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost type field.';
                }
                field(Counterunit; Rec.Counterunit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Counter total field.';
                }
                field(ImageFile; Rec.ImageFile)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Image field.';
                }
                field(BalanceMST; Rec.BalanceMST)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance in LCY field.';
                }
                field(TmpNumerals05; Rec.TmpNumerals05)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum05 field.';
                }
                field(TmpNumerals06; Rec.TmpNumerals06)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum06 field.';
                }
                field(TmpNumerals07; Rec.TmpNumerals07)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum07 field.';
                }
                field(TmpNumerals08; Rec.TmpNumerals08)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum08 field.';
                }
                field(TmpNumerals09; Rec.TmpNumerals09)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum09 field.';
                }
                field(TmpNumerals10; Rec.TmpNumerals10)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum10 field.';
                }
                field(TmpNumerals11; Rec.TmpNumerals11)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum11 field.';
                }
                field(TmpNumerals12; Rec.TmpNumerals12)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum12 field.';
                }
                field(TmpNumerals13; Rec.TmpNumerals13)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TmpNum13 field.';
                }
                field(CompanyGroupAcc; Rec.CompanyGroupAcc)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Corporate a/c field.';
                }
                field(ExchAdjust; Rec.ExchAdjust)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exch. adjustment field.';
                }
                field(Balance02; Rec.Balance02)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance in field.';
                }
                field(EDIIndex; Rec.EDIIndex)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the EDI index field.';
                }
                field(Centre; Rec.Centre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }
                field(MandCentre; Rec.MandCentre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mandatory cost centre field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(MandPurpose; Rec.MandPurpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mandatory purpose field.';
                }
                field(VatBlocked; Rec.VatBlocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT locked field.';
                }
                field(OpeningAccount; Rec.OpeningAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Opening account field.';
                }
#pragma warning restore
            }
        }
    }
}
#pragma implicitwith restore
