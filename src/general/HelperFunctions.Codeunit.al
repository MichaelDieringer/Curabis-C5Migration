

/// <summary>
/// Codeunit C5 Helper Functions (ID 51865).
/// </summary>
codeunit 51865 "C5 Helper Functions"
{
    var
        TypeHelper: Codeunit "Type Helper";
        SubstitutionTable: array[162, 2] of Text;
        IsSubstitutionTableInitialized: Boolean;
        PostCodeOrCityNotFoundErr: Label 'The combination of PostCode ''%1'' and City ''%2'' was not found.', Comment = '%1 = Post code and %2 = City';
        CountryNotFoundErr: Label 'The country ''%1'' was not found.', Comment = '%1 = country name';
        DepartmentDimensionCodeTxt: Label 'C5DEPARTMENT';
        DepartmentDimensionDescriptionTxt: Label 'C5 Department Dimension';
        CostCenterDimensionCodeTxt: Label 'C5COSTCENTRE';
        CostCenterDimensionDescriptionTxt: Label 'C5 Cost Centre';
        PurposeDimensionCodeTxt: Label 'C5PURPOSE';
        PurposeDimensionDescriptionTxt: Label 'C5 Purpose';
        LanguageNotFoundErr: Label 'The language ''%1'' was not found.', Comment = '%1 = language name';


    local procedure InitSubstitutionTable()
    begin
        // C5 encodes characters in asccii and in octal form f.x. \235 is asccii character 157 Ø
        // Initializing substitution table, which is Codepage 850 with 'C5 encoding -> char' mapping.
        // First index ([first, _]) represents one table item.
        // Second index ([_, second]) represents individual properties: [_, 1] is string to search, [_, 2] is UTF-8 char. 
        if not IsSubstitutionTableInitialized then begin
            SubstitutionTable[1, 1] := '\200';
            SubstitutionTable[1, 2] := 'Ç';

            SubstitutionTable[2, 1] := '\201';
            SubstitutionTable[2, 2] := 'ü';

            SubstitutionTable[3, 1] := '\202';
            SubstitutionTable[3, 2] := 'é';

            SubstitutionTable[4, 1] := '\203';
            SubstitutionTable[4, 2] := 'â';

            SubstitutionTable[5, 1] := '\204';
            SubstitutionTable[5, 2] := 'ä';

            SubstitutionTable[6, 1] := '\205';
            SubstitutionTable[6, 2] := 'à';

            SubstitutionTable[7, 1] := '\206';
            SubstitutionTable[7, 2] := 'å';

            SubstitutionTable[8, 1] := '\207';
            SubstitutionTable[8, 2] := 'ç';

            SubstitutionTable[9, 1] := '\210';
            SubstitutionTable[9, 2] := 'ê';

            SubstitutionTable[10, 1] := '\211';
            SubstitutionTable[10, 2] := 'ë';

            SubstitutionTable[11, 1] := '\212';
            SubstitutionTable[11, 2] := 'è';

            SubstitutionTable[12, 1] := '\213';
            SubstitutionTable[12, 2] := 'ï';

            SubstitutionTable[13, 1] := '\214';
            SubstitutionTable[13, 2] := 'î';

            SubstitutionTable[14, 1] := '\215';
            SubstitutionTable[14, 2] := 'ì';

            SubstitutionTable[15, 1] := '\216';
            SubstitutionTable[15, 2] := 'Ä';

            SubstitutionTable[16, 1] := '\217';
            SubstitutionTable[16, 2] := 'Å';

            SubstitutionTable[17, 1] := '\220';
            SubstitutionTable[17, 2] := 'É';

            SubstitutionTable[18, 1] := '\221';
            SubstitutionTable[18, 2] := 'æ';

            SubstitutionTable[19, 1] := '\222';
            SubstitutionTable[19, 2] := 'Æ';

            SubstitutionTable[20, 1] := '\223';
            SubstitutionTable[20, 2] := 'ô';

            SubstitutionTable[21, 1] := '\224';
            SubstitutionTable[21, 2] := 'ö';

            SubstitutionTable[22, 1] := '\225';
            SubstitutionTable[22, 2] := 'ò';

            SubstitutionTable[23, 1] := '\226';
            SubstitutionTable[23, 2] := 'û';

            SubstitutionTable[24, 1] := '\227';
            SubstitutionTable[24, 2] := 'ù';

            SubstitutionTable[25, 1] := '\230';
            SubstitutionTable[25, 2] := 'ÿ';

            SubstitutionTable[26, 1] := '\231';
            SubstitutionTable[26, 2] := 'Ö';

            SubstitutionTable[27, 1] := '\232';
            SubstitutionTable[27, 2] := 'Ü';

            SubstitutionTable[28, 1] := '\233';
            SubstitutionTable[28, 2] := 'ø';

            SubstitutionTable[29, 1] := '\234';
            SubstitutionTable[29, 2] := '£';

            SubstitutionTable[30, 1] := '\235';
            SubstitutionTable[30, 2] := 'Ø';

            SubstitutionTable[31, 1] := '\236';
            SubstitutionTable[31, 2] := '×';

            SubstitutionTable[32, 1] := '\237';
            SubstitutionTable[32, 2] := 'ƒ';

            SubstitutionTable[33, 1] := '\240';
            SubstitutionTable[33, 2] := 'á';

            SubstitutionTable[34, 1] := '\241';
            SubstitutionTable[34, 2] := 'í';

            SubstitutionTable[35, 1] := '\242';
            SubstitutionTable[35, 2] := 'ó';

            SubstitutionTable[36, 1] := '\243';
            SubstitutionTable[36, 2] := 'ú';

            SubstitutionTable[37, 1] := '\244';
            SubstitutionTable[37, 2] := 'ñ';

            SubstitutionTable[38, 1] := '\245';
            SubstitutionTable[38, 2] := 'Ñ';

            SubstitutionTable[39, 1] := '\246';
            SubstitutionTable[39, 2] := 'ª';

            SubstitutionTable[40, 1] := '\247';
            SubstitutionTable[40, 2] := 'º';

            SubstitutionTable[41, 1] := '\250';
            SubstitutionTable[41, 2] := '¿';

            SubstitutionTable[42, 1] := '\251';
            SubstitutionTable[42, 2] := '®';

            SubstitutionTable[43, 1] := '\252';
            SubstitutionTable[43, 2] := '¬';

            SubstitutionTable[44, 1] := '\253';
            SubstitutionTable[44, 2] := '½';

            SubstitutionTable[45, 1] := '\254';
            SubstitutionTable[45, 2] := '¼';

            SubstitutionTable[46, 1] := '\255';
            SubstitutionTable[46, 2] := '¡';

            SubstitutionTable[47, 1] := '\256';
            SubstitutionTable[47, 2] := '«';

            SubstitutionTable[48, 1] := '\257';
            SubstitutionTable[48, 2] := '»';

            SubstitutionTable[49, 1] := '\260';
            SubstitutionTable[49, 2] := '░';

            SubstitutionTable[50, 1] := '\261';
            SubstitutionTable[50, 2] := '▒';

            SubstitutionTable[51, 1] := '\262';
            SubstitutionTable[51, 2] := '▓';

            SubstitutionTable[52, 1] := '\263';
            SubstitutionTable[52, 2] := '│';

            SubstitutionTable[53, 1] := '\264';
            SubstitutionTable[53, 2] := '┤';

            SubstitutionTable[54, 1] := '\265';
            SubstitutionTable[54, 2] := 'Á';

            SubstitutionTable[55, 1] := '\266';
            SubstitutionTable[55, 2] := 'Â';

            SubstitutionTable[56, 1] := '\267';
            SubstitutionTable[56, 2] := 'À';

            SubstitutionTable[57, 1] := '\270';
            SubstitutionTable[57, 2] := '©';

            SubstitutionTable[58, 1] := '\271';
            SubstitutionTable[58, 2] := '╣';

            SubstitutionTable[59, 1] := '\272';
            SubstitutionTable[59, 2] := '║';

            SubstitutionTable[60, 1] := '\273';
            SubstitutionTable[60, 2] := '╗';

            SubstitutionTable[61, 1] := '\274';
            SubstitutionTable[61, 2] := '╝';

            SubstitutionTable[62, 1] := '\275';
            SubstitutionTable[62, 2] := '¢';

            SubstitutionTable[63, 1] := '\276';
            SubstitutionTable[63, 2] := '¥';

            SubstitutionTable[64, 1] := '\277';
            SubstitutionTable[64, 2] := '┐';

            SubstitutionTable[65, 1] := '\300';
            SubstitutionTable[65, 2] := '└';

            SubstitutionTable[66, 1] := '\301';
            SubstitutionTable[66, 2] := '┴';

            SubstitutionTable[67, 1] := '\302';
            SubstitutionTable[67, 2] := '┬';

            SubstitutionTable[68, 1] := '\303';
            SubstitutionTable[68, 2] := '├';

            SubstitutionTable[69, 1] := '\304';
            SubstitutionTable[69, 2] := '─';

            SubstitutionTable[70, 1] := '\305';
            SubstitutionTable[70, 2] := '┼';

            SubstitutionTable[71, 1] := '\306';
            SubstitutionTable[71, 2] := 'ã';

            SubstitutionTable[72, 1] := '\307';
            SubstitutionTable[72, 2] := 'Ã';

            SubstitutionTable[73, 1] := '\310';
            SubstitutionTable[73, 2] := '╚';

            SubstitutionTable[74, 1] := '\311';
            SubstitutionTable[74, 2] := '╔';

            SubstitutionTable[75, 1] := '\312';
            SubstitutionTable[75, 2] := '╩';

            SubstitutionTable[76, 1] := '\313';
            SubstitutionTable[76, 2] := '╦';

            SubstitutionTable[77, 1] := '\314';
            SubstitutionTable[77, 2] := '╠';

            SubstitutionTable[78, 1] := '\315';
            SubstitutionTable[78, 2] := '═';

            SubstitutionTable[79, 1] := '\316';
            SubstitutionTable[79, 2] := '╬';

            SubstitutionTable[80, 1] := '\317';
            SubstitutionTable[80, 2] := '¤';

            SubstitutionTable[81, 1] := '\320';
            SubstitutionTable[81, 2] := 'ð';

            SubstitutionTable[82, 1] := '\321';
            SubstitutionTable[82, 2] := 'Ð';

            SubstitutionTable[83, 1] := '\322';
            SubstitutionTable[83, 2] := 'Ê';

            SubstitutionTable[84, 1] := '\323';
            SubstitutionTable[84, 2] := 'Ë';

            SubstitutionTable[85, 1] := '\324';
            SubstitutionTable[85, 2] := 'È';

            SubstitutionTable[86, 1] := '\325';
            SubstitutionTable[86, 2] := 'ı';

            SubstitutionTable[87, 1] := '\326';
            SubstitutionTable[87, 2] := 'Í';

            SubstitutionTable[88, 1] := '\327';
            SubstitutionTable[88, 2] := 'Î';

            SubstitutionTable[89, 1] := '\330';
            SubstitutionTable[89, 2] := 'Ï';

            SubstitutionTable[90, 1] := '\331';
            SubstitutionTable[90, 2] := '┘';

            SubstitutionTable[91, 1] := '\332';
            SubstitutionTable[91, 2] := '┌';

            SubstitutionTable[92, 1] := '\333';
            SubstitutionTable[92, 2] := '█';

            SubstitutionTable[93, 1] := '\334';
            SubstitutionTable[93, 2] := '▄';

            SubstitutionTable[94, 1] := '\335';
            SubstitutionTable[94, 2] := '¦';

            SubstitutionTable[95, 1] := '\336';
            SubstitutionTable[95, 2] := 'Ì';

            SubstitutionTable[96, 1] := '\337';
            SubstitutionTable[96, 2] := '▀';

            SubstitutionTable[97, 1] := '\340';
            SubstitutionTable[97, 2] := 'Ó';

            SubstitutionTable[98, 1] := '\341';
            SubstitutionTable[98, 2] := 'ß';

            SubstitutionTable[99, 1] := '\342';
            SubstitutionTable[99, 2] := 'Ô';

            SubstitutionTable[100, 1] := '\343';
            SubstitutionTable[100, 2] := 'Ò';

            SubstitutionTable[101, 1] := '\344';
            SubstitutionTable[101, 2] := 'õ';

            SubstitutionTable[102, 1] := '\345';
            SubstitutionTable[102, 2] := 'Õ';

            SubstitutionTable[103, 1] := '\346';
            SubstitutionTable[103, 2] := 'µ';

            SubstitutionTable[104, 1] := '\347';
            SubstitutionTable[104, 2] := 'þ';

            SubstitutionTable[105, 1] := '\350';
            SubstitutionTable[105, 2] := 'Þ';

            SubstitutionTable[106, 1] := '\351';
            SubstitutionTable[106, 2] := 'Ú';

            SubstitutionTable[107, 1] := '\352';
            SubstitutionTable[107, 2] := 'Û';

            SubstitutionTable[108, 1] := '\353';
            SubstitutionTable[108, 2] := 'Ù';

            SubstitutionTable[109, 1] := '\354';
            SubstitutionTable[109, 2] := 'ý';

            SubstitutionTable[110, 1] := '\355';
            SubstitutionTable[110, 2] := 'Ý';

            SubstitutionTable[111, 1] := '\356';
            SubstitutionTable[111, 2] := '¯';

            SubstitutionTable[112, 1] := '\357';
            SubstitutionTable[112, 2] := '´';

            SubstitutionTable[113, 1] := '\360';
            SubstitutionTable[113, 2] := '­';

            SubstitutionTable[114, 1] := '\361';
            SubstitutionTable[114, 2] := '±';

            SubstitutionTable[115, 1] := '\362';
            SubstitutionTable[115, 2] := '‗';

            SubstitutionTable[116, 1] := '\363';
            SubstitutionTable[116, 2] := '¾';

            SubstitutionTable[117, 1] := '\364';
            SubstitutionTable[117, 2] := '¶';

            SubstitutionTable[118, 1] := '\365';
            SubstitutionTable[118, 2] := '§';

            SubstitutionTable[119, 1] := '\366';
            SubstitutionTable[119, 2] := '÷';

            SubstitutionTable[120, 1] := '\367';
            SubstitutionTable[120, 2] := '¸';

            SubstitutionTable[121, 1] := '\370';
            SubstitutionTable[121, 2] := '°';

            SubstitutionTable[122, 1] := '\371';
            SubstitutionTable[122, 2] := '¨';

            SubstitutionTable[123, 1] := '\372';
            SubstitutionTable[123, 2] := '·';

            SubstitutionTable[124, 1] := '\373';
            SubstitutionTable[124, 2] := '¹';

            SubstitutionTable[125, 1] := '\374';
            SubstitutionTable[125, 2] := '³';

            SubstitutionTable[126, 1] := '\375';
            SubstitutionTable[126, 2] := '²';

            SubstitutionTable[127, 1] := '\376';
            SubstitutionTable[127, 2] := '■';

            SubstitutionTable[128, 1] := '\377';
            SubstitutionTable[128, 2] := ' ';

            SubstitutionTable[129, 1] := '\\';
            SubstitutionTable[129, 2] := '\';

            // We need to replace \" so that we're able to have quotes inside strings.
            // We can't replace it to " since it's a delimeter in XML port for text fields,
            // so instead we replace it with '.
            SubstitutionTable[130, 1] := '\"';
            SubstitutionTable[130, 2] := '''';

            // Special Ascii characters for some reason C5 is exporting them
            // 000 Null character
            // 001 Start of Header
            // 002 Start of Text
            // 003 End of Text
            // 004 End of Trans.
            // 005 Enquiry
            // 006 Acknowledgement
            // 007 BELL
            // 008 Backspace
            // 009 Horizontal tab
            // 010 Line feed
            // 011 Vertical Tab
            // 012 Form feed
            // 013 Carriage return
            // 014 Shift Out
            // 015 Shift In
            // 016 Data Link Escape
            // 017 Device Control
            // 018 Device Control 2
            // 019 Device Control 3
            // 020 Device Control 4
            // 021 Native acknowledgement
            // 022 Synchronous idle
            // 023 End of trans. block
            // 024 Cancel
            // 025 End of Medium
            // 026 Substitute
            // 027 Escape
            // 028 File Seperator
            // 029 Group Seperator
            // 030 Record Separator
            // 031 Unit Separator
            // 127 Delete     

            SubstitutionTable[131, 1] := '\001';
            SubstitutionTable[131, 2] := '';

            SubstitutionTable[132, 1] := '\002';
            SubstitutionTable[132, 2] := '';

            SubstitutionTable[133, 1] := '\003';
            SubstitutionTable[133, 2] := '';

            SubstitutionTable[134, 1] := '\004';
            SubstitutionTable[134, 2] := '';

            SubstitutionTable[135, 1] := '\005';
            SubstitutionTable[135, 2] := '';

            SubstitutionTable[136, 1] := '\006';
            SubstitutionTable[136, 2] := '';

            SubstitutionTable[137, 1] := '\007';
            SubstitutionTable[137, 2] := '';

            SubstitutionTable[138, 1] := '\010';
            SubstitutionTable[138, 2] := '';

            SubstitutionTable[139, 1] := '\011';
            SubstitutionTable[139, 2] := '';

            SubstitutionTable[140, 1] := '\012';
            SubstitutionTable[140, 2] := '';

            SubstitutionTable[141, 1] := '\013';
            SubstitutionTable[141, 2] := '';

            SubstitutionTable[142, 1] := '\014';
            SubstitutionTable[142, 2] := '';

            SubstitutionTable[143, 1] := '\015';
            SubstitutionTable[143, 2] := '';

            SubstitutionTable[144, 1] := '\016';
            SubstitutionTable[144, 2] := '';

            SubstitutionTable[145, 1] := '\017';
            SubstitutionTable[145, 2] := '';

            SubstitutionTable[146, 1] := '\020';
            SubstitutionTable[146, 2] := '';

            SubstitutionTable[147, 1] := '\021';
            SubstitutionTable[147, 2] := '';

            SubstitutionTable[148, 1] := '\022';
            SubstitutionTable[148, 2] := '';

            SubstitutionTable[149, 1] := '\023';
            SubstitutionTable[149, 2] := '';

            SubstitutionTable[150, 1] := '\024';
            SubstitutionTable[150, 2] := '';

            SubstitutionTable[151, 1] := '\025';
            SubstitutionTable[151, 2] := '';

            SubstitutionTable[152, 1] := '\026';
            SubstitutionTable[152, 2] := '';

            SubstitutionTable[153, 1] := '\027';
            SubstitutionTable[153, 2] := '';

            SubstitutionTable[154, 1] := '\030';
            SubstitutionTable[154, 2] := '';

            SubstitutionTable[155, 1] := '\031';
            SubstitutionTable[155, 2] := '';

            SubstitutionTable[156, 1] := '\032';
            SubstitutionTable[156, 2] := '';

            SubstitutionTable[157, 1] := '\033';
            SubstitutionTable[157, 2] := '';

            SubstitutionTable[158, 1] := '\034';
            SubstitutionTable[158, 2] := '';

            SubstitutionTable[159, 1] := '\035';
            SubstitutionTable[159, 2] := '';

            SubstitutionTable[160, 1] := '\036';
            SubstitutionTable[160, 2] := '';

            SubstitutionTable[161, 1] := '\037';
            SubstitutionTable[161, 2] := '';

            SubstitutionTable[162, 1] := '\177';
            SubstitutionTable[162, 2] := '';
            IsSubstitutionTableInitialized := TRUE;
        end;
    end;

    /// <summary>
    /// TryConvertFromStringDate.
    /// </summary>
    /// <param name="DateString">Text[20].</param>
    /// <param name="Format">Text[20].</param>
    /// <param name="Date">VAR Date.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure TryConvertFromStringDate(DateString: Text[20]; Format: Text[20]; var Date: Date): Boolean
    var
        TempVariant: Variant;
    begin
        if DateString = '' then begin
            Date := 0D;
            exit(true);
            // false means the format is incorrect. Here we don't want to error out.
        end;

        TempVariant := Date;
        if not TypeHelper.Evaluate(TempVariant, DateString, Format, '') then
            exit(false);
        Date := TempVariant;
        exit(true);
    end;

    /// <summary>
    /// ReplaceLettersSubstitutions.
    /// </summary>
    /// <param name="String">Text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure ReplaceLettersSubstitutions(String: Text): Text
    var
        Position: Integer;
        SubstitutionIndex: Integer;
    begin
        InitSubstitutionTable();

        Position := FindNextSubstitution(String, SubstitutionIndex);
        while (Position > 0) do begin
            String := DelStr(String, Position, StrLen(SubstitutionTable[SubstitutionIndex, 1]));
            String := InsStr(String, SubstitutionTable[SubstitutionIndex, 2], Position);
            Position := FindNextSubstitution(String, SubstitutionIndex);
        end;

        exit(String);
    end;

    local procedure FindNextSubstitution(String: Text; var SubstitutionIndex: Integer): Integer
    var
        Position: Integer;
    begin
        for SubstitutionIndex := 1 to ArrayLen(SubstitutionTable, 1) do begin
            Position := StrPos(String, SubstitutionTable[SubstitutionIndex, 1]);
            if (Position > 0) then
                Exit(Position);
        end;

        exit(0);
    end;

    /// <summary>
    /// ProcessStreamForSubstitutions.
    /// </summary>
    /// <param name="TempBlob">VAR Codeunit "Temp Blob".</param>
    /// <param name="InStream">InStream.</param>
    /// <param name="ProcessedStream">VAR InStream.</param>
    procedure ProcessStreamForSubstitutions(var TempBlob: Codeunit "Temp Blob"; InStream: InStream; var ProcessedStream: InStream)
    var
        HelperFunctions: Codeunit "C5 Helper Functions";
        OutStream: OutStream;
        Line: Text;
    begin
        TempBlob.CreateOutStream(OutStream);
        while not InStream.EOS() do begin
            InStream.ReadText(Line);
            Line := HelperFunctions.ReplaceLettersSubstitutions(Line);

            OutStream.WriteText(Line);
            OutStream.WriteText();
        end;
        TempBlob.CreateInStream(ProcessedStream);
    end;

    /// <summary>
    /// GetDimensionValueName.
    /// </summary>
    /// <param name="TableNum">Integer.</param>
    /// <param name="DimensionValue">Code[10].</param>
    /// <returns>Return variable DimensionName of type Text[30].</returns>
    procedure GetDimensionValueName(TableNum: Integer; DimensionValue: Code[10]) DimensionName: Text[30]
    var
        C5Centre: Record "C5 Centre";
        C5Department: Record "C5 Department";
        C5Purpose: Record "C5 Purpose";
    begin
        case TableNum of
            Database::"C5 Department":
                begin
                    C5Department.SetRange(Department, DimensionValue);
                    if C5Department.FindFirst() then
                        DimensionName := C5Department.Name;
                end;
            Database::"C5 Centre":
                begin
                    C5Centre.SetRange(Centre, DimensionValue);
                    if C5Centre.FindFirst() then
                        DimensionName := C5Centre.Name;
                end;
            Database::"C5 Purpose":
                begin
                    C5Purpose.SetRange(Purpose, DimensionValue);
                    if C5Purpose.FindFirst() then
                        DimensionName := C5Purpose.Name;
                end;
        end;
    end;

    /// <summary>
    /// GetDepartmentDimensionCodeTxt.
    /// </summary>
    /// <returns>Return value of type Code[20].</returns>
    procedure GetDepartmentDimensionCodeTxt(): Code[20]
    begin
        exit(CopyStr(DepartmentDimensionCodeTxt, 1, 20));
    end;

    /// <summary>
    /// GetCostCenterDimensionCodeTxt.
    /// </summary>
    /// <returns>Return value of type Code[20].</returns>
    procedure GetCostCenterDimensionCodeTxt(): Code[20]
    begin
        exit(CopyStr(CostCenterDimensionCodeTxt, 1, 20));
    end;

    /// <summary>
    /// GetPurposeDimensionCodeTxt.
    /// </summary>
    /// <returns>Return value of type Code[20].</returns>
    procedure GetPurposeDimensionCodeTxt(): Code[20]
    begin
        exit(CopyStr(PurposeDimensionCodeTxt, 1, 20));
    end;

    /// <summary>
    /// GetDepartmentDimensionDescTxt.
    /// </summary>
    /// <returns>Return value of type Code[50].</returns>
    procedure GetDepartmentDimensionDescTxt(): Code[50]
    begin
        exit(CopyStr(DepartmentDimensionDescriptionTxt, 1, 50));
    end;

    /// <summary>
    /// GetCostCenterDimensionDescTxt.
    /// </summary>
    /// <returns>Return value of type Code[50].</returns>
    procedure GetCostCenterDimensionDescTxt(): Code[50]
    begin
        exit(CopyStr(CostCenterDimensionDescriptionTxt, 1, 50));
    end;

    /// <summary>
    /// GetPurposeDimensionDescTxt.
    /// </summary>
    /// <returns>Return value of type Code[50].</returns>
    procedure GetPurposeDimensionDescTxt(): Code[50]
    begin
        exit(CopyStr(PurposeDimensionDescriptionTxt, 1, 50));
    end;

    /// <summary>
    /// FixLCYCode.
    /// </summary>
    /// <param name="Currency">Code[10].</param>
    /// <returns>Return value of type Code[10].</returns>
    procedure FixLCYCode(Currency: Code[10]): Code[10]
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        GeneralLedgerSetup.Get();

        if Currency = GeneralLedgerSetup."LCY Code" then
            exit('');

        exit(Currency);
    end;

    /// <summary>
    /// ExtractPostCodeAndCity.
    /// </summary>
    /// <param name="C5ZipCity">Text[50].</param>
    /// <param name="C5Country">Text[30].</param>
    /// <param name="D365PostCode">VAR Code[20].</param>
    /// <param name="D365City">VAR Text[30].</param>
    /// <param name="D365CountryRegionCode">VAR Code[10].</param>
    procedure ExtractPostCodeAndCity(C5ZipCity: Text[50]; C5Country: Text[30]; var D365PostCode: Code[20]; var D365City: Text[30]; var D365CountryRegionCode: Code[10])
    var
        CompanyInformation: Record "Company Information";
        CustomerDataMigrationFacade: Codeunit "Customer Data Migration Facade";
        ZipCityTemp: Text[50];
        NewZipCityTemp: Text;
        FirstBlankIdx: Integer;
        i: Integer;
    begin
        D365PostCode := '';
        D365City := '';
        D365CountryRegionCode := GetCountry(C5Country);

        ZipCityTemp := CopyStr(TrimSpaces(C5ZipCity), 1, 50);

        if (StrPos(ZipCityTemp, 'SE-') = 1) and (StrLen(ZipCityTemp) > 4) then begin // svedish postCodes do have post code format SE-XX XXX
            for i := 4 to StrLen(ZipCityTemp) do begin
                NewZipCityTemp := NewZipCityTemp + copystr(ZipCityTemp, i, 1);
                if CopyStr(NewZipCityTemp, strlen(NewZipCityTemp), 1) IN ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
                    NewZipCityTemp := DelChr(NewZipCityTemp, '=', ' ');
            end;
            ZipCityTemp := 'SE-' + NewZipCityTemp;
        end;

        FirstBlankIdx := StrPos(ZipCityTemp, ' ');

        if ZipCityTemp = '' then
            exit;
        if FirstBlankIdx > 1 then begin
            D365PostCode := CopyStr(CopyStr(ZipCityTemp, 1, FirstBlankIdx - 1), 1, 20);
            D365City := FixCityCase(CopyStr(ZipCityTemp, FirstBlankIdx + 1));
            if not CustomerDataMigrationFacade.DoesPostCodeExist(D365PostCode, D365City) then begin
                CompanyInformation.Get();
                if (D365CountryRegionCode <> '') and (D365CountryRegionCode <> CompanyInformation."Country/Region Code") then begin
                    if Strpos(D365PostCode, '-') <> 3 then // already formatted like DK-2800, do not make it like DK-DK-2800
                        D365PostCode := CopyStr(StrSubstNo('%1-%2', D365CountryRegionCode, D365PostCode), 1, 20);
                    if not CustomerDataMigrationFacade.DoesPostCodeExist(D365PostCode, D365City) then
                        CustomerDataMigrationFacade.CreatePostCodeIfNeeded(D365PostCode, D365City, '', D365CountryRegionCode);
                    exit;
                end;
                CustomerDataMigrationFacade.CreatePostCodeIfNeeded(D365PostCode, D365City, '', CompanyInformation."Country/Region Code");
            end;
        end else
            Error(PostCodeOrCityNotFoundErr, ZipCityTemp, '');
    end;

    local procedure GetCountry(C5CountryTxt: Text[30]): Code[10]
    var
        C5Country: Record "C5 Country";
        CustomerDataMigrationFacade: Codeunit "Customer Data Migration Facade";
        ResultCode: Code[10];
    begin
        if C5CountryTxt = '' then
            exit(CopyStr(C5CountryTxt, 1, 10));
        if CustomerDataMigrationFacade.SearchCountry('', C5CountryTxt, '', '', ResultCode) then
            exit(ResultCode);
        C5Country.SetRange(Country, C5CountryTxt);
        if C5Country.FindFirst() then begin
            if C5Country.VatCountryCode <> '' then begin
                if CustomerDataMigrationFacade.SearchCountry(C5Country.VatCountryCode, '', '', '', ResultCode) then
                    exit(ResultCode);
                if CustomerDataMigrationFacade.SearchCountry('', '', C5Country.VatCountryCode, '', ResultCode) then
                    exit(ResultCode);
            end;
            if C5Country.IntrastatCode <> '' then
                if CustomerDataMigrationFacade.SearchCountry('', '', '', C5Country.IntrastatCode, ResultCode) then
                    exit(ResultCode);
        end;
        if C5Country.VatCountryCode <> '' then
            CreateCounty(C5Country.VatCountryCode, C5Country.Country)
        else
            Error(CountryNotFoundErr, C5CountryTxt);
    end;

    local procedure FixCityCase(City: Text): Text[30]
    var
        Pos: Integer;
        Left: Text;
        Right: Text;
    begin
        City := TrimSpaces(City);
        if City in ['NV', 'SV', 'NØ', 'SØ'] then
            exit(CopyStr(City, 1, 30));
        Pos := StrPos(City, ' ');
        if Pos > 1 then begin
            Left := CopyStr(City, 1, Pos - 1);
            Right := CopyStr(City, Pos + 1);
            exit(CopyStr(FixCityCase(Left) + ' ' + FixCityCase(Right), 1, 30))
        end else
            exit(CopyStr(UpperCase(City[1]) + LowerCase(CopyStr(City, 2)), 1, 30));
    end;

    local procedure CreateCounty(CountryCode: Code[10]; Country: Text[50])
    var
        CustomerDataMigrationFacade: Codeunit "Customer Data Migration Facade";
        AddressFormatToSet: Option "Post Code+City","City+Post Code","City+County+Post Code","Blank Line+Post Code+City";
        ContactAddressFormatToSet: Option First,"After Company Name",Last;
    begin
        CustomerDataMigrationFacade.CreateCountryIfNeeded(CountryCode, Country, AddressFormatToSet::"Post Code+City", ContactAddressFormatToSet::"After Company Name");
    end;

    /// <summary>
    /// GetLanguageCodeForC5Language.
    /// </summary>
    /// <param name="C5Language">Option.</param>
    /// <returns>Return value of type Code[10].</returns>
    procedure GetLanguageCodeForC5Language(C5Language: Option): Code[10]
    var
        C5VendTable: Record "C5 VendTable";
        Language: Record Language;
        CustomerDataMigrationFacade: Codeunit "Customer Data Migration Facade";
        AbbreviatedLanguage: Code[3];
        ResultCode: Code[10];
    begin
        // as C5 language code is a global enum and are the same set of options irrespective of the entity in which they reside.
        C5VendTable.Language_ := C5Language;
        case C5VendTable.Language_ of
            C5VendTable.Language_::Default:
                exit('');

            C5VendTable.Language_::Danish:
                AbbreviatedLanguage := 'DAN';
            C5VendTable.Language_::Dutch:
                AbbreviatedLanguage := 'NLD';
            C5VendTable.Language_::English:
                AbbreviatedLanguage := 'ENU';
            C5VendTable.Language_::French:
                AbbreviatedLanguage := 'FRA';
            C5VendTable.Language_::German:
                AbbreviatedLanguage := 'DEU';
            C5VendTable.Language_::Icelandic:
                AbbreviatedLanguage := 'ISL';
            C5VendTable.Language_::Italian:
                AbbreviatedLanguage := 'ITA';
        end;


        if not Language.get(AbbreviatedLanguage) then begin
            Language.Init();
            Language.Code := AbbreviatedLanguage;
            Language.Name := GetLanguageName(AbbreviatedLanguage);
            Language."Windows Language ID" := GetWindowsLanguageID(AbbreviatedLanguage);
            Language.Insert();
        end;


        if not CustomerDataMigrationFacade.SearchLanguage(AbbreviatedLanguage, ResultCode) then
            Error(LanguageNotFoundErr, AbbreviatedLanguage);
        exit(ResultCode);
    end;

    local procedure GetWindowsLanguageID(AbbreviatedLanguage: Code[10]): Integer
    begin
        case AbbreviatedLanguage of
            'DAN':
                exit(1030);
            'NLD':
                exit(1043);
            'ENU':
                exit(1033);
            'FRA':
                exit(1036);
            'DEU':
                exit(1031);
            'ISL':
                exit(1039);
            'ITA':
                exit(1040);
        end;
    end;

    local procedure GetLanguageName(AbbreviatedLanguage: Code[10]): Text
    var
        DanishLabel: Label 'Danish';
        DutchLabel: Label 'Dutch';
        EnglishLabel: label 'English';
        FrenchLabel: Label 'French';
        GermanLabel: Label 'German';
        IslandicLabel: Label 'Islandic';
        ItalianLabel: Label 'Italian';
    begin
        case AbbreviatedLanguage of
            'DAN':
                exit(DanishLabel);
            'NLD':
                exit(DutchLabel);
            'ENU':
                exit(EnglishLabel);
            'FRA':
                exit(FrenchLabel);
            'DEU':
                exit(GermanLabel);
            'ISL':
                exit(IslandicLabel);
            'ITA':
                exit(ItalianLabel);
        end;
    end;
    /// <summary>
    /// TrimSpaces.
    /// </summary>
    /// <param name="Input">Text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure TrimSpaces(Input: Text): Text
    begin
        exit(DelChr(Input, '<>', ' '));
    end;

    /// <summary>
    /// CreateGLAccount.
    /// </summary>
    /// <param name="AccountCode">Code[10].</param>
    procedure CreateGLAccount(AccountCode: Code[10])
    var
        GLAccDataMigrationFacade: Codeunit "GL Acc. Data Migration Facade";
        C5LedTableMigrator: Codeunit "C5 LedTable Migrator";
        GLAccountNoWithLeadingZeros: Text;
        AccountType: Option Posting,Heading,Total,"Begin-Total","End-Total";
    begin
        GLAccountNoWithLeadingZeros := C5LedTableMigrator.FillWithLeadingZeros(AccountCode);

        if not GLAccDataMigrationFacade.CreateGLAccountIfNeeded(CopyStr(GLAccountNoWithLeadingZeros, 1, 20), AccountCode, AccountType::Posting) then
            exit;

        GLAccDataMigrationFacade.SetDirectPosting(true);
        GLAccDataMigrationFacade.ModifyGLAccount(true);
    end;

    /// <summary>
    /// MigrateExchangeRatesForCurrency.
    /// </summary>
    /// <param name="Currency">Code[10].</param>
    procedure MigrateExchangeRatesForCurrency(Currency: Code[10])
    var
        C5ExchRates: Record "C5 ExchRate";
        ExchangeRatesMigrationFacade: Codeunit "Ex. Rate Data Migration Facade";
    begin
        C5ExchRates.SetRange(Currency, Currency);
        if C5ExchRates.FindSet() then
            repeat
                ExchangeRatesMigrationFacade.CreateSimpleExchangeRateIfNeeded(
                    Currency,
                    C5ExchRates.FromDate,
                    C5ExchRates.ExchRate,
                    100); // we hard-code ExchRateAmount to 100 since it's always 100 in C5
            until C5ExchRates.Next() = 0;
    end;

    /// <summary>
    /// GetFileContentAsStream.
    /// </summary>
    /// <param name="Filename">Text.</param>
    /// <param name="NameValueBuffer">VAR Record "Name/Value Buffer".</param>
    /// <param name="FileContentStream">VAR InStream.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure GetFileContentAsStream(Filename: Text; var NameValueBuffer: Record "Name/Value Buffer"; var FileContentStream: InStream): Boolean
    begin
        NameValueBuffer.SetRange(Name, Filename);
        if not NameValueBuffer.FindFirst() then
            exit(false);
        NameValueBuffer.CalcFields("Value BLOB");
        NameValueBuffer."Value BLOB".CreateInStream(FileContentStream);
        exit(true);
    end;

}