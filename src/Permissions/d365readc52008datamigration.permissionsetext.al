namespace CurabisC5.CurabisCMigration;
using System.Security.AccessControl;

permissionsetextension 51806 "D365 READ - C5 2008 Data Migration" extends "D365 READ"
{
    Permissions = tabledata "C5 2008 Centre" = R,
                  tabledata "C5 2008 CN8Code" = R,
                  tabledata "C5 2008 Country" = R,
                  tabledata "C5 CustContact" = R,
                  tabledata "C5 CustDiscGroup" = R,
                  tabledata "C5 2008 CustGroup" = R,
                  tabledata "C5 2008 CustTable" = R,
                  tabledata "C5 2008 Migration Setup" = RIMD,
                  tabledata "C5 2008 CustTrans" = R,
                  tabledata "C5 2008 Data Loader Status" = R,
                  tabledata "C5 2008 Delivery" = R,
                  tabledata "C5 2008 Department" = R,
                  tabledata "C5 2008 Employee" = R,
                  tabledata "C5 2008 ExchRate" = R,
                  tabledata "C5 2008 InvenBOM" = R,
                  tabledata "C5 2008 InvenCustDisc" = R,
                  tabledata "C5 2008 InvenDiscGroup" = R,
                  tabledata "C5 2008 InvenItemGroup" = R,
                  tabledata "C5 2008 InvenLocation" = R,
                  tabledata "C5 2008 InvenPrice" = R,
                  tabledata "C5 2008 InvenPriceGroup" = R,
                  tabledata "C5 2008 InvenTable" = R,
                  tabledata "C5 2008 InvenTrans" = R,
                  tabledata "C5 2008 ItemTrackGroup" = R,
                  tabledata "C5 2008 LedTable" = R,
                  tabledata "C5 2008 LedTrans" = R,
                  tabledata "C5 2008 Payment" = R,
                  tabledata "C5 ProcCode" = R,
                  tabledata "C5 2008 Purpose" = R,
                  tabledata "C5 2008 Schema Parameters" = R,
                  tabledata "C5 2008 UnitCode" = R,
                  tabledata "C5 2008 VatGroup" = R,
                  tabledata "C5 2008 VendContact" = R,
                  tabledata "C5 VendDiscGroup" = R,
                  tabledata "C5 VendGroup" = R,
                  tabledata "C5 VendTable" = R,
                  tabledata "C5 VendTrans" = R;
}
