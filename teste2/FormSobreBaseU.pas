unit FormSobreBaseU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFormSobreBaseF = class(TForm)
  private
    { Private declarations }
  public
    procedure SetaNumeroVersao(Numero: string); virtual; abstract;
    function UsuarioMarcouAtualizao: Boolean; virtual; abstract;
    { Public declarations }
  end;

var
  FormSobreBaseF: TFormSobreBaseF;

implementation

{$R *.dfm}

end.
