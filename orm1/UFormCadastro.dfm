object FrPrincipal: TFrPrincipal
  Left = 488
  Top = 219
  BorderStyle = bsDialog
  Caption = 'ORM Aurelius'
  ClientHeight = 368
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 8
    Top = 8
    Width = 522
    Height = 352
    TabOrder = 0
    Tabs.Strings = (
      'Fornecedores'
      'Produtos'
      'Lista')
    TabIndex = 0
    OnChange = TabControl1Change
    object Fornecedores: TGroupBox
      Left = 0
      Top = 22
      Width = 519
      Height = 330
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      TabOrder = 0
      StyleElements = []
      object LabelCidade: TLabel
        Left = 32
        Top = 203
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object LabelEnd: TLabel
        Left = 32
        Top = 176
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object LabelId: TLabel
        Left = 32
        Top = 122
        Width = 10
        Height = 13
        Caption = 'Id'
      end
      object LabelRazaoSocial: TLabel
        Left = 32
        Top = 149
        Width = 60
        Height = 13
        Caption = 'Razao Social'
      end
      object LabelTelefone: TLabel
        Left = 32
        Top = 230
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Novo: TButton
        Left = 263
        Top = 112
        Width = 105
        Height = 35
        Caption = 'Novo'
        TabOrder = 0
        OnClick = NovoClick
      end
      object Pesquisa: TGroupBox
        Left = 24
        Top = 16
        Width = 481
        Height = 73
        Caption = 'Pesquisa'
        TabOrder = 1
        object Por: TRadioGroup
          Left = 207
          Top = 24
          Width = 121
          Height = 41
          Caption = 'Por'
          TabOrder = 0
        end
        object rgCampo: TRadioButton
          Left = 223
          Top = 40
          Width = 57
          Height = 17
          Caption = 'Codigo'
          TabOrder = 1
        end
        object Nome: TRadioButton
          Left = 278
          Top = 40
          Width = 42
          Height = 17
          Caption = 'Nome'
          TabOrder = 2
        end
        object Pesquisar: TButton
          Left = 334
          Top = 24
          Width = 137
          Height = 41
          Caption = 'Pesquisar'
          TabOrder = 3
          OnClick = PesquisarClick
        end
        object pesquisaParametro: TEdit
          Left = 32
          Top = 34
          Width = 169
          Height = 21
          TabOrder = 4
        end
      end
      object Salvar: TButton
        Left = 263
        Top = 154
        Width = 105
        Height = 35
        Caption = 'Salvar'
        TabOrder = 2
        OnClick = SalvarClick
      end
      object Apagar: TButton
        Left = 263
        Top = 239
        Width = 105
        Height = 35
        Caption = 'Apagar'
        TabOrder = 3
        OnClick = ApagarClick
      end
      object Atualizar: TButton
        Left = 263
        Top = 198
        Width = 105
        Height = 35
        Caption = 'Atualizar'
        TabOrder = 4
        OnClick = AtualizarClick
      end
      object EditCidade: TEdit
        Left = 104
        Top = 200
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object EditEnd: TEdit
        Left = 104
        Top = 173
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object EditId: TEdit
        Left = 104
        Top = 119
        Width = 121
        Height = 21
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 7
      end
      object EditRazaoSocial: TEdit
        Left = 104
        Top = 146
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object EditTel: TEdit
        Left = 104
        Top = 227
        Width = 121
        Height = 21
        TabOrder = 9
      end
    end
    object Produtos: TGroupBox
      Left = 0
      Top = 22
      Width = 519
      Height = 331
      TabOrder = 2
      Visible = False
      object Label1: TLabel
        Left = 40
        Top = 211
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object desc: TLabel
        Left = 40
        Top = 184
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label3: TLabel
        Left = 40
        Top = 130
        Width = 10
        Height = 13
        Caption = 'Id'
      end
      object Label4: TLabel
        Left = 40
        Top = 157
        Width = 69
        Height = 13
        Caption = 'ID Fornecedor'
      end
      object Label5: TLabel
        Left = 40
        Top = 238
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object apagarProduto: TButton
        Left = 271
        Top = 247
        Width = 105
        Height = 35
        Caption = 'Apagar'
        TabOrder = 8
        OnClick = ApagarProdClick
      end
      object atualizarProduto: TButton
        Left = 271
        Top = 206
        Width = 105
        Height = 35
        Caption = 'Atualizar'
        TabOrder = 7
        OnClick = AtualizarProdClick
      end
      object qtdProdutos: TEdit
        Left = 112
        Top = 208
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object descProduto: TEdit
        Left = 112
        Top = 181
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object IdProd: TEdit
        Left = 112
        Top = 127
        Width = 121
        Height = 21
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 1
      end
      object valorProduto: TEdit
        Left = 112
        Top = 235
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object novoProduto: TButton
        Left = 271
        Top = 120
        Width = 105
        Height = 35
        Caption = 'Novo'
        TabOrder = 5
        OnClick = NovoClick
      end
      object GroupBox1: TGroupBox
        Left = 21
        Top = 33
        Width = 481
        Height = 73
        Caption = 'Pesquisa'
        TabOrder = 0
        object RadioGroup1: TRadioGroup
          Left = 192
          Top = 24
          Width = 136
          Height = 41
          Caption = 'Por'
          TabOrder = 0
        end
        object radCodProd: TRadioButton
          Left = 198
          Top = 40
          Width = 50
          Height = 17
          Caption = 'Codigo'
          TabOrder = 2
        end
        object radProdDesc: TRadioButton
          Left = 254
          Top = 40
          Width = 66
          Height = 17
          Caption = 'Descri'#231#227'o'
          TabOrder = 3
        end
        object pesquisarProduto: TButton
          Left = 334
          Top = 24
          Width = 137
          Height = 41
          Caption = 'Pesquisar'
          TabOrder = 4
          OnClick = PesquisarProdClick
        end
        object pParametroProd: TEdit
          Left = 17
          Top = 34
          Width = 169
          Height = 21
          TabOrder = 1
        end
      end
      object salvarProduto: TButton
        Left = 271
        Top = 162
        Width = 105
        Height = 35
        Caption = 'Salvar'
        TabOrder = 6
        OnClick = SalvarProdClick
      end
      object IdFornec: TComboBox
        Left = 112
        Top = 153
        Width = 121
        Height = 21
        TabOrder = 9
      end
    end
    object Listar: TButton
      Left = 390
      Top = 301
      Width = 115
      Height = 34
      Caption = 'Listar'
      TabOrder = 1
      Visible = False
      OnClick = ListarClick
    end
    object Lista: TStringGrid
      Left = 0
      Top = 25
      Width = 519
      Height = 238
      TabOrder = 3
      Visible = False
      ColWidths = (
        64
        113
        89
        88
        86)
    end
  end
end
