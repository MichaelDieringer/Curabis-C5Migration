namespace CurabisCMigration.CurabisCMigration;

using CurabisC5.CurabisCMigration;

page 51806 "C5 2008 EmployeeList"
{
    ApplicationArea = All;
    Caption = 'C5 2008 EmployeeList';
    PageType = List;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "C5 2008 Employee";
    SourceTable = "C5 2008 Employee";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Employee; Rec.Employee)
                {
                    ToolTip = 'Specifies the value of the Employee field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.';
                }
            }
        }
    }
}
