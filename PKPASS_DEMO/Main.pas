unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.JSON,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFMain = class(TForm)
    PC_Main: TPageControl;
    TAB_PKPASS: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    SB_PKCS12: TSpeedButton;
    Label11: TLabel;
    SB_WWDR: TSpeedButton;
    B_CREATE_PKPASS: TButton;
    E_PKCS12: TEdit;
    CB_WWDR: TCheckBox;
    E_WWDR: TEdit;
    TAB_APN: TTabSheet;
    Label4: TLabel;
    Label9: TLabel;
    SB_Certificate_PKCS12: TSpeedButton;
    SB_APN: TSpeedButton;
    E_Certificate_PKCS12: TEdit;
    E_Save_APN: TEdit;
    B_CREATE_APN: TButton;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    E_background: TEdit;
    SB_background: TSpeedButton;
    E_background2x: TEdit;
    SB_background2x: TSpeedButton;
    E_icon: TEdit;
    SB_icon: TSpeedButton;
    E_icon2x: TEdit;
    SB_icon2x: TSpeedButton;
    E_logo: TEdit;
    SB_logo: TSpeedButton;
    E_logo2x: TEdit;
    SB_logo2x: TSpeedButton;
    E_strip: TEdit;
    SB_strip: TSpeedButton;
    E_strip2x: TEdit;
    SB_strip2x: TSpeedButton;
    E_thumbnail: TEdit;
    SB_thumbnail: TSpeedButton;
    E_thumbnail2x: TEdit;
    SB_thumbnail2x: TSpeedButton;
    Label15: TLabel;
    Dialog: TOpenDialog;
    E_Pass_Json: TEdit;
    SB_Pass_Json: TSpeedButton;
    Label16: TLabel;
    E_Password: TEdit;
    Label17: TLabel;
    E_Password1: TEdit;
    Label18: TLabel;
    E_icon3x: TEdit;
    SB_icon3x: TSpeedButton;
    CB_TYPE_PKPASS: TComboBox;
    M_CERT_ATTRIBUTES: TMemo;
    B_GET_ATTRIBUTES_PKCS12: TButton;
    E_CERT_PEM: TEdit;
    SB_CERT_PEM: TSpeedButton;
    B_GET_ATTRIBUTES_PEM: TButton;
    TAB_ConvertCert: TTabSheet;
    Label19: TLabel;
    E_Certificate: TEdit;
    SB_Certificate: TSpeedButton;
    E_PrivateKey: TEdit;
    SB_PrivateKey: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    E_CERT_CA: TEdit;
    SB_CERT_CA: TSpeedButton;
    Label22: TLabel;
    E_Password2: TEdit;
    Label23: TLabel;
    E_Friendly_Name: TEdit;
    Label24: TLabel;
    SB_Save_PKCS12: TSpeedButton;
    E_Save_PKCS12: TEdit;
    B_CONVERT_PEM_To_PKCS12: TButton;
    TAB_CERT_REQUEST: TTabSheet;
    B_CREATE_CERT_REQUEST: TButton;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    E_CommonName: TEdit;
    E_Organization: TEdit;
    E_OrgUnit: TEdit;
    E_Locality: TEdit;
    E_State: TEdit;
    E_Country: TEdit;
    E_EmailAddress: TEdit;
    Label29: TLabel;
    E_Alt_Name: TEdit;
    Label33: TLabel;
    CB_RSA_BITS: TComboBox;
    CB_DIGEST_ALG: TComboBox;
    Label34: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SB_WWDRClick(Sender: TObject);
    procedure SB_backgroundClick(Sender: TObject);
    procedure SB_background2xClick(Sender: TObject);
    procedure SB_iconClick(Sender: TObject);
    procedure SB_icon2xClick(Sender: TObject);
    procedure SB_logoClick(Sender: TObject);
    procedure SB_logo2xClick(Sender: TObject);
    procedure SB_stripClick(Sender: TObject);
    procedure SB_strip2xClick(Sender: TObject);
    procedure SB_thumbnailClick(Sender: TObject);
    procedure SB_thumbnail2xClick(Sender: TObject);
    procedure SB_PKCS12Click(Sender: TObject);
    procedure SB_Pass_JsonClick(Sender: TObject);
    procedure SB_APNClick(Sender: TObject);
    procedure SB_Certificate_PKCS12Click(Sender: TObject);
    procedure B_CREATE_PKPASSClick(Sender: TObject);
    procedure CB_WWDRClick(Sender: TObject);
    procedure SB_icon3xClick(Sender: TObject);
    procedure B_CREATE_APNClick(Sender: TObject);
    procedure SB_CERT_PEMClick(Sender: TObject);
    procedure B_GET_ATTRIBUTES_PKCS12Click(Sender: TObject);
    procedure B_GET_ATTRIBUTES_PEMClick(Sender: TObject);
    procedure SB_Save_PKCS12Click(Sender: TObject);
    procedure SB_CertificateClick(Sender: TObject);
    procedure SB_PrivateKeyClick(Sender: TObject);
    procedure SB_CERT_CAClick(Sender: TObject);
    procedure B_CONVERT_PEM_To_PKCS12Click(Sender: TObject);
    procedure B_CREATE_CERT_REQUESTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function EXECUTE_CREATE_PKPASS(P_IN_JSON :Pointer; IN_JSON_LEN :Integer;
  out P_OUT :Pointer; out OUT_LEN :Integer; out ERROR :PChar): Integer; stdcall; external 'PKPASS.DLL';

  function EXECUTE_CREATE_APN(P_IN_PKCS12 :Pointer; IN_PKCS12_LEN :Integer; Password: PAnsiChar;
  out P_OUT :Pointer; out OUT_LEN :Integer; out ERROR :PChar): Integer; stdcall; external 'PKPASS.DLL';

  function EXECUTE_GET_ATTRIBUTES_PKCS12(P_IN_PKCS12 :Pointer; IN_PKCS12_LEN :Integer; Password: PAnsiChar;
  out P_OUT_JSON :Pointer; out OUT_JSON_LEN :Integer; out ERROR :PChar): Integer; stdcall external 'PKPASS.DLL';

  function EXECUTE_GET_ATTRIBUTES_PEM(P_IN_PEM :Pointer; IN_PEM_LEN :Integer;
  out P_OUT_JSON :Pointer; out OUT_JSON_LEN :Integer; out ERROR :PChar): Integer; stdcall external 'PKPASS.DLL';

  function EXECUTE_CONVERT_PEM_To_PKCS12(P_IN_JSON :Pointer; IN_JSON_LEN :Integer;
  out P_OUT_PKCS12 :Pointer; out OUT_PKCS12_LEN :Integer; out ERROR :PChar): Integer; stdcall external 'PKPASS.DLL';

  function EXECUTE_CREATE_CERT_REQUEST(P_IN_JSON :Pointer; IN_JSON_LEN :Integer;
  out P_OUT_JSON :Pointer; out OUT_JSON_LEN :Integer; out ERROR :PChar): Integer; stdcall external 'PKPASS.DLL';

  {VERSION_ALL 0 1}
  function GET_SSL_VERSION(VERSION_ALL :Integer; out VERSION, ERROR :PChar): Integer; stdcall external 'PKPASS.DLL';


