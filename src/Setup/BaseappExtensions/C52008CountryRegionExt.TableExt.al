namespace CurabisC5.CurabisCMigration;

using Microsoft.Foundation.Address;

tableextension 51800 "C5 2008 CountryRegionExt" extends "Country/Region"
{
    fields
    {
        field(51800; "VAT Calculation Type"; Enum "C5 2008 VAT Calulation type")
        {
            Caption = 'VAT Calculation Type';
            DataClassification = ToBeClassified;
        }
    }
}
