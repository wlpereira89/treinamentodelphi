object Sobre2F: TSobre2F
  Left = 0
  Top = 0
  Caption = 'Sobre'
  ClientHeight = 157
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object labelVersao: TLabel
    Left = 317
    Top = 24
    Width = 95
    Height = 22
    Caption = 'labelVersao'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 24
    Width = 284
    Height = 22
    Caption = 'Este '#233' aplicativo de teste de vers'#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 337
    Top = 124
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = Button1Click
  end
  object chkVerificarAtualizacoes: TCheckBox
    Left = 24
    Top = 80
    Width = 212
    Height = 17
    Caption = 'Verificacar atualiza'#231#245'es ao iniciar'
    TabOrder = 1
  end
end
