unit UFormCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UEntidades, UConexao, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXPanels, Aurelius.Drivers.Interfaces,
  Aurelius.Engine.ObjectManager, Aurelius.Criteria.Linq, Vcl.Grids;

type
  TFrPrincipal = class(TForm)
    TabControl1: TTabControl;
    Fornecedores: TGroupBox;
    LabelCidade: TLabel;
    LabelEnd: TLabel;
    LabelId: TLabel;
    LabelRazaoSocial: TLabel;
    LabelTelefone: TLabel;
    Novo: TButton;
    Pesquisa: TGroupBox;
    Por: TRadioGroup;
    rgCampo: TRadioButton;
    Nome: TRadioButton;
    Pesquisar: TButton;
    pesquisaParametro: TEdit;
    Salvar: TButton;
    Apagar: TButton;
    Atualizar: TButton;
    EditCidade: TEdit;
    EditEnd: TEdit;
    EditId: TEdit;
    EditRazaoSocial: TEdit;
    EditTel: TEdit;
    Listar: TButton;
    Produtos: TGroupBox;
    apagarProduto: TButton;
    atualizarProduto: TButton;
    qtdProdutos: TEdit;
    descProduto: TEdit;
    IdProd: TEdit;
    valorProduto: TEdit;
    Label1: TLabel;
    desc: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    novoProduto: TButton;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    radCodProd: TRadioButton;
    radProdDesc: TRadioButton;
    pesquisarProduto: TButton;
    pParametroProd: TEdit;
    salvarProduto: TButton;
    IdFornec: TComboBox;
    Lista: TStringGrid;
    procedure TabControl1Change(Sender: TObject);
    procedure NovoClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure PesquisarClick(Sender: TObject);
    procedure AtualizarClick(Sender: TObject);
    procedure ApagarClick(Sender: TObject);
    procedure ListarClick(Sender: TObject);
    procedure SalvarProdClick(Sender: TObject);
    procedure PesquisarProdClick(Sender: TObject);
    procedure AtualizarProdClick(Sender: TObject);
    procedure ApagarProdClick(Sender: TObject);

  private

    { Private declarations }
  public
    function GetConexaoAtual: IDBConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    constructor Create;
    destructor Destroy;
    { Public declarations }
  end;

var
  FrPrincipal: TFrPrincipal;
  GerenciadorFornecedores: TObjectManager;
  GerenciadorProdutos: TObjectManager;
  FFornecedorAtual: TFornecedor;
  FProdutoAtual: TProduto;

implementation

{$R *.dfm}

procedure TFrPrincipal.ApagarClick(Sender: TObject);
begin
  if FFornecedorAtual <> nil then
  begin
    GerenciadorFornecedores.Remove(FFornecedorAtual);
    GerenciadorFornecedores.Flush;
    Novo.Click;
    ShowMessage('Fornecedor excluído com êxito!');
  end
  else
    ShowMessage('Selecione um fornecedor para excluir ultilizando a pesquisa');
end;

procedure TFrPrincipal.AtualizarClick(Sender: TObject);
begin
  if FFornecedorAtual <> nil then
  begin
    FFornecedorAtual.RazaoSocial := EditRazaoSocial.Text;
    FFornecedorAtual.Endereco := EditEnd.Text;
    FFornecedorAtual.Cidade := EditCidade.Text;
    FFornecedorAtual.Telefone := EditTel.Text;
    try
      GerenciadorFornecedores.OwnsObjects := False;
      GerenciadorFornecedores.Update(FFornecedorAtual);
      GerenciadorFornecedores.Flush;
      ShowMessage('Fornecedor gravado com êxito!');
    except
      ShowMessage('Houve um erro ao gravar!');
    end;
  end
  else
    ShowMessage('Selecione um fornecedor para alterar ultilizando a pesquisa');
end;

constructor TFrPrincipal.Create;
begin
  FormCreate(TObject.Create);
end;

destructor TFrPrincipal.Destroy;
begin
  FormDestroy(TObject.Create);
end;

function TFrPrincipal.GetConexaoAtual: IDBConnection;
begin
  Result := TGerenciadorConexao.GetInstancia.Conexao;
end;

procedure TFrPrincipal.ListarClick(Sender: TObject);
var
  ListaProdutos: TList<TProduto>;
  ProdutoTemp: TProduto;
  i, j: Integer;
