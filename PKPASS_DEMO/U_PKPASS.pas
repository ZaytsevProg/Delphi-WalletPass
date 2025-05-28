unit U_PKPASS;

interface

uses
 Winapi.Windows, System.SysUtils;

 type
   TBuffer = record
       Size   :NativeInt;
       Buf    :Pointer;
    end;
      PTBuffer = ^TBuffer;

    TCREATE_PKPASS = packed record
       Password           :PAnsiChar;
       WWDR               :Boolean;
       Pass_Json          :TBuffer;
       Certificate_PKCS12 :TBuffer;
       Certificate_WWDR   :TBuffer;
       background         :TBuffer;
       background2x       :TBuffer;
       icon               :TBuffer;
       icon2x             :TBuffer;
       icon3x             :TBuffer;
       logo               :TBuffer;
       logo2x             :TBuffer;
       strip              :TBuffer;
       strip2x            :TBuffer;
       thumbnail          :TBuffer;
       thumbnail2x        :TBuffer;
    end;
      PCREATE_PKPASS = ^TCREATE_PKPASS;

    TPKCS12 = packed record
       Password    :PAnsiChar;
       Certificate :TBuffer;
    end;
      PPKCS12 = ^TPKCS12;

    TCERT_ATTRIBUTES = packed record
       SUBJECT      :TBuffer;
       ISSUER       :TBuffer;
       SN           :PAnsiChar;
       DT_BEFORE    :Int64;
       DT_AFTER     :Int64;
       CERT_CA      :Boolean;
       CA_SUBJECT   :TBuffer;
       CA_ISSUER    :TBuffer;
       CA_SN        :PAnsiChar;
       CA_DT_BEFORE :Int64;
       CA_DT_AFTER  :Int64;
    end;
      PTCERT_ATTRIBUTES = ^TCERT_ATTRIBUTES;

    TPEM_To_PKCS12 = packed record
       CERT          :TBuffer;
       PKEY          :TBuffer;
       CA            :TBuffer;
       Password      :PAnsiChar;
       Friendly_Name :PAnsiChar;
    end;
      PPEM_To_PKCS12 = ^TPEM_To_PKCS12;

    TCREATE_REQUEST = packed record
       CommonName    :PAnsiChar;
       Organization  :PAnsiChar;
       OrgUnit       :PAnsiChar;
       Locality      :PAnsiChar;
       State         :PAnsiChar;
       Country       :PAnsiChar;
       EmailAddress  :PAnsiChar;
       Alt_Name      :PAnsiChar;
       RSA_BITS      :NativeInt;
       DIGEST_ALG    :NativeInt;
    end;
      PCREATE_REQUEST = ^TCREATE_REQUEST;

  procedure PKPASS_INIT(); stdcall external 'PKPASS.DLL';
  procedure PKPASS_DONE(); stdcall external 'PKPASS.DLL';

  function EXECUTE_CREATE_PKPASS(CREATE_PKPASS :PCREATE_PKPASS;
  Var PKPASS :TBuffer; out ErrorBuf: PChar):Boolean; stdcall; external 'PKPASS.DLL';

  function EXECUTE_CREATE_APN(PKCS12 :PPKCS12;
  Var APN :TBuffer; out ErrorBuf: PChar):Boolean; stdcall; external 'PKPASS.DLL';

  function EXECUTE_GET_ATTRIBUTES_PKCS12(PKCS12 :PPKCS12;
  CERT_ATTRIBUTES :PTCERT_ATTRIBUTES; out ErrorBuf :PChar):Boolean; stdcall external 'PKPASS.DLL';

  function EXECUTE_GET_ATTRIBUTES_PEM(PEM :PTBuffer;
  CERT_ATTRIBUTES :PTCERT_ATTRIBUTES; out ErrorBuf :PChar):Boolean; stdcall external 'PKPASS.DLL';

  function EXECUTE_CONVERT_PEM_To_PKCS12(PEM_To_PKCS12 :PPEM_To_PKCS12;
  Var PKCS12 :TBuffer; out ErrorBuf :PChar):Boolean; stdcall external 'PKPASS.DLL';

  function EXECUTE_CREATE_CERT_REQUEST(CREATE_CERT_REQUEST :PCREATE_REQUEST;
  Var REQUEST, PKEY :TBuffer; out ErrorBuf :PChar):Boolean; stdcall external 'PKPASS.DLL';

  procedure Pointer_Free(Var P :Pointer; LEN :NativeInt); stdcall external 'PKPASS.DLL';

  {0 VERSION_ALL = 1  ShowMessage(PAnsiChar(GET_SSL_VERSION(1)));}
  function GET_SSL_VERSION(VERSION_ALL :Integer):PAnsiChar; stdcall external 'PKPASS.DLL';



  procedure LoadFile(const FileName :String; Var Buffer :TBuffer);
  procedure SaveFile(const FileName :String; const Buf :Pointer; const Size :NativeInt);
  procedure TBuffer_Free(Var Buffer :TBuffer);
  function TBufferToString(const Buffer: TBuffer):String;
  function GetFileSize(const FileName :String):NativeInt;
  function UDT_ToDateTime(const UDT: Int64):TDateTime;


implementation


procedure LoadFile(const FileName :String; Var Buffer :TBuffer);
var
Handle: NativeInt;
Begin
Buffer.Size:=0;
Buffer.Buf:=Nil;
if FileName.Length = 0 then Exit;

Buffer.Size:=GetFileSize(FileName);
if Buffer.Size = 0 then Exit;

Handle:=FileOpen(FileName, fmOpenRead);
FileSeek(Handle,0,0);
GetMem(Buffer.Buf, Buffer.Size);
FileRead(Handle, Buffer.Buf^, Buffer.Size);
FileClose(Handle);
End;


procedure SaveFile(const FileName :String; const Buf :Pointer; const Size :NativeInt);
var
Handle: NativeInt;
Begin
if (Size  = 0) OR (FileName.Length = 0) OR (Buf = Nil) then Exit;

Handle:=FileCreate(FileName);
FileWrite(Handle, Buf^, Size);
FileClose(Handle);
End;

procedure TBuffer_Free(Var Buffer :TBuffer);
Begin
if (Buffer.Size > 0) And (Buffer.Buf <> Nil) then
FreeMem(Buffer.Buf, Buffer.Size);
Buffer.Buf:=Nil;
Buffer.Size:=0;
End;

function TBufferToString(const Buffer: TBuffer):String;
begin
Result:='';
if Buffer.Size = 0 then Exit;

SetLength(Result, Buffer.Size);
Move(Buffer.Buf^, Pointer(Result)^, Buffer.Size);
end;

function GetFileSize(const FileName :String):NativeInt;
var
Info :TWin32FileAttributeData;
begin
Result:=0;
if not GetFileAttributesEx(PWideChar(FileName), GetFileExInfoStandard, @Info) then Exit;
Result:=Int64(Info.nFileSizeLow) Or Int64(Info.nFileSizeHigh shl 32);
end;

function UDT_ToDateTime(const UDT: Int64):TDateTime;
begin
Result := (UDT / 86400) + 25569;
end;


end.
