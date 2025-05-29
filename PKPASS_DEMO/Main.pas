unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, FileCtrl,
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
    E_Pass_Json: TEdit;
    SB_Pass_Json: TSpeedButton;
    Label16: TLabel;
    E_Password: TEdit;
    Label17: TLabel;
    E_Password1: TEdit;
    Label18: TLabel;
    E_icon3x: TEdit;
    SB_icon3x: TSpeedButton;
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
    Label35: TLabel;
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
   function SelectDir(Const Caption :String):String;
   function SelectFile(Const Title, Filter :String):String;
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FMain: TFMain;

implementation

{$R *.dfm}

uses U_PKPASS;

procedure TFMain.B_CREATE_APNClick(Sender: TObject);
var
PKCS12 :PPKCS12;
APN :TBuffer;
ErrorBuf: PChar;
begin
TRY
  TRY
    if Length(E_Certificate_PKCS12.Text) = 0 then begin
     Messagedlg('Certificate PKCS12 must be filled.', mterror, [mbNo],0);
     Exit;
    end;

    New(PKCS12);
    PKCS12.Password:=PAnsiChar(Utf8Encode(E_Password1.Text));
    LoadFile(E_Certificate_PKCS12.Text, PKCS12.Certificate);

    if not EXECUTE_CREATE_APN(PKCS12, APN, ErrorBuf) then
      Messagedlg(StrPas(ErrorBuf), mterror, [mbNo],0)
    Else
      SaveFile(E_Save_APN.Text +'APN.PEM', APN.Buf, APN.Size);

  FINALLY
   Pointer_Free(APN.Buf, APN.Size);
   TBuffer_Free(PKCS12.Certificate);
   Dispose(PKCS12);
  END;

except on e:exception do
 Messagedlg(e.Message, mterror, [mbNo],0);
end;

end;

procedure TFMain.B_CREATE_CERT_REQUESTClick(Sender: TObject);
var
CREATE_REQUEST :PCREATE_REQUEST;
REQUEST, PKEY :TBuffer;
ErrorBuf: PChar;
begin
TRY
  TRY
    New(CREATE_REQUEST);
    CREATE_REQUEST.CommonName  :=PAnsiChar(Utf8Encode(E_CommonName.Text));
    CREATE_REQUEST.Organization:=PAnsiChar(Utf8Encode(E_Organization.Text));
    CREATE_REQUEST.OrgUnit     :=PAnsiChar(Utf8Encode(E_OrgUnit.Text));
    CREATE_REQUEST.Locality    :=PAnsiChar(Utf8Encode(E_Locality.Text));
    CREATE_REQUEST.State       :=PAnsiChar(Utf8Encode(E_State.Text));
    CREATE_REQUEST.Country     :=PAnsiChar(Utf8Encode(E_Country.Text));
    CREATE_REQUEST.EmailAddress:=PAnsiChar(Utf8Encode(E_EmailAddress.Text));
    CREATE_REQUEST.Alt_Name    :=PAnsiChar(Utf8Encode(E_Alt_Name.Text));
    CREATE_REQUEST.RSA_BITS    :=CB_RSA_BITS.ItemIndex;
    CREATE_REQUEST.DIGEST_ALG  :=CB_DIGEST_ALG.ItemIndex;

    if not EXECUTE_CREATE_CERT_REQUEST(CREATE_REQUEST, REQUEST, PKEY, ErrorBuf) then
      Messagedlg(StrPas(ErrorBuf), mterror, [mbNo],0)
    Else begin
      SaveFile(ExtractFilePath(ParamStr(0)) +'REQUEST.PEM',    REQUEST.Buf, REQUEST.Size);
      SaveFile(ExtractFilePath(ParamStr(0)) +'PRIVATEKEY.PEM', PKEY.Buf,    PKEY.Size);
    end;

  FINALLY
   Pointer_Free(REQUEST.Buf, REQUEST.Size);
   Pointer_Free(PKEY.Buf,    PKEY.Size);
   Dispose(CREATE_REQUEST);
  END;

except on e:exception do
 Messagedlg(e.Message, mterror, [mbNo],0);
end;

end;

