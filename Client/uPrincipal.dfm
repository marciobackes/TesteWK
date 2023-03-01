object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 429
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 24
    Width = 48
    Height = 13
    Caption = 'ID Pessoa'
  end
  object Label2: TLabel
    Left = 68
    Top = 51
    Width = 44
    Height = 13
    Caption = 'Natureza'
  end
  object Label3: TLabel
    Left = 44
    Top = 78
    Width = 68
    Height = 13
    Caption = 'Primeiro Nome'
  end
  object Label4: TLabel
    Left = 40
    Top = 105
    Width = 72
    Height = 13
    Caption = 'Segundo Nome'
  end
  object Label5: TLabel
    Left = 58
    Top = 132
    Width = 54
    Height = 13
    Caption = 'Documento'
  end
  object Label6: TLabel
    Left = 93
    Top = 159
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object ButtonInserir: TButton
    Left = 68
    Top = 200
    Width = 85
    Height = 33
    Caption = 'Inserir'
    TabOrder = 0
    OnClick = ButtonInserirClick
  end
  object ButtonDeletar: TButton
    Left = 159
    Top = 200
    Width = 85
    Height = 33
    Caption = 'Deletar'
    TabOrder = 1
    OnClick = ButtonDeletarClick
  end
  object Memo: TMemo
    Left = 8
    Top = 239
    Width = 809
    Height = 186
    Lines.Strings = (
      'Memo')
    TabOrder = 2
  end
  object EditIdPessoa: TEdit
    Left = 118
    Top = 21
    Width = 155
    Height = 21
    TabOrder = 3
  end
  object ComboBoxNatureza: TComboBox
    Left = 118
    Top = 48
    Width = 155
    Height = 21
    ItemIndex = 0
    TabOrder = 4
    Text = 'F'#237'sica'
    OnChange = ComboBoxNaturezaChange
    Items.Strings = (
      'F'#237'sica'
      'Jur'#237'dica')
  end
  object EditPrimeiroNome: TEdit
    Left = 118
    Top = 75
    Width = 307
    Height = 21
    TabOrder = 5
  end
  object EditSegundoNome: TEdit
    Left = 118
    Top = 102
    Width = 307
    Height = 21
    TabOrder = 6
  end
  object EditDocumento: TMaskEdit
    Left = 118
    Top = 129
    Width = 154
    Height = 21
    EditMask = '999.999.999-99;0'
    MaxLength = 14
    TabOrder = 7
    Text = ''
  end
  object EditCep: TMaskEdit
    Left = 118
    Top = 156
    Width = 154
    Height = 21
    EditMask = '99999-999;0;'
    MaxLength = 9
    TabOrder = 8
    Text = ''
  end
  object ButtonUpdate: TButton
    Left = 250
    Top = 200
    Width = 87
    Height = 33
    Caption = 'Update'
    TabOrder = 9
    OnClick = ButtonUpdateClick
  end
  object ButtonInserirLote: TButton
    Left = 343
    Top = 200
    Width = 85
    Height = 33
    Caption = 'Inserir Lote'
    TabOrder = 10
    OnClick = ButtonInserirLoteClick
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/datasnap/rest/TServerMethods/Pessoa'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 320
    Top = 24
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Method = rmPUT
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 392
    Top = 24
  end
  object RESTResponse: TRESTResponse
    Left = 464
    Top = 24
  end
  object OpenDialog1: TOpenDialog
    Left = 680
    Top = 56
  end
end
