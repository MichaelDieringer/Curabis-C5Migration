namespace CurabisC5.CurabisCMigration;

/// <summary>
/// Page C5 Employee (ID 51874).
/// </summary>
page 51874 "C5 2008 Employee"
{
    PageType = Card;
    SourceTable = "C5 2008 Employee";
    DeleteAllowed = false;
    InsertAllowed = false;
    Caption = 'C5 Employee';
    ApplicationArea = All;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {


                field(Employee; Rec.Employee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee field.';
                }


                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }


                field(Address1; Rec.Address1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }


                field(Address2; Rec.Address2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }


                field(ZipCity; Rec.ZipCity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Zip code/City field.';
                }


                field(User; Rec.User)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User field.';
                }


                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone field.';
                }

                field(LocalNumber; Rec.LocalNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Extension field.';
                }

                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }

                field(ImageFile; Rec.ImageFile)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Image field.';
                }

                field(EmployeeType; Rec.EmployeeType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee type field.';
                }

                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }

                field(Centre; Rec.Centre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost centre field.';
                }

                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }

                field(KrakNumber; Rec.KrakNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Krak no. field.';
                }

                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country/region field.';
                }

                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency code field.';
                }

                field(Language_; Rec.Language_)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Language field.';
                }

                field(CellPhone; Rec.CellPhone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cell phone field.';
                }


            }
        }
    }
}

