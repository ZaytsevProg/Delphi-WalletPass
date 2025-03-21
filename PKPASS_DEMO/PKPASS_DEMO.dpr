program PKPASS_DEMO;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FMain},
  U_PKPASS in 'U_PKPASS.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