var
  FMain: TFMain;

implementation

{$R *.dfm}

uses U_UTILS;



procedure TFMain.B_CREATE_APNClick(Sender: TObject);
var
BS_CERT: TBytesStream;
Password: PAnsiChar;

P_OUT_APN :Pointer;
OUT_APN_LEN :Integer;
ERROR :PChar;
Res :Integer;
begin
if Length(E_Certificate_PKCS12.Text) = 0 then begin ShowMessage('Certificate PKCS12 must be filled.'); Exit; end;

Password:=PAnsiChar(Utf8Encode(E_Password1.Text));
BS_CERT:=TBytesStream.Create(nil);
BS_CERT.LoadFromFile(E_Certificate_PKCS12.Text);
BS_CERT.Position := 0;
BS_CERT.Seek(0,0);
Res:=EXECUTE_CREATE_APN(BS_CERT.Memory, BS_CERT.Size, Password, P_OUT_APN, OUT_APN_LEN, ERROR);
FreeAndNil(BS_CERT);

if Res = 1 then begin
ShowMessage(StrPas(ERROR));
Exit;
end;

if (P_OUT_APN <> nil) and (OUT_APN_LEN > 0) then begin
BS_CERT:=TBytesStream.Create(nil);
BS_CERT.WriteBuffer(P_OUT_APN^, OUT_APN_LEN);
BS_CERT.Position := 0;
BS_CERT.Seek(0,0);
BS_CERT.SaveToFile(E_Save_APN.Text +'APN.PEM');
P_OUT_APN:=nil;
FreeAndNil(BS_CERT);
end;
end;




