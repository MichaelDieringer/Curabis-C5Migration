namespace CurabisC5.CurabisCMigration;



/// <summary>
/// XmlPort C5 LedTable (ID 51860).
/// </summary>
xmlport 51860 "C5 LedTable"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = XML;


    schema
    {
        textelement(root)
        {
            MinOccurs = Zero;
            XmlName = 'LedTableDocument';
            tableelement(C5LedTable; "C5 LedTable")
            {
                /* a */
                fieldelement(DEL_UserLock; C5LedTable.DEL_UserLock) { }
                /* b */
                fieldelement(Account; C5LedTable.Account) { }
                /* c */
                fieldelement(AccountName; C5LedTable.AccountName) { }
                /* d */
                fieldelement(AccountType; C5LedTable.AccountType) { }
                /* e */
                fieldelement(Code; C5LedTable.Code) { }
                /* f */
                fieldelement(DCproposal; C5LedTable.DCproposal) { }
                /* g */
                fieldelement(Department; C5LedTable.Department) { }
                /* h */
                fieldelement(MandDepartment; C5LedTable.MandDepartment) { }
                /* i */
                fieldelement(OffsetAccount; C5LedTable.OffsetAccount) { }
                /* j */
                fieldelement(Access; C5LedTable.Access) { }
                /* k */
                fieldelement(TotalFromAccount; C5LedTable.TotalFromAccount) { }
                /* l */
                fieldelement(Vat; C5LedTable.Vat) { }
                /* m */
                fieldelement(BalanceCur; C5LedTable.BalanceCur) { }
                /* n */
                fieldelement(Currency; C5LedTable.Currency) { }
                /* o */
                fieldelement(CostType; C5LedTable.CostType) { }
                /* p */
                fieldelement(Counterunit; C5LedTable.Counterunit) { }
                /* q */
                fieldelement(ImageFile; C5LedTable.ImageFile) { }
                /* r */
                fieldelement(BalanceMST; C5LedTable.BalanceMST) { }
                /* s */
                fieldelement(TmpNumerals05; C5LedTable.TmpNumerals05) { }
                /* t */
                fieldelement(TmpNumerals06; C5LedTable.TmpNumerals06) { }
                /* u */
                fieldelement(TmpNumerals07; C5LedTable.TmpNumerals07) { }
                /* v */
                fieldelement(TmpNumerals08; C5LedTable.TmpNumerals08) { }
                /* w */
                fieldelement(TmpNumerals09; C5LedTable.TmpNumerals09) { }
                /* x */
                fieldelement(TmpNumerals10; C5LedTable.TmpNumerals10) { }
                /* y */
                fieldelement(TmpNumerals11; C5LedTable.TmpNumerals11) { }
                /* z */
                fieldelement(TmpNumerals12; C5LedTable.TmpNumerals12) { }
                /* aa */
                fieldelement(TmpNumerals13; C5LedTable.TmpNumerals13) { }
                /* ab */
                fieldelement(CompanyGroupAcc; C5LedTable.CompanyGroupAcc) { }
                /* ac */
                fieldelement(ExchAdjust; C5LedTable.ExchAdjust) { }
                /* ad */
                fieldelement(Balance02; C5LedTable.Balance02) { }
                /* ae */
                fieldelement(EDIIndex; C5LedTable.EDIIndex) { }
                /* af */
                fieldelement(Centre; C5LedTable.Centre) { }
                /* ag */
                fieldelement(MandCentre; C5LedTable.MandCentre) { }
                /* ah */
                fieldelement(Purpose; C5LedTable.Purpose) { }
                /* ai */
                fieldelement(MandPurpose; C5LedTable.MandPurpose) { }
                /* aj */
                fieldelement(VatBlocked; C5LedTable.VatBlocked) { }
                /* ak */
                fieldelement(OpeningAccount; C5LedTable.OpeningAccount) { }
                /* al */
                fieldelement(OpeningDate; C5LedTable.OpeningDate) { }

                trigger OnBeforeInsertRecord();
                begin
                    C5LedTable.RecId := Counter;
                    Counter += 1;
                end;
            }
        }
    }

    var
        Counter: Integer;
}

