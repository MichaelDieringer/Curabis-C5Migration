namespace CurabisC5.CurabisCMigration;
using Microsoft.Utilities;
using System.IO;

/// <summary>
/// Codeunit C5 Unzip (ID 51869).
/// </summary>
codeunit 51869 "C5 2008 Unzip"
{
    TableNo = "Name/Value Buffer";

    var
        SomethingWentWrongErr: Label 'Zip File Blob is empty in C5SchemaParameters.';
        ZipExtractionErrorTxt: Label 'There was an error on extracting the zip file.';

    trigger OnRun();
    var
        C5SchemaParameters: Record "C5 2008 Schema Parameters";
        ZipFileInStream: InStream;
    begin
        C5SchemaParameters.GetSingleInstance();

        if not C5SchemaParameters."Zip File Blob".HasValue() then begin
            OnZipFileBlobMissing();
            Error(SomethingWentWrongErr);
        end;

        C5SchemaParameters.CalcFields("Zip File Blob");
        C5SchemaParameters."Zip File Blob".CreateInStream(ZipFileInStream);
        if not CreateNameValueBuffer(ZipFileInStream, Rec) then begin
            OnUnzipFileError();
            Error(ZipExtractionErrorTxt);
        end;
    end;

    /*Create NameValueBuffer where Name is a FileName and Value is the content of it saved as Stream */
    local procedure CreateNameValueBuffer(var ZipFileInStream: InStream; var NameValueBufferOut: Record "Name/Value Buffer"): Boolean
    var
        StreamManagement: Codeunit "Stream Management";
    begin
        if not StreamManagement.CreateNameValueBufferFromZipFileStream(ZipFileInStream, NameValueBufferOut) then
            exit(false);
        exit(true);
    end;

    /// <summary>
    /// OnZipFileBlobMissing.
    /// </summary>
    [IntegrationEvent(false, false)]
    procedure OnZipFileBlobMissing()
    begin

    end;

    /// <summary>
    /// OnUnzipFileError.
    /// </summary>
    [IntegrationEvent(false, false)]
    procedure OnUnzipFileError()
    begin
    end;
}