procedure TFMain.B_CREATE_CERT_REQUESTClick(Sender: TObject);
var
BS_JSON: TBytesStream;
In_JSON, OUT_JSON: TJSONObject;

P_OUT_JSON :Pointer;
OUT_JSON_LEN :Integer;

ERROR :PChar;
Res :Integer;
begin
In_JSON:=TJSONObject.Create;
In_JSON.AddPair('CommonName',     E_CommonName.Text);
In_JSON.AddPair('Organization',   E_Organization.Text);
In_JSON.AddPair('OrgUnit',        E_OrgUnit.Text);
In_JSON.AddPair('Locality',       E_Locality.Text);
In_JSON.AddPair('State',          E_State.Text);
In_JSON.AddPair('Country',        E_Country.Text);
In_JSON.AddPair('EmailAddress',   E_EmailAddress.Text);
In_JSON.AddPair('Alt_Name',       E_Alt_Name.Text);
In_JSON.AddPair('RSA_BITS',       CB_RSA_BITS.ItemIndex.ToString);
In_JSON.AddPair('DIGEST_ALG',     CB_DIGEST_ALG.ItemIndex.ToString);



BS_JSON:=TBytesStream.Create(nil);
BS_JSON.WriteBuffer(BytesOf(In_JSON.ToJSON), Length(In_JSON.ToJSON));
In_JSON.Free;
BS_JSON.Position := 0;
BS_JSON.Seek(0,0);
Res:=EXECUTE_CREATE_CERT_REQUEST(BS_JSON.Memory, BS_JSON.Size, P_OUT_JSON, OUT_JSON_LEN, ERROR);
FreeAndNil(BS_JSON);


if Res = 1 then begin
ShowMessage(StrPas(ERROR));
Exit;
end;

if (P_OUT_JSON <> nil) and (OUT_JSON_LEN > 0) then begin
BS_JSON:=TBytesStream.Create(nil);
BS_JSON.WriteBuffer(P_OUT_JSON^, OUT_JSON_LEN);
BS_JSON.Position := 0;
BS_JSON.Seek(0,0);
OUT_JSON:=TJSONObject.Create;
OUT_JSON.Parse(BS_JSON.Bytes, 0);
//BS_JSON.SaveToFile(ExtractFilePath(ParamStr(0)) +'CERT.Json');

if Length(Out_JSON.Values['PRIVATEKEY'].Value) > 0 then
SaveCert(Out_JSON.Values['PRIVATEKEY'].Value, ExtractFilePath(ParamStr(0)) +'PRIVATEKEY.PEM');

if Length(Out_JSON.Values['CERT_REQUEST'].Value) > 0 then
SaveCert(Out_JSON.Values['CERT_REQUEST'].Value, ExtractFilePath(ParamStr(0)) +'CERT_REQUEST.PEM');

OUT_JSON.Free;
P_OUT_JSON:=nil;
FreeAndNil(BS_JSON);
end;

end;





procedure TFMain.B_CREATE_PKPASSClick(Sender: TObject);
var
BS_JSON: TBytesStream;
In_JSON: TJSONObject;

