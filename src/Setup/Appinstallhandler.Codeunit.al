namespace CurabisC5.CurabisCMigration;

codeunit 51801 "App install handler"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany();
    var
        C5migrationSetup: Record "C5 2008 Migration Setup";
    begin
        if not C5migrationSetup.Get() then begin
            C5migrationSetup.Init();
            C5migrationSetup.Insert();
        end;
    end;

}