begin
  if FFornecedorAtual <> nil then
  begin
    for i := 0 to Lista.RowCount - 1 do
      for j := 0 to Lista.ColCount - 1 do
        Lista.Cells[j, i] := '';
    with Lista do
    begin
      RowCount := 2;
      Cells[0, 0] := 'Id';
      Cells[1, 0] := 'Descrição';
      Cells[2, 0] := 'Quantidade';
      Cells[3, 0] := 'Valor';
    end;
    try
      ListaProdutos := GerenciadorProdutos.CreateCriteria<TProduto>.Where
        (TLinq.Eq('Idfornecedor', FFornecedorAtual.Id)).List;
      if ListaProdutos.Count > 0 then
      begin
        Lista.RowCount := ListaProdutos.Count + 1;
        for i := 0 to ListaProdutos.Count - 1 do
        begin
          ProdutoTemp := ListaProdutos[i];
          Lista.Cols[0].Objects[i + 1] := ProdutoTemp;
          Lista.Cells[0, i + 1] := IntToStr(ProdutoTemp.Id);
          Lista.Cells[1, i + 1] := ProdutoTemp.Descricao;
          Lista.Cells[2, i + 1] := FormatFloat('0.00', ProdutoTemp.Quantidade);
          Lista.Cells[3, i + 1] := FormatFloat('0.00', ProdutoTemp.Valor);
        end;
      end;
    finally
      ListaProdutos.Free;
    end;
  end
  else
    ShowMessage('Selecione um fornecedor!');
end;

procedure TFrPrincipal.NovoClick(Sender: TObject);
var
  i: Integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if Components[i].ClassType = TEdit then
      TEdit(Components[i]).Clear;
  IdFornec.Text := '';
  FFornecedorAtual := nil;
  FProdutoAtual := nil;
end;

procedure TFrPrincipal.PesquisarClick(Sender: TObject);
begin
  if Trim(pesquisaParametro.Text) <> '' then
  begin
    try
      GerenciadorFornecedores.OwnsObjects := False;
      if rgCampo.Checked then
      begin
        FFornecedorAtual := GerenciadorFornecedores.Find<TFornecedor>
          (StrToInt(pesquisaParametro.Text));
      end
      else if Nome.Checked then
      begin
        FFornecedorAtual := GerenciadorFornecedores.CreateCriteria<TFornecedor>.
          Where(TLinq.Like('Razaosocial', pesquisaParametro.Text)).List[0];
      end
      else
        ShowMessage('Selecione um critério');
      if FFornecedorAtual <> nil then
      begin
        EditId.Text := IntToStr(FFornecedorAtual.Id);
        EditRazaoSocial.Text := FFornecedorAtual.RazaoSocial;
        EditEnd.Text := FFornecedorAtual.Endereco;
        EditCidade.Text := FFornecedorAtual.Cidade;
        EditTel.Text := FFornecedorAtual.Telefone;
      end
      else
        ShowMessage('O Fornecedor não foi encontrado!');
    except
      ShowMessage('Houve um erro!');
    end;
  end;

end;

procedure TFrPrincipal.SalvarClick(Sender: TObject);
var
  Fornecedor: TFornecedor;
begin
  Fornecedor := TFornecedor.Create;
  Fornecedor.RazaoSocial := EditRazaoSocial.Text;
  Fornecedor.Endereco := EditEnd.Text;
  Fornecedor.Cidade := EditCidade.Text;
  Fornecedor.Telefone := EditTel.Text;
  try
    GerenciadorFornecedores.Save(Fornecedor);
    GerenciadorFornecedores.Flush;
    EditId.Text := IntToStr(Fornecedor.Id);
    FFornecedorAtual := Fornecedor;
    ShowMessage('Fornecedor gravado com êxito!');
  except
    ShowMessage('Houve um erro ao gravar!');
  end;
end;

procedure TFrPrincipal.FormCreate(Sender: TObject);
begin
  GerenciadorFornecedores := TObjectManager.Create(GetConexaoAtual);
  GerenciadorProdutos := TObjectManager.Create(GetConexaoAtual);
end;

procedure TFrPrincipal.FormDestroy(Sender: TObject);
begin
  GerenciadorFornecedores.Free;
  GerenciadorProdutos.Free;
end;

procedure TFrPrincipal.TabControl1Change(Sender: TObject);
var
  ListaFornecedores: TList<TFornecedor>;
  FornecedorTemp: TFornecedor;
  i: Integer;
begin
  if TabControl1.TabIndex = 0 then
    Fornecedores.Show
  else
    Fornecedores.Hide;
  if TabControl1.TabIndex = 1 then
  begin
    Produtos.Show;
    ListaFornecedores := GerenciadorProdutos.CreateCriteria<TFornecedor>.List;
    IdFornec.AddItem('', nil);
    for i := 0 to ListaFornecedores.Count - 1 do
      IdFornec.AddItem(ListaFornecedores[i].Id.ToString, ListaFornecedores[i]);
  end
  else
  begin
    Produtos.Hide;
  end;

  if TabControl1.TabIndex = 2 then
  begin
    Lista.Show;
    Listar.Show;
  end
  else
  begin
    Lista.Hide;
    Listar.Hide;
  end;

