namespace CurabisC5.CurabisCMigration;
using System.Integration;

/// <summary>
/// PageExtension Data Migration Overview Ext. (ID 1900) extends Record Data Migration Overview.
/// </summary>
pageextension 51900 "Data Migration Overview Ext." extends "Data Migration Overview"
{
    layout
    {
        addbefore(Control2)
        {
            group(ProgressGroup)
            {
                Caption = 'Migrating Data from Microsoft Dynamics C5 2008';
                Visible = ShouldShowProgress;
                field(Progress; ProgressText)
                {
                    ApplicationArea = All;
                    Style = StrongAccent;
                    ShowCaption = false;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        C5DataLoaderStatus: Record "C5 Data Loader Status";
    begin
        ProgressText := StrSubstNo(ProgressLbl, C5DataLoaderStatus.GetProgressPercentage());
    end;

    trigger OnOpenPage()
    var
        DataMigrationStatus: Record "Data Migration Status";
        C5MigrDashboardMgt: Codeunit "C5 Migr. Dashboard Mgt";
    begin
        DataMigrationStatus.SetRange("Migration Type", C5MigrDashboardMgt.GetC5MigrationTypeTxt());
        DataMigrationStatus.SetRange(Status, DataMigrationStatus.Status::Pending);
        ShouldShowProgress := not DataMigrationStatus.IsEmpty();
    end;

    var
        ShouldShowProgress: Boolean;
        ProgressText: Text;
        ProgressLbl: Label 'Getting things ready. %1% complete. Refresh to update the progress.', Comment = '%1=Progress Percent';
}