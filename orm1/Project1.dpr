program Project1;

uses
  Vcl.Forms,
  UFormCadastro in 'UFormCadastro.pas' {FrPrincipal} ,
  UEntidades in 'UEntidades.pas',
  UConexao in 'UConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrPrincipal, FrPrincipal);
  Application.Run;

end.
