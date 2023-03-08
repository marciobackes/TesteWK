object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'FormPrincipal'
  ClientHeight = 552
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 56
    Width = 48
    Height = 13
    Caption = 'ID Pessoa'
  end
  object Label2: TLabel
    Left = 68
    Top = 83
    Width = 44
    Height = 13
    Caption = 'Natureza'
  end
  object Label3: TLabel
    Left = 44
    Top = 110
    Width = 68
    Height = 13
    Caption = 'Primeiro Nome'
  end
  object Label4: TLabel
    Left = 40
    Top = 137
    Width = 72
    Height = 13
    Caption = 'Segundo Nome'
  end
  object Label5: TLabel
    Left = 58
    Top = 164
    Width = 54
    Height = 13
    Caption = 'Documento'
  end
  object Label6: TLabel
    Left = 93
    Top = 191
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label7: TLabel
    Left = 99
    Top = 218
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label8: TLabel
    Left = 79
    Top = 245
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label9: TLabel
    Left = 84
    Top = 272
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label10: TLabel
    Left = 57
    Top = 299
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object Label11: TLabel
    Left = 47
    Top = 326
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object ButtonInserir: TButton
    Left = 100
    Top = 360
    Width = 85
    Height = 33
    Caption = 'Inserir'
    TabOrder = 12
    OnClick = ButtonInserirClick
  end
  object ButtonDeletar: TButton
    Left = 191
    Top = 360
    Width = 85
    Height = 33
    Caption = 'Deletar'
    TabOrder = 13
    OnClick = ButtonDeletarClick
  end
  object Memo: TMemo
    Left = 0
    Top = 399
    Width = 618
    Height = 153
    Align = alBottom
    Lines.Strings = (
      'Memo')
    ScrollBars = ssVertical
    TabOrder = 17
    ExplicitLeft = 8
    ExplicitTop = 272
    ExplicitWidth = 816
  end
  object ButtonUpdate: TButton
    Left = 282
    Top = 360
    Width = 87
    Height = 33
    Caption = 'Update'
    TabOrder = 14
    OnClick = ButtonUpdateClick
  end
  object ButtonInserirLote: TButton
    Left = 375
    Top = 360
    Width = 85
    Height = 33
    Caption = 'Inserir Lote'
    TabOrder = 15
    OnClick = ButtonInserirLoteClick
  end
  object EditIdPessoa: TDBEdit
    Left = 118
    Top = 53
    Width = 154
    Height = 21
    DataField = 'idpessoa'
    DataSource = DataSource
    TabOrder = 1
  end
  object EditPrimeiroNome: TDBEdit
    Left = 118
    Top = 107
    Width = 443
    Height = 21
    DataField = 'nmprimeiro'
    DataSource = DataSource
    TabOrder = 3
  end
  object EditSegundoNome: TDBEdit
    Left = 118
    Top = 134
    Width = 443
    Height = 21
    DataField = 'nmsegundo'
    DataSource = DataSource
    TabOrder = 4
  end
  object EditDocumento: TDBEdit
    Left = 118
    Top = 161
    Width = 154
    Height = 21
    DataField = 'dsdocumento'
    DataSource = DataSource
    TabOrder = 5
  end
  object ComboBoxNatureza: TComboBox
    Left = 118
    Top = 80
    Width = 154
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = 'F'#237'sica'
    OnChange = ComboBoxNaturezaChange
    Items.Strings = (
      'F'#237'sica'
      'Jur'#237'dica')
  end
  object EditCep: TDBEdit
    Left = 118
    Top = 188
    Width = 154
    Height = 21
    DataField = 'dscep'
    DataSource = DataSource
    TabOrder = 6
  end
  object DBNavigator1: TDBNavigator
    Left = 64
    Top = 8
    Width = 205
    Height = 39
    DataSource = DataSource
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
    TabOrder = 0
  end
  object EditUF: TDBEdit
    Left = 118
    Top = 215
    Width = 442
    Height = 21
    DataField = 'dsuf'
    DataSource = DataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 7
  end
  object EditCidade: TDBEdit
    Left = 118
    Top = 242
    Width = 442
    Height = 21
    DataField = 'nmcidade'
    DataSource = DataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 8
  end
  object EditBairro: TDBEdit
    Left = 118
    Top = 269
    Width = 442
    Height = 21
    DataField = 'nmbairro'
    DataSource = DataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 9
  end
  object EditLogradouro: TDBEdit
    Left = 118
    Top = 296
    Width = 442
    Height = 21
    DataField = 'nmlogradouro'
    DataSource = DataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 10
  end
  object EditComplemento: TDBEdit
    Left = 118
    Top = 323
    Width = 442
    Height = 21
    DataField = 'dscomplemento'
    DataSource = DataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 11
  end
  object ButtonAtualizar: TButton
    Left = 466
    Top = 360
    Width = 85
    Height = 33
    Caption = 'Atualizar dados'
    TabOrder = 16
    OnClick = ButtonAtualizarClick
  end
  object OpenDialog1: TOpenDialog
    Left = 560
    Top = 72
  end
  object FDMemTable: TFDMemTable
    AfterScroll = FDMemTableAfterScroll
    FieldDefs = <
      item
        Name = 'idpessoa'
        DataType = ftInteger
      end
      item
        Name = 'flnatureza'
        DataType = ftInteger
      end
      item
        Name = 'dsdocumento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'nmprimeiro'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nmsegundo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dscep'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'dsuf'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nmcidade'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nmbairro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nmlogradouro'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dscomplemento'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 448
    Top = 168
    object FDMemTableidpessoa: TIntegerField
      FieldName = 'idpessoa'
    end
    object FDMemTableflnatureza: TIntegerField
      FieldName = 'flnatureza'
    end
    object FDMemTabledsdocumento: TStringField
      FieldName = 'dsdocumento'
      EditMask = '999.999.999-99;0'
    end
    object FDMemTablenmprimeiro: TStringField
      FieldName = 'nmprimeiro'
      Size = 100
    end
    object FDMemTablenmsegundo: TStringField
      FieldName = 'nmsegundo'
      Size = 100
    end
    object FDMemTabledscep: TStringField
      FieldName = 'dscep'
      EditMask = '99999-999;0;'
      Size = 15
    end
    object FDMemTabledsuf: TStringField
      FieldName = 'dsuf'
      Size = 50
    end
    object FDMemTablenmcidade: TStringField
      FieldName = 'nmcidade'
      Size = 100
    end
    object FDMemTablenmbairro: TStringField
      FieldName = 'nmbairro'
      Size = 50
    end
    object FDMemTablenmlogradouro: TStringField
      FieldName = 'nmlogradouro'
      Size = 100
    end
    object FDMemTabledscomplemento: TStringField
      FieldName = 'dscomplemento'
      Size = 100
    end
  end
  object DataSource: TDataSource
    DataSet = FDMemTable
    Left = 384
    Top = 168
  end
end