procedure TFMain.B_CREATE_PKPASSClick(Sender: TObject);
var
CREATE_PKPASS :PCREATE_PKPASS;
PKPASS :TBuffer;
ErrorBuf: PChar;
begin
TRY
  TRY
    if Length(E_Pass_Json.Text) = 0 then begin Messagedlg('Pass Json must be filled.', mterror, [mbNo],0); Exit; end;
    if Length(E_PKCS12.Text)    = 0 then begin Messagedlg('Certificate PKCS12 must be filled.', mterror, [mbNo],0); Exit; end;

    if (CB_WWDR.Checked = False) And (Length(E_WWDR.Text) = 0 ) then begin
     Messagedlg('Certificate WWDR PEM must be filled.', mterror, [mbNo],0);
     Exit;
    end;

    New(CREATE_PKPASS);
    CREATE_PKPASS.Password:=PAnsiChar(Utf8Encode(E_Password.Text));
    CREATE_PKPASS.WWDR:=CB_WWDR.Checked;

    LoadFile(E_Pass_Json.Text, CREATE_PKPASS.Pass_Json);
    LoadFile(E_PKCS12.Text,    CREATE_PKPASS.Certificate_PKCS12);
    LoadFile(E_WWDR.Text,      CREATE_PKPASS.Certificate_WWDR);

    LoadFile(E_background.Text,   CREATE_PKPASS.background);
    LoadFile(E_background2x.Text, CREATE_PKPASS.background2x);
    LoadFile(E_icon.Text,         CREATE_PKPASS.icon);
    LoadFile(E_icon2x.Text,       CREATE_PKPASS.icon2x);
    LoadFile(E_icon3x.Text,       CREATE_PKPASS.icon3x);
    LoadFile(E_logo.Text,         CREATE_PKPASS.logo);
    LoadFile(E_logo2x.Text,       CREATE_PKPASS.logo2x);
    LoadFile(E_strip.Text,        CREATE_PKPASS.strip);
    LoadFile(E_strip2x.Text,      CREATE_PKPASS.strip2x);
    LoadFile(E_thumbnail.Text,    CREATE_PKPASS.thumbnail);
    LoadFile(E_thumbnail2x.Text,  CREATE_PKPASS.thumbnail2x);


    if not EXECUTE_CREATE_PKPASS(CREATE_PKPASS, PKPASS, ErrorBuf) then
     Messagedlg(StrPas(ErrorBuf), mterror, [mbNo],0)
    Else
     SaveFile(ExtractFilePath(ParamStr(0)) +'PKPASS_DEMO.pkpass', PKPASS.Buf, PKPASS.Size);


  FINALLY
    Pointer_Free(PKPASS.Buf, PKPASS.Size);
    TBuffer_Free(CREATE_PKPASS.Pass_Json);
    TBuffer_Free(CREATE_PKPASS.Certificate_PKCS12);
    TBuffer_Free(CREATE_PKPASS.Certificate_WWDR);
    TBuffer_Free(CREATE_PKPASS.background);
    TBuffer_Free(CREATE_PKPASS.background2x);
    TBuffer_Free(CREATE_PKPASS.icon);
    TBuffer_Free(CREATE_PKPASS.icon2x);
    TBuffer_Free(CREATE_PKPASS.icon3x);
    TBuffer_Free(CREATE_PKPASS.logo);
    TBuffer_Free(CREATE_PKPASS.logo2x);
    TBuffer_Free(CREATE_PKPASS.strip);
    TBuffer_Free(CREATE_PKPASS.strip2x);
    TBuffer_Free(CREATE_PKPASS.thumbnail);
    TBuffer_Free(CREATE_PKPASS.thumbnail2x);
    Dispose(CREATE_PKPASS);
  END;

except on e:exception do
 Messagedlg(e.Message, mterror, [mbNo],0);
end;

end;