end;

procedure TFrPrincipal.SalvarProdClick(Sender: TObject);
var
  Produto: TProduto;
  flag: boolean;
begin
  Produto := TProduto.Create;
  try
    Produto.Idfornecedor := StrToInt(IdFornec.Text);
  except

  end;
  flag := True;
  Produto.Descricao := descProduto.Text;
  try
    Produto.Quantidade := strtofloat(qtdProdutos.Text);
  except
    if qtdProdutos.Text <> '' then
    begin
      ShowMessage('Quantidade invalida, use o formato 0000,00');
      flag := False;
    end;
  end;
  try
    Produto.Valor := strtofloat(valorProduto.Text);
  except
    if valorProduto.Text <> '' then
    begin
      ShowMessage('Valor invalido, use o formato 0000,00');
      flag := False;
    end;
  end;
  if flag then
    try

      GerenciadorFornecedores.Save(Produto);
      GerenciadorFornecedores.Flush;
      IdProd.Text := IntToStr(Produto.Id);
      FProdutoAtual := Produto;
      ShowMessage('Produto gravado com êxito!');
    except
      ShowMessage('Houve um erro ao gravar!');
    end;
end;

procedure TFrPrincipal.PesquisarProdClick(Sender: TObject);
begin
  if Trim(pParametroProd.Text) <> '' then
  begin
    try
      GerenciadorFornecedores.OwnsObjects := False;
      if radCodProd.Checked then
      begin
        FProdutoAtual := GerenciadorFornecedores.Find<TProduto>
          (StrToInt(pParametroProd.Text));
      end
      else if radProdDesc.Checked then
      begin
        FProdutoAtual := GerenciadorFornecedores.CreateCriteria<TProduto>.Where
          (TLinq.Like('Descricao', pParametroProd.Text)).List[0];
      end
      else
        ShowMessage('Selecione um critério');
      if FProdutoAtual <> nil then
      begin
        IdProd.Text := IntToStr(FProdutoAtual.Id);
        if FProdutoAtual.Idfornecedor <> 0 then
          IdFornec.Text := IntToStr(FProdutoAtual.Idfornecedor)
        else
          IdFornec.Text := '';
        descProduto.Text := FProdutoAtual.Descricao;
        qtdProdutos.Text := floattoStr(FProdutoAtual.Quantidade);
        valorProduto.Text := floattoStr(FProdutoAtual.Valor);
      end
      else
        ShowMessage('O Produto não foi encontrado!');
    except
      ShowMessage('Houve um erro!');
    end;
  end;

end;

procedure TFrPrincipal.AtualizarProdClick(Sender: TObject);
var
  flag: boolean;
begin
  if FProdutoAtual <> nil then
  begin
    try
      FProdutoAtual.Idfornecedor := StrToInt(IdFornec.Text);
    except

    end;
    flag := True;
    FProdutoAtual.Descricao := descProduto.Text;
    try
      FProdutoAtual.Quantidade := strtofloat(qtdProdutos.Text);
    except
      if qtdProdutos.Text <> '' then
      begin
        ShowMessage('Quantidade invalida, use o formato 0000,00');
        flag := False;
      end;
    end;
    try
      FProdutoAtual.Valor := strtofloat(valorProduto.Text);
    except
      if valorProduto.Text <> '' then
      begin
        ShowMessage('Valor invalido, use o formato 0000,00');
        flag := False;
      end;
    end;
    if flag then

      try
        GerenciadorFornecedores.OwnsObjects := False;
        GerenciadorFornecedores.Update(FProdutoAtual);
        GerenciadorFornecedores.Flush;
        ShowMessage('Fornecedor gravado com êxito!');
      except
        ShowMessage('Houve um erro ao gravar!');
      end;
  end
  else
    ShowMessage('Selecione um produto para alterar ultilizando a pesquisa');
end;

procedure TFrPrincipal.ApagarProdClick(Sender: TObject);
begin
  if FProdutoAtual <> nil then
  begin
    GerenciadorFornecedores.Remove(FProdutoAtual);
    GerenciadorFornecedores.Flush;
    Novo.Click;
    ShowMessage('Produto excluído com êxito!');
  end
  else
    ShowMessage('Selecione um produto para excluir ultilizando a pesquisa');
end;

initialization

TFrPrincipal.Create;

end.
