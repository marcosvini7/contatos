object formNovo: TformNovo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Novo Contato'
  ClientHeight = 329
  ClientWidth = 331
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 8
    Top = 192
    Width = 63
    Height = 27
    Caption = 'E-mail:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 24
    Width = 60
    Height = 27
    Caption = 'Nome:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object StaticText3: TStaticText
    Left = 8
    Top = 104
    Width = 83
    Height = 27
    Caption = 'Telefone:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object editNome: TEdit
    Left = 8
    Top = 69
    Width = 309
    Height = 29
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Yu Gothic'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 3
  end
  object editTelefone: TEdit
    Left = 8
    Top = 149
    Width = 309
    Height = 29
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Yu Gothic'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 4
  end
  object editEmail: TEdit
    Left = 8
    Top = 237
    Width = 309
    Height = 29
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Yu Gothic'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 5
  end
  object btnSalvar: TBitBtn
    Left = 8
    Top = 280
    Width = 309
    Height = 31
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF6B3B3B6B3B3B9191918F8F8F8C8C8C89
      89898787878383838080817E7E7E6B3B3B6B3B3B6B3B3BFF00FFFF00FF6B3B3B
      CF6F0ACB6A0AF7F7F7C2620ABE5E0ADEDEDED3D3D3C8C8C8BEBEBEB4B3B3A847
      0AA4440A6B3B3BFF00FFFF00FF6B3B3BD3730AD06F0AFBFBFBC6650AC1620AE4
      E4E4DADAD9D0D0CFC4C4C5BABBBAAB4B0AA7470A6B3B3BFF00FFFF00FF6B3B3B
      D7770AD3730AFCFCFCCB6A0AC6660AE9EAE9E1E1E1D5D6D6CCCBCBC0C0C0AD4E
      0AAB4A0A6B3B3BFF00FFFF00FF6B3B3BDC7B0AD6760AEDCBA5FCFCFCF7F7F7EF
      EFEFE6E6E6DCDDDCD2D1D1C09E83B1500AAE4E0A6B3B3BFF00FFFF00FF6B3B3B
      DF7E0ADB7B0AD7760AD3730ACF6F0ACA690AC5650AC2610ABE5D0AB9590AB555
      0AB1510A6B3B3BFF00FFFF00FF6B3B3BE3830ADF7F0ADB7A0AD7760AD2730ACF
      6E0ACA690AC6650AC1620ABD5D0AB9590AB5540A6B3B3BFF00FFFF00FF6B3B3B
      E7870AFCF6EAFBF4E4FCF1E0FBEEDAFCEDD4FCEAD0FBE8CAFBE5C4FBE4C0FBE3
      BCB9580A6B3B3BFF00FFFF00FF6B3B3BEA890AEDEAE5E9E5DFE5E1D8E1DBD2DD
      D7CBDAD1C4D7CEBFD4CAB9D1C6B4CFC2AEBD5D0A6B3B3BFF00FFFF00FF6B3B3B
      EE8D0AFCF8F1FCF7ECFCF5E7FCF2E2FCF0DDFBEDD7FBEBD1FCE9CCFCE6C6FBE5
      C1C1610A6B3B3BFF00FFFF00FF6B3B3BF1900AF1EFECEDEAE6E9E5E1E5E1D9E2
      DCD2DED7CCDAD2C6D7CEBFD4CABAD1C6B5C5640A6B3B3BFF00FFFF00FF6B3B3B
      F4930AFCFAF7FCF8F3FCF7EEFCF6E9FCF3E4FCF1DEFCEED9FBECD3FCEACFFCE7
      C8C9690A6B3B3BFF00FFFF00FF6B3B3BF7960AACAAFBA0A2FA959AF98993F87E
      8CF77485F6697FF56178F35874F2516EF0CE6E0A6B3B3BFF00FFFF00FF6B3B3B
      6B3B3B2D2BB4292AB42627B42125B41E22B41920B4171EB4141CB4111AB40E19
      B46B3B3B6B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentFont = False
    TabOrder = 6
    OnClick = btnSalvarClick
  end
end
