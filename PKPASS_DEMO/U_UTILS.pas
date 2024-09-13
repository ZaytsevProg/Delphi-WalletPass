unit U_UTILS;

interface

uses System.SysUtils, System.Variants, System.Classes, FileCtrl, System.NetEncoding;

function Base64UrlEncode(const ADecodedBytes: TBytes): String;
function Base64UrlDecode(const AEncodedString: String): TBytes;
function SelectDir(Caption :String):String;
function SelectFile(Title, Filter :String):String;


function InFileTo64(InFile :String):TBytes;
procedure SaveCert(Cert64, CertName :String);


implementation

uses Main;

function Base64UrlEncode(const ADecodedBytes: TBytes): String;
var
  S: String;
begin
  S := TNetEncoding.Base64.EncodeBytesToString(ADecodedBytes);
  S := S.Replace(#13#10, '', [rfReplaceAll])
    .Replace(#13, '', [rfReplaceAll])
    .Replace(#10, '', [rfReplaceAll])
    .TrimRight(['='])
    .Replace('+', '-', [rfReplaceAll])
    .Replace('/', '_', [rfReplaceAll]);
  Result := S;
end;


function Base64UrlDecode(const AEncodedString: String): TBytes;
var
  S: String;
begin
  S := AEncodedString;
  S := S + StringOfChar('=', (4 - Length(AEncodedString) mod 4) mod 4);
  S := S.Replace('-', '+', [rfReplaceAll])
    .Replace('_', '/', [rfReplaceAll]);
  Result := TNetEncoding.Base64.DecodeStringToBytes(S);
end;


function SelectDir(Caption :String):String;
var
  Dir :String;
begin
SelectDirectory(Caption, '', Dir, [sdNewUI, sdShowEdit]);
if Length(Dir) = 0 then Exit;
Result:=Dir +'\';
end;

function SelectFile(Title, Filter :String):String;
begin
FMain.Dialog.FileName:='';//ParamStr(0);
FMain.Dialog.Title:=Title;
FMain.Dialog.Filter := Filter;
FMain.Dialog.InitialDir:=ExtractFilePath(ParamStr(0));
if FMain.Dialog.Execute then
Result:= FMain.Dialog.FileName;
end;


function InFileTo64(InFile :String):TBytes;
var
BS_InFile: TBytesStream;
begin
BS_InFile:=TBytesStream.Create(nil);
BS_InFile.LoadFromFile(InFile);
SetLength(Result, BS_InFile.Size);
BS_InFile.Read(Result, Length(Result));
FreeAndNil(BS_InFile);
end;

procedure SaveCert(Cert64, CertName :String);
var
BS_Cert: TBytesStream;
begin
BS_Cert:=TBytesStream.Create(Base64UrlDecode(Cert64));
BS_Cert.SaveToFile(CertName);
FreeAndNil(BS_Cert);
end;






end.