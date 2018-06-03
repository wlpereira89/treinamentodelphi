unit Unit1;

interface
    procedure ExibirMensagem(texto:string);
      implementation
      uses Vcl.Dialogs;
      procedure ExibirMensagem(texto:string);
      begin
        ShowMessage(texto);
      end;
end.