P_OUT_PKPASS :Pointer;
OUT_PKPASS_LEN :Integer;
ERROR :PChar;
Res :Integer;
begin
if Length(E_Pass_Json.Text) = 0 then begin ShowMessage('Pass Json must be filled.'); Exit; end;
if Length(E_PKCS12.Text)    = 0 then begin ShowMessage('Certificate PKCS12 must be filled.'); Exit; end;

if CB_WWDR.Checked = False then begin
if Length(E_WWDR.Text) = 0 then begin ShowMessage('Certificate WWDR PEM must be filled.'); Exit; end;
end;


In_JSON:=TJSONObject.Create;
In_JSON.AddPair('Password',              E_Password.Text);
In_JSON.AddPair('TYPE_PKPASS',           CB_TYPE_PKPASS.ItemIndex.ToString);
In_JSON.AddPair('Pass_Json',             Base64UrlEncode(InFileTo64(E_Pass_Json.Text)));
In_JSON.AddPair('Certificate_PKCS12',    Base64UrlEncode(InFileTo64(E_PKCS12.Text)));
In_JSON.AddPair('WWDR',                  TJSONBool.Create(CB_WWDR.Checked));
if CB_WWDR.Checked = False then In_JSON.AddPair('Certificate_WWDR',  Base64UrlEncode(InFileTo64(E_WWDR.Text)));

if Length(E_background.Text)   > 0 then In_JSON.AddPair('background',     Base64UrlEncode(InFileTo64(E_background.Text)));
if Length(E_background2x.Text) > 0 then In_JSON.AddPair('background2x',   Base64UrlEncode(InFileTo64(E_background2x.Text)));
if Length(E_icon.Text)         > 0 then In_JSON.AddPair('icon',           Base64UrlEncode(InFileTo64(E_icon.Text)));
if Length(E_icon2x.Text)       > 0 then In_JSON.AddPair('icon2x',         Base64UrlEncode(InFileTo64(E_icon2x.Text)));
if Length(E_icon3x.Text)       > 0 then In_JSON.AddPair('icon3x',         Base64UrlEncode(InFileTo64(E_icon3x.Text)));
if Length(E_logo.Text)         > 0 then In_JSON.AddPair('logo',           Base64UrlEncode(InFileTo64(E_logo.Text)));
if Length(E_logo2x.Text)       > 0 then In_JSON.AddPair('logo2x',         Base64UrlEncode(InFileTo64(E_logo2x.Text)));
if Length(E_strip.Text)        > 0 then In_JSON.AddPair('strip',          Base64UrlEncode(InFileTo64(E_strip.Text)));
if Length(E_strip2x.Text)      > 0 then In_JSON.AddPair('strip2x',        Base64UrlEncode(InFileTo64(E_strip2x.Text)));
if Length(E_thumbnail.Text)    > 0 then In_JSON.AddPair('thumbnail',      Base64UrlEncode(InFileTo64(E_thumbnail.Text)));
if Length(E_thumbnail2x.Text)  > 0 then In_JSON.AddPair('thumbnail2x',    Base64UrlEncode(InFileTo64(E_thumbnail2x.Text)));


BS_JSON:=TBytesStream.Create(nil);
BS_JSON.WriteBuffer(BytesOf(In_JSON.ToJSON), Length(In_JSON.ToJSON));
In_JSON.Free;
BS_JSON.Position := 0;
BS_JSON.Seek(0,0);
Res:=EXECUTE_CREATE_PKPASS(BS_JSON.Memory, BS_JSON.Size, P_OUT_PKPASS, OUT_PKPASS_LEN, ERROR);
FreeAndNil(BS_JSON);


if Res = 1 then begin
ShowMessage(StrPas(ERROR));
Exit;
end;

if (P_OUT_PKPASS <> nil) and (OUT_PKPASS_LEN > 0) then begin
BS_JSON:=TBytesStream.Create(nil);
BS_JSON.WriteBuffer(P_OUT_PKPASS^, OUT_PKPASS_LEN);
BS_JSON.Position := 0;
BS_JSON.Seek(0,0);
BS_JSON.SaveToFile(ExtractFilePath(ParamStr(0)) +'PKPASS_DEMO.pkpass');
P_OUT_PKPASS:=nil;
FreeAndNil(BS_JSON);
end;
end;



