program prjGTIfood;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  uConfigINI in 'uConfigINI.pas',
  uConfigComponentes in 'uConfigComponentes.pas',
  unDM in 'unDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
