unit SobreF;

interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
function Executar
  (const versao: string): boolean;
  begin
    Result:=False;
    Form2:=TForm2.Create(nil);
    try
      Form2.Label1.Caption := versao;
      Form2.ShowModal;
      Result:=Form2.CheckBox1.Checked;
    finally
      FreeAndNil(Form2);
    end;
  end;
  exports
    Executar;

procedure TForm2.Button1Click(Sender: TObject);
begin
    close();
end;
initialization RegisterClass(TForm2);
finalization
 UnRegisterClass(TForm2);
end.