procedure TFMain.B_CONVERT_PEM_To_PKCS12Click(Sender: TObject);
var
BS_JSON: TBytesStream;
In_JSON: TJSONObject;

P_OUT_PKCS12 :Pointer;
OUT_PKCS12_LEN :Integer;
ERROR :PChar;
Res :Integer;
begin
if Length(E_Certificate.Text) = 0 then begin ShowMessage('Certificate must be filled.'); Exit; end;
if Length(E_PrivateKey.Text) = 0  then begin ShowMessage('Private Key must be filled.'); Exit; end;
//if Length(E_Save_PKCS12.Text) = 0 then begin ShowMessage('Save PKCS12 must be filled.'); Exit; end;

In_JSON:=TJSONObject.Create;
if Length(E_Certificate.Text) > 0 then In_JSON.AddPair('CERT',       Base64UrlEncode(InFileTo64(E_Certificate.Text)));
if Length(E_PrivateKey.Text)  > 0 then In_JSON.AddPair('PrivateKey', Base64UrlEncode(InFileTo64(E_PrivateKey.Text)));
if Length(E_CERT_CA.Text)     > 0 then In_JSON.AddPair('CA',         Base64UrlEncode(InFileTo64(E_CERT_CA.Text)));
In_JSON.AddPair('Password',      E_Password2.Text);
In_JSON.AddPair('Friendly_Name', E_Friendly_Name.Text);

BS_JSON:=TBytesStream.Create(nil);
BS_JSON.WriteBuffer(BytesOf(In_JSON.ToJSON), Length(In_JSON.ToJSON));
In_JSON.Free;
BS_JSON.Position := 0;
BS_JSON.Seek(0,0);
Res:=EXECUTE_CONVERT_PEM_To_PKCS12(BS_JSON.Memory, BS_JSON.Size, P_OUT_PKCS12, OUT_PKCS12_LEN, ERROR);
FreeAndNil(BS_JSON);

if Res = 1 then begin
ShowMessage(StrPas(ERROR));
Exit;
end;

if (P_OUT_PKCS12 <> nil) and (OUT_PKCS12_LEN > 0) then begin
BS_JSON:=TBytesStream.Create(nil);
BS_JSON.WriteBuffer(P_OUT_PKCS12^, OUT_PKCS12_LEN);
BS_JSON.Position := 0;
BS_JSON.Seek(0,0);
if Length(E_Save_PKCS12.Text) = 0 then E_Save_PKCS12.Text:=ExtractFilePath(ParamStr(0));
BS_JSON.SaveToFile(E_Save_PKCS12.Text +'CERT.P12');
P_OUT_PKCS12:=nil;
FreeAndNil(BS_JSON);
end;

end;




procedure TFMain.B_GET_ATTRIBUTES_PEMClick(Sender: TObject);
var
BS_CERT: TBytesStream;

P_OUT_JSON :Pointer;
OUT_JSON_LEN :Integer;
OUT_JSON: TJSONObject;
ERROR :PChar;
Res :Integer;
begin
M_CERT_ATTRIBUTES.Clear;
if Length(E_CERT_PEM.Text) = 0 then begin ShowMessage('Certificate PEM must be filled.'); Exit; end;

BS_CERT:=TBytesStream.Create(nil);
BS_CERT.LoadFromFile(E_CERT_PEM.Text);
BS_CERT.Position := 0;
BS_CERT.Seek(0,0);
Res:=EXECUTE_GET_ATTRIBUTES_PEM(BS_CERT.Memory, BS_CERT.Size, P_OUT_JSON, OUT_JSON_LEN, ERROR);
FreeAndNil(BS_CERT);

if Res = 1 then begin
ShowMessage(StrPas(ERROR));
Exit;
end;


