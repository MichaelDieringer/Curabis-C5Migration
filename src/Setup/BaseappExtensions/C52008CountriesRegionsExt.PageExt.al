namespace CurabisC5.CurabisCMigration;
using Microsoft.Foundation.Address;

pageextension 51801 "C5 2008 CountriesRegionsExt" extends "Countries/Regions"
{
    layout
    {
        addlast(Control1)
        {
            field("VAT Calculation Type"; Rec."VAT Calculation Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Calculation Type field.';
            }
        }
    }
}
