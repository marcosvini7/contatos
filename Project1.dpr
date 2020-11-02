program Project1;

uses
  Vcl.Forms,
  uPrincipal in 'units\uPrincipal.pas' {formPrincipal},
  uDataModule in 'dataModule\uDataModule.pas' {dtm: TDataModule},
  uContatosDAO in 'classes\uContatosDAO.pas',
  uNovoContato in 'units\uNovoContato.pas' {formNovo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