if (P_OUT_JSON <> nil) and (OUT_JSON_LEN > 0) then begin
BS_CERT:=TBytesStream.Create(nil);
BS_CERT.WriteBuffer(P_OUT_JSON^, OUT_JSON_LEN);
BS_CERT.Position := 0;
BS_CERT.Seek(0,0);
OUT_JSON:=TJSONObject.Create;
OUT_JSON.Parse(BS_CERT.Bytes, 0);
//BS_CERT.SaveToFile(ExtractFilePath(ParamStr(0)) +'ATTR_PEM.Json');
if Res = 0 then begin
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['SUBJECT'].Value);
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['ISSUER'].Value);
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['SN'].Value);
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['DT_BEFORE'].Value);
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['DT_AFTER'].Value);
end;
OUT_JSON.Free;
P_OUT_JSON:=nil;
FreeAndNil(BS_CERT);
end;
end;



procedure TFMain.B_GET_ATTRIBUTES_PKCS12Click(Sender: TObject);
var
BS_CERT: TBytesStream;
Password: PAnsiChar;

P_OUT_JSON :Pointer;
OUT_JSON_LEN :Integer;
OUT_JSON: TJSONObject;
ERROR :PChar;
Res :Integer;
begin
M_CERT_ATTRIBUTES.Clear;
if Length(E_Certificate_PKCS12.Text) = 0 then begin ShowMessage('Certificate PKCS12 must be filled.'); Exit; end;

Password:=PAnsiChar(Utf8Encode(E_Password1.Text));
BS_CERT:=TBytesStream.Create(nil);
BS_CERT.LoadFromFile(E_Certificate_PKCS12.Text);
BS_CERT.Position := 0;
BS_CERT.Seek(0,0);
Res:=EXECUTE_GET_ATTRIBUTES_PKCS12(BS_CERT.Memory, BS_CERT.Size, Password, P_OUT_JSON, OUT_JSON_LEN, ERROR);
FreeAndNil(BS_CERT);

if Res = 1 then begin
ShowMessage(StrPas(ERROR));
Exit;
end;


if (P_OUT_JSON <> nil) and (OUT_JSON_LEN > 0) then begin
BS_CERT:=TBytesStream.Create(nil);
BS_CERT.WriteBuffer(P_OUT_JSON^, OUT_JSON_LEN);
BS_CERT.Position := 0;
BS_CERT.Seek(0,0);
OUT_JSON:=TJSONObject.Create;
OUT_JSON.Parse(BS_CERT.Bytes, 0);
BS_CERT.SaveToFile(ExtractFilePath(ParamStr(0)) +'ATTR_PKCS12.Json');
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['SUBJECT'].Value);
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['ISSUER'].Value);
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['SN'].Value);
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['DT_BEFORE'].Value);
M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['DT_AFTER'].Value);

if Out_JSON.Values['CA_SUBJECT']   <> Nil then  M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['CA_SUBJECT'].Value);
if Out_JSON.Values['CA_ISSUER']    <> Nil then  M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['CA_ISSUER'].Value);
if Out_JSON.Values['CA_SN']        <> Nil then  M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['CA_SN'].Value);
if Out_JSON.Values['CA_DT_BEFORE'] <> Nil then  M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['CA_DT_BEFORE'].Value);
if Out_JSON.Values['CA_DT_AFTER']  <> Nil then  M_CERT_ATTRIBUTES.Lines.Add(Out_JSON.Values['CA_DT_AFTER'].Value);

OUT_JSON.Free;
P_OUT_JSON:=nil;
FreeAndNil(BS_CERT);
end;
end;



procedure TFMain.CB_WWDRClick(Sender: TObject);
begin
if CB_WWDR.Checked = True then begin
E_WWDR.Enabled:=False;
E_WWDR.Clear;
SB_WWDR.Enabled:=False;
end
Else
begin
E_WWDR.Enabled:=True;
SB_WWDR.Enabled:=True;
end;

end;

