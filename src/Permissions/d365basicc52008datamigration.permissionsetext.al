namespace CurabisC5.CurabisCMigration;
using System.Security.AccessControl;
/// <summary>
/// Unknown D365 BASIC - C5 2008 Data Migration (ID 17036) extends Record D365 BASIC.
/// </summary>
permissionsetextension 51800 "D365 BASIC - C5 2008 Data Migration" extends "D365 BASIC"
{
    Permissions = tabledata "C5 2008 Centre" = RIMD,
                  tabledata "C5 2008 CN8Code" = RIMD,
                  tabledata "C5 2008 Migration Setup" = RIMD,
                  tabledata "C5 2008 Country" = RIMD,
                  tabledata "C5 CustContact" = RIMD,
                  tabledata "C5 CustDiscGroup" = RIMD,
                  tabledata "C5 2008 CustGroup" = RIMD,
                  tabledata "C5 2008 CustTable" = RIMD,
                  tabledata "C5 2008 CustTrans" = RIMD,
                  tabledata "C5 2008 Data Loader Status" = RIMD,
                  tabledata "C5 2008 Delivery" = RIMD,
                  tabledata "C5 2008 Department" = RIMD,
                  tabledata "C5 2008 Employee" = RIMD,
                  tabledata "C5 2008 ExchRate" = RIMD,
                  tabledata "C5 2008 InvenBOM" = RIMD,
                  tabledata "C5 2008 InvenCustDisc" = RIMD,
                  tabledata "C5 2008 InvenDiscGroup" = RIMD,
                  tabledata "C5 2008 InvenItemGroup" = RIMD,
                  tabledata "C5 2008 InvenLocation" = RIMD,
                  tabledata "C5 2008 InvenPrice" = RIMD,
                  tabledata "C5 2008 InvenPriceGroup" = RIMD,
                  tabledata "C5 2008 InvenTable" = RIMD,
                  tabledata "C5 2008 InvenTrans" = RIMD,
                  tabledata "C5 2008 ItemTrackGroup" = RIMD,
                  tabledata "C5 2008 LedTable" = RIMD,
                  tabledata "C5 2008 LedTrans" = RIMD,
                  tabledata "C5 2008 Payment" = RIMD,
                  tabledata "C5 ProcCode" = RIMD,
                  tabledata "C5 2008 Purpose" = RIMD,
                  tabledata "C5 2008 Schema Parameters" = RIMD,
                  tabledata "C5 2008 UnitCode" = RIMD,
                  tabledata "C5 2008 VatGroup" = RIMD,
                  tabledata "C5 2008 VendContact" = RIMD,
                  tabledata "C5 VendDiscGroup" = RIMD,
                  tabledata "C5 VendGroup" = RIMD,
                  tabledata "C5 VendTable" = RIMD,
                  tabledata "C5 VendTrans" = RIMD;
}
