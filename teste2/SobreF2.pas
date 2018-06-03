unit SobreF2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FormSobreBaseU;

type
  TSobre2F = class(TFormSobreBaseF)
    Button1: TButton;
    chkVerificarAtualizacoes: TCheckBox;
    labelVersao: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    procedure SetaNumeroVersao(Numero: string); override;
    function UsuarioMarcouAtualizao: Boolean; override;
    { Public declarations }
  end;

var
  Sobre2F: TSobre2F;

implementation

{$R *.dfm}
function Executar
  (const versao: string): boolean;
  begin
    Result:=False;
    Sobre2F:=TSobre2F.Create(nil);
    try
      Sobre2F.labelVersao.Caption := versao;
      Sobre2F.ShowModal;
      Result:=Sobre2F.chkVerificarAtualizacoes.Checked;
    finally
      FreeAndNil(Sobre2F);
    end;
  end;
  exports
    Executar;

procedure TSobre2F.Button1Click(Sender: TObject);
begin
  close();
end;
procedure TSobre2F.SetaNumeroVersao(Numero: string);
begin
inherited;
  labelVersao.Caption := Numero;
end;
function TSobre2F.UsuarioMarcouAtualizao: Boolean;
begin
Result := chkVerificarAtualizacoes.Checked;
end;

initialization RegisterClass(TSobre2F);
finalization
 UnRegisterClass(TSobre2F);
end.
