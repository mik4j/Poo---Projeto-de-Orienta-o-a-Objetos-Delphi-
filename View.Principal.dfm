object FCadastro: TFCadastro
  Left = 0
  Top = 0
  ParentCustomHint = False
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FCadastro'
  ClientHeight = 211
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblFuncao: TLabel
    Left = 8
    Top = 38
    Width = 39
    Height = 13
    Caption = 'Fun'#231#227'o:'
  end
  object lblNome: TLabel
    Left = 8
    Top = 9
    Width = 34
    Height = 13
    Caption = 'Nome: '
  end
  object lblSalario: TLabel
    Left = 215
    Top = 38
    Width = 36
    Height = 13
    Caption = 'Sal'#225'rio:'
  end
  object lblBonus: TLabel
    Left = 350
    Top = 38
    Width = 33
    Height = 13
    Caption = 'B'#244'nus:'
  end
  object cbFuncao: TComboBox
    Left = 48
    Top = 35
    Width = 155
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Administrativo'
    OnChange = cbFuncaoChange
    Items.Strings = (
      'Administrativo'
      'Vendedor'
      'Funcionario')
  end
  object edtNome: TEdit
    Left = 48
    Top = 8
    Width = 406
    Height = 21
    TabOrder = 1
  end
  object edtSalario: TEdit
    Left = 258
    Top = 35
    Width = 65
    Height = 21
    TabOrder = 2
  end
  object edtBonus: TEdit
    Left = 389
    Top = 35
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object btnCadasrar: TButton
    Left = 8
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = btnCadasrarClick
  end
  object btnanterior: TButton
    Left = 375
    Top = 71
    Width = 35
    Height = 25
    Caption = '<<'
    Enabled = False
    TabOrder = 5
    OnClick = btnanteriorClick
  end
  object btnproximo: TButton
    Left = 419
    Top = 71
    Width = 35
    Height = 25
    Caption = '>>'
    Enabled = False
    TabOrder = 6
    OnClick = btnproximoClick
  end
  object mmCalculo: TMemo
    Left = 8
    Top = 102
    Width = 446
    Height = 91
    TabOrder = 7
  end
  object btnCalcular: TButton
    Left = 94
    Top = 71
    Width = 99
    Height = 25
    Caption = 'Calcular Sal'#225'rio'
    TabOrder = 8
    OnClick = btnCalcularClick
  end
end
