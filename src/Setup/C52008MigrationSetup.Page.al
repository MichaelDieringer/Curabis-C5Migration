namespace CurabisC5.CurabisCMigration;

page 51801 "C5 2008 Migration Setup"
{
    ApplicationArea = All;
    Caption = 'C5 2008 Migration Setup';
    PageType = Card;
    SourceTable = "C5 2008 Migration Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Detailed G/L entries (start)"; Rec."Detailed G/L entries (start)")
                {
                    ToolTip = 'Specifies the value of the Detailed G/L entries (start) field.';
                }
                field("Accounting period (start)"; Rec."Accounting period (start)")
                {
                    ToolTip = 'Specifies the value of the Accounting period (start) field.';
                }
                field("Create Accounting periods"; Rec."Create Accounting periods")
                {
                    ToolTip = 'Specifies the value of the Create Accounting periods field.';
                }

            }
            group(Data)
            {
                Caption = 'Data';
                field("Conversion of Items"; Rec."Conversion of Items")
                {
                    ToolTip = 'Specifies the value of the Conversion of items field.';
                }
                field("Conversion of Vendors"; Rec."Conversion of Vendors")
                {
                    ToolTip = 'Specifies the value of the Conversion of Vendors field.';
                }
                field("Conversion of Customers"; Rec."Conversion of Customers")
                {
                    ToolTip = 'Specifies the value of the Conversion of Customers field.';
                }

            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(CreateAccountingPeriods)
            {
                ApplicationArea = All;
                Caption = 'Create Accounting periods';
                ToolTip = 'Create accounting periods for the company.';
                Image = AccountingPeriods;
                trigger OnAction()
                var
                    C52008MigrationHelper: Codeunit "C5 2008 Migration helper";
                begin
                    C52008MigrationHelper.CreateAccountingPeriods(Rec);
                end;
            }
            action(CreateVATPostingGroups)
            {
                ApplicationArea = All;
                Visible = CanCreateVATPostingsetup;
                Caption = 'Create VAT Posting Groups';
                ToolTip = 'Create VAT Posting Groups for the company.';
                Image = VATPostingSetup;
                trigger OnAction()
                var
                    C52008MigrationHelper: Codeunit "C5 2008 Migration helper";
                begin
                    C52008MigrationHelper.CreateVATPostingGroups(true, true, true);
                end;
            }
        }

    }
    var
        CanCreateVATPostingsetup: Boolean;

    trigger OnOpenPage()
    var
        C5migrationSetup: Record "C5 2008 Migration Setup";
        C52008MigrationHelper: Codeunit "C5 2008 Migration helper";
    begin
        if not C5migrationSetup.Get() then begin
            C5migrationSetup.Init();
            C5migrationSetup.Insert();
        end;

        CanCreateVATPostingsetup := C52008MigrationHelper.CanCreateVATPostingsetup();
    end;
}