procedure TFMain.FormCreate(Sender: TObject);
begin
PC_Main.ActivePageIndex:=0;
CB_TYPE_PKPASS.ItemIndex:=0;
CB_RSA_BITS.ItemIndex:=1;
CB_DIGEST_ALG.ItemIndex:=3;
M_CERT_ATTRIBUTES.Clear;
end;

procedure TFMain.SB_APNClick(Sender: TObject);
begin
E_Save_APN.Text:=SelectDir('Save APN Certificate to Directory');
end;

procedure TFMain.SB_background2xClick(Sender: TObject);
begin
E_background2x.Text:= SelectFile('background@2x (png)', 'background@2x files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_backgroundClick(Sender: TObject);
begin
E_background.Text:= SelectFile('background (png)', 'background files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_CertificateClick(Sender: TObject);
begin
E_Certificate.Text:= SelectFile('Certificate (pem)', 'Certificate files (pem)|*.pem|All files|*.*');
end;

procedure TFMain.SB_Certificate_PKCS12Click(Sender: TObject);
begin
E_Certificate_PKCS12.Text:= SelectFile('Certificate (p12 - pfx)', 'Certificate files (p12)|*.p12|Certificate files (pfx)|*.pfx|All files|*.*');
end;

procedure TFMain.SB_CERT_CAClick(Sender: TObject);
begin
E_CERT_CA.Text:= SelectFile('CERT CA (pem)', 'Certificate files (pem)|*.pem|All files|*.*');
end;

procedure TFMain.SB_CERT_PEMClick(Sender: TObject);
begin
E_CERT_PEM.Text:= SelectFile('CERT (pem)', 'Certificate files (pem)|*.pem|All files|*.*');
end;

procedure TFMain.SB_icon2xClick(Sender: TObject);
begin
E_icon2x.Text:= SelectFile('icon@2x (png)', 'icon@2x files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_icon3xClick(Sender: TObject);
begin
E_icon3x.Text:= SelectFile('icon@3x (png)', 'icon@3x files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_iconClick(Sender: TObject);
begin
E_icon.Text:= SelectFile('icon (png)', 'icon files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_logo2xClick(Sender: TObject);
begin
E_logo2x.Text:= SelectFile('logo@2x (png)', 'logo@2x files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_logoClick(Sender: TObject);
begin
E_logo.Text:= SelectFile('logo (png)', 'logo files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_Pass_JsonClick(Sender: TObject);
begin
E_Pass_Json.Text:= SelectFile('PassJson (png)', 'PassJson files (json)|*.json|All files|*.*');
end;

procedure TFMain.SB_PKCS12Click(Sender: TObject);
begin
E_PKCS12.Text:= SelectFile('Certificate (p12 - pfx)', 'Certificate files (p12)|*.p12|Certificate files (pfx)|*.pfx|All files|*.*');
end;

procedure TFMain.SB_PrivateKeyClick(Sender: TObject);
begin
E_PrivateKey.Text:= SelectFile('Private Key (pem)', 'Certificate files (pem)|*.pem|All files|*.*');
end;

procedure TFMain.SB_Save_PKCS12Click(Sender: TObject);
begin
E_Save_PKCS12.Text:=SelectDir('Save PKCS12 Certificate to Directory');
end;

procedure TFMain.SB_strip2xClick(Sender: TObject);
begin
E_strip2x.Text:= SelectFile('strip@2x (png)', 'strip@2x files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_stripClick(Sender: TObject);
begin
E_strip.Text:= SelectFile('strip (png)', 'strip files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_thumbnail2xClick(Sender: TObject);
begin
E_thumbnail2x.Text:= SelectFile('thumbnail@2x (png)', 'thumbnail@2x files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_thumbnailClick(Sender: TObject);
begin
E_thumbnail.Text:= SelectFile('thumbnail (png)', 'thumbnail files (png)|*.png|All files|*.*');
end;

procedure TFMain.SB_WWDRClick(Sender: TObject);
begin
E_WWDR.Text:= SelectFile('WWDR (pem)', 'Certificate files (pem)|*.pem|All files|*.*');
end;

end.
