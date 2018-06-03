unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FormSobreBaseU;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  minhaPackage: HModule;
  FuncaoExecutar: function(const versao): boolean;

begin

  minhaPackage := LoadPackage(ExtractFilePath(ParamStr(0)) + 'MinhaBPLXE2.bpl');
  if minhaPackage <> 0 then
    try
      @FuncaoExecutar := GetProcAddress(minhaPackage, 'Executar');
      if Assigned(FuncaoExecutar) then
      begin
        if FuncaoExecutar('1.0') = True then
          ShowMessage('Vamos atualizar ao iniciar')
        else
          ShowMessage('Não vamos atualizar ao iniciar');
      end
      else
      begin
        ShowMessage('Função Executar não encontrada');
      end;
    finally
      UnloadPackage(minhaPackage);
    end
  else
    ShowMessage('BPL Package1 não encontrada');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  minhaPackage: HModule;
  versao: string;
  APersistentClass: TPersistentClass;
  sClassName: string;
  AForm: TFormSobreBaseF;
begin
  versao := '2.0';
  sClassName := 'TSobre2F';
  minhaPackage := LoadPackage(ExtractFilePath(ParamStr(0)) +
    'MinhaBPLXE2.bpl');
  if minhaPackage <> 0 then
    try
      APersistentClass := GetClass(sClassName);
      if APersistentClass = nil then
        raise Exception.Create('Classe não localizada!')
      else
      begin
        AForm := TFormSobreBaseF(TComponentClass(APersistentClass).Create(nil));
        AForm.SetaNumeroVersao(versao);
        AForm.ShowModal;
        if AForm.UsuarioMarcouAtualizao then
          ShowMessage('Vamos atualizar ao iniciar ')
        else
          ShowMessage('Não vamos atualizar ao iniciar ');
        FreeAndNil(AForm);
      end;
    finally
      UnloadPackage(minhaPackage);
    end;
end;

end.