procedure TFMain.B_CONVERT_PEM_To_PKCS12Click(Sender: TObject);
var
PEM_To_PKCS12 :PPEM_To_PKCS12;
PKCS12 :TBuffer;
ErrorBuf: PChar;
begin
TRY
  TRY
    if Length(E_Certificate.Text) = 0 then begin Messagedlg('Certificate must be filled.', mterror, [mbNo],0); Exit; end;
    if Length(E_PrivateKey.Text)  = 0 then begin Messagedlg('Private Key must be filled.', mterror, [mbNo],0); Exit; end;

    New(PEM_To_PKCS12);
    LoadFile(E_Certificate.Text, PEM_To_PKCS12.CERT);
    LoadFile(E_PrivateKey.Text,  PEM_To_PKCS12.PKEY);
    LoadFile(E_CERT_CA.Text,     PEM_To_PKCS12.CA);
    PEM_To_PKCS12.Password     :=PAnsiChar(Utf8Encode(E_Password2.Text));
    PEM_To_PKCS12.Friendly_Name:=PAnsiChar(Utf8Encode(E_Friendly_Name.Text));

    if not EXECUTE_CONVERT_PEM_To_PKCS12(PEM_To_PKCS12, PKCS12, ErrorBuf) then
     Messagedlg(StrPas(ErrorBuf), mterror, [mbNo],0)
    Else
     SaveFile(E_Save_PKCS12.Text +'CERT.P12', PKCS12.Buf, PKCS12.Size);


  FINALLY
   Pointer_Free(PKCS12.Buf, PKCS12.Size);
   TBuffer_Free(PEM_To_PKCS12.CERT);
   TBuffer_Free(PEM_To_PKCS12.PKEY);
   TBuffer_Free(PEM_To_PKCS12.CA);
   Dispose(PEM_To_PKCS12);
  END;

except on e:exception do
 Messagedlg(e.Message, mterror, [mbNo],0);
end;

end;

procedure TFMain.B_GET_ATTRIBUTES_PEMClick(Sender: TObject);
var
PEM :TBuffer;
CERT_ATTRIBUTES :TCERT_ATTRIBUTES;
ErrorBuf: PChar;
begin
TRY
  TRY
    M_CERT_ATTRIBUTES.Clear;

    if Length(E_CERT_PEM.Text) = 0 then begin
     Messagedlg('Certificate PEM must be filled.', mterror, [mbNo],0);
     Exit;
    end;

    ZeroMemory(@CERT_ATTRIBUTES, SizeOf(TCERT_ATTRIBUTES));
    LoadFile(E_CERT_PEM.Text, PEM);

    if not EXECUTE_GET_ATTRIBUTES_PEM(@PEM, @CERT_ATTRIBUTES, ErrorBuf) then
      Messagedlg(StrPas(ErrorBuf), mterror, [mbNo],0)
    Else begin
      M_CERT_ATTRIBUTES.Lines.Add('SUBJECT: '   +PAnsiChar(TBufferToString(CERT_ATTRIBUTES.SUBJECT)));
      M_CERT_ATTRIBUTES.Lines.Add('ISSUER: '    +PAnsiChar(TBufferToString(CERT_ATTRIBUTES.ISSUER)));
      M_CERT_ATTRIBUTES.Lines.Add('SN: '        +PAnsiChar(CERT_ATTRIBUTES.SN));
      M_CERT_ATTRIBUTES.Lines.Add('DT_BEFORE: ' +FormatDateTime('dd.mm.yyyy hh:mm:ss', UDT_ToDateTime(CERT_ATTRIBUTES.DT_BEFORE)));
      M_CERT_ATTRIBUTES.Lines.Add('DT_AFTER: '  +FormatDateTime('dd.mm.yyyy hh:mm:ss', UDT_ToDateTime(CERT_ATTRIBUTES.DT_AFTER)));
    end;


  FINALLY
   TBuffer_Free(PEM);
   Pointer_Free(CERT_ATTRIBUTES.SUBJECT.Buf, CERT_ATTRIBUTES.SUBJECT.Size);
   Pointer_Free(CERT_ATTRIBUTES.ISSUER.Buf,  CERT_ATTRIBUTES.ISSUER.Size);
  END;

except on e:exception do
 Messagedlg(e.Message, mterror, [mbNo],0);
end;

end;

