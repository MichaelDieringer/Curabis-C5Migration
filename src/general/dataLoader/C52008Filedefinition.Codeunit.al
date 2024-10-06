namespace CurabisC5.CurabisCMigration;
using System.Reflection;

codeunit 51873 "C5 2008 File definition"
{
    procedure GetFileNameForRecord(RecordVariant: Variant; var FileNameOut: Text)
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
        DataTypeManagement: Codeunit "Data Type Management";
        RecRef: RecordRef;
    begin
        C5SchemaParameters.GetSingleInstance();
        DataTypeManagement.GetRecordRef(RecordVariant, RecRef);
        RecRef.DeleteAll();
        case RecRef.Number() of
            Database::"C5 2008 Centre":
                FileNameOut := 'exp00182.kom';
            Database::"C5 2008 CN8Code":
                FileNameOut := 'exp00207.kom';
            Database::"C5 2008 Country":
                FileNameOut := 'exp00007.kom';
            Database::"C5 2008 CustDiscGroup":
                FileNameOut := 'exp00040.kom';
            Database::"C5 2008 CustTable":
                FileNameOut := 'exp00033.kom';
            Database::"C5 2008 CustGroup":
                FileNameOut := 'exp00034.kom';
            Database::"C5 2008 CustTrans":
                FileNameOut := 'exp00037.kom';
            Database::"C5 2008 Delivery":
                FileNameOut := 'exp00019.kom';
            Database::"C5 2008 Department":
                FileNameOut := 'exp00017.kom';
            Database::"C5 2008 Employee":
                FileNameOut := 'exp00011.kom';
            Database::"C5 2008 InvenCustDisc":
                FileNameOut := 'exp00061.kom';
            Database::"C5 2008 InvenDiscGroup":
                FileNameOut := 'exp00060.kom';
            Database::"C5 2008 InvenItemGroup":
                FileNameOut := 'exp00050.kom';
            Database::"C5 2008 InvenTrans":
                FileNameOut := 'exp00055.kom';
            Database::"C5 2008 InvenLocation":
                FileNameOut := 'exp00018.kom';
            Database::"C5 2008 InvenPrice":
                FileNameOut := 'exp00063.kom';
            Database::"C5 2008 InvenPriceGroup":
                FileNameOut := 'exp00064.kom';
            Database::"C5 2008 InvenTable":
                FileNameOut := 'exp00049.kom';
            Database::"C5 2008 ItemTrackGroup":
                FileNameOut := 'exp00181.kom';
            Database::"C5 2008 LedTable":
                FileNameOut := 'exp00025.kom';
            Database::"C5 2008 LedTrans":
                FileNameOut := 'exp00030.kom';
            Database::"C5 2008 Payment":
                FileNameOut := 'exp00021.kom';
            Database::"C5 2008 ProcCode":
                FileNameOut := 'exp00094.kom';
            Database::"C5 2008 Purpose":
                FileNameOut := 'exp00183.kom';
            Database::"C5 2008 UnitCode":
                FileNameOut := 'exp00020.kom';
            Database::"C5 2008 VatGroup":
                FileNameOut := 'exp00201.kom';
            Database::"C5 2008 VendDiscGroup":
                FileNameOut := 'exp00048.kom';
            Database::"C5 2008 VendTable":
                FileNameOut := 'exp00041.kom';
            Database::"C5 2008 VendGroup":
                FileNameOut := 'exp00042.kom';
            Database::"C5 2008 VendTrans":
                FileNameOut := 'exp00045.kom';
            Database::"C5 2008 ExchRate":
                FileNameOut := 'exp00016.kom';
            Database::"C5 2008 InvenBOM":
                FileNameOut := 'exp00059.kom';
            Database::"C5 2008 CustContact":
                FileNameOut := 'exp00177.kom';
            Database::"C5 2008 VendContact":
                FileNameOut := 'exp00178.kom';
        end;
    end;
}