procedure TFMain.B_GET_ATTRIBUTES_PKCS12Click(Sender: TObject);
var
PKCS12 :PPKCS12;
CERT_ATTRIBUTES :TCERT_ATTRIBUTES;
ErrorBuf: PChar;
begin
TRY
  TRY
    M_CERT_ATTRIBUTES.Clear;
    if Length(E_Certificate_PKCS12.Text) = 0 then begin
     Messagedlg('Certificate PKCS12 must be filled.', mterror, [mbNo],0);
     Exit;
    end;

    New(PKCS12);
    ZeroMemory(@CERT_ATTRIBUTES, SizeOf(TCERT_ATTRIBUTES));

    PKCS12.Password:=PAnsiChar(Utf8Encode(E_Password1.Text));
    LoadFile(E_Certificate_PKCS12.Text, PKCS12.Certificate);

    if not EXECUTE_GET_ATTRIBUTES_PKCS12(PKCS12, @CERT_ATTRIBUTES, ErrorBuf) then
     Messagedlg(StrPas(ErrorBuf), mterror, [mbNo],0)
    Else begin
      M_CERT_ATTRIBUTES.Lines.Add('SUBJECT: '   +PAnsiChar(TBufferToString(CERT_ATTRIBUTES.SUBJECT)));
      M_CERT_ATTRIBUTES.Lines.Add('ISSUER: '    +PAnsiChar(TBufferToString(CERT_ATTRIBUTES.ISSUER)));
      M_CERT_ATTRIBUTES.Lines.Add('SN: '        +PAnsiChar(CERT_ATTRIBUTES.SN));
      M_CERT_ATTRIBUTES.Lines.Add('DT_BEFORE: ' +FormatDateTime('dd.mm.yyyy hh:mm:ss', UDT_ToDateTime(CERT_ATTRIBUTES.DT_BEFORE)));
      M_CERT_ATTRIBUTES.Lines.Add('DT_AFTER: '  +FormatDateTime('dd.mm.yyyy hh:mm:ss', UDT_ToDateTime(CERT_ATTRIBUTES.DT_AFTER)));

      if CERT_ATTRIBUTES.CERT_CA then begin
        M_CERT_ATTRIBUTES.Lines.Add('');
        M_CERT_ATTRIBUTES.Lines.Add('CA_SUBJECT: '   +PAnsiChar(TBufferToString(CERT_ATTRIBUTES.CA_SUBJECT)));
        M_CERT_ATTRIBUTES.Lines.Add('CA_ISSUER: '    +PAnsiChar(TBufferToString(CERT_ATTRIBUTES.CA_ISSUER)));
        M_CERT_ATTRIBUTES.Lines.Add('CA_SN: '        +PAnsiChar(CERT_ATTRIBUTES.CA_SN));
        M_CERT_ATTRIBUTES.Lines.Add('CA_DT_BEFORE: ' +FormatDateTime('dd.mm.yyyy hh:mm:ss', UDT_ToDateTime(CERT_ATTRIBUTES.CA_DT_BEFORE)));
        M_CERT_ATTRIBUTES.Lines.Add('CA_DT_AFTER: '  +FormatDateTime('dd.mm.yyyy hh:mm:ss', UDT_ToDateTime(CERT_ATTRIBUTES.CA_DT_AFTER)));
      end;

    end;

  FINALLY
   Pointer_Free(CERT_ATTRIBUTES.SUBJECT.Buf, CERT_ATTRIBUTES.SUBJECT.Size);
   Pointer_Free(CERT_ATTRIBUTES.ISSUER.Buf,  CERT_ATTRIBUTES.ISSUER.Size);
   Pointer_Free(CERT_ATTRIBUTES.CA_SUBJECT.Buf, CERT_ATTRIBUTES.CA_SUBJECT.Size);
   Pointer_Free(CERT_ATTRIBUTES.CA_ISSUER.Buf,  CERT_ATTRIBUTES.CA_ISSUER.Size);
   TBuffer_Free(PKCS12.Certificate);
   Dispose(PKCS12);
  END;

except on e:exception do
 Messagedlg(e.Message, mterror, [mbNo],0);
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

function TFMain.SelectDir(Const Caption :String):String;
var
  Dir :String;
begin
SelectDirectory(Caption, '', Dir, [sdNewUI, sdShowEdit]);
if Length(Dir) = 0 then Exit;
Result:=Dir +'\';
end;

function TFMain.SelectFile(Const Title, Filter :String):String;
var
Dialog: TOpenDialog;
begin
Try
Dialog:=TOpenDialog.Create(nil);
Dialog.FileName:='';
Dialog.Title:=Title;
Dialog.Filter:= Filter;
Dialog.InitialDir:=ExtractFilePath(ParamStr(0));
if Dialog.Execute then
Result:= Dialog.FileName;
Dialog.Free;
except on E:Exception do
if Assigned(Dialog) then Dialog.Free;
End;
end;


Initialization
PKPASS_INIT();

Finalization
PKPASS_DONE();

end.
