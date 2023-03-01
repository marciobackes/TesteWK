object ServerMethods: TServerMethods
  OldCreateOrder = False
  Height = 376
  Width = 770
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=WK'
      'User_Name=root'
      'Password=1234'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Transaction = FDTransaction
    Left = 80
    Top = 40
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\marci\OneDrive\'#193'rea de Trabalho\TesteWK\Servidor\Win32\' +
      'Debug\libpq.dll'
    Left = 184
    Top = 40
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 368
    Top = 32
  end
  object QryPessoa: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SchemaAdapter = FDSchemaAdapter
    SQL.Strings = (
      
        'select p.idpessoa, p.flnatureza, p.dsdocumento, p.nmprimeiro, p.' +
        'nmsegundo, p.dtregistro, e.dscep'
      'from pessoa p'
      'join endereco e on e.idpessoa = p.idpessoa')
    Left = 80
    Top = 112
    object QryPessoaidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryPessoaflnatureza: TSmallintField
      FieldName = 'flnatureza'
      Origin = 'flnatureza'
    end
    object QryPessoadsdocumento: TWideStringField
      FieldName = 'dsdocumento'
      Origin = 'dsdocumento'
    end
    object QryPessoanmprimeiro: TWideStringField
      FieldName = 'nmprimeiro'
      Origin = 'nmprimeiro'
      Size = 100
    end
    object QryPessoanmsegundo: TWideStringField
      FieldName = 'nmsegundo'
      Origin = 'nmsegundo'
      Size = 100
    end
    object QryPessoadtregistro: TDateField
      FieldName = 'dtregistro'
      Origin = 'dtregistro'
    end
    object QryPessoadscep: TWideStringField
      FieldName = 'dscep'
      Size = 15
    end
  end
  object FDUpdateSQLPessoa: TFDUpdateSQL
    Connection = FDConnection
    InsertSQL.Strings = (
      
        'INSERT INTO pessoa (flnatureza, dsdocumento, nmprimeiro, nmsegun' +
        'do, dtregistro)'
      
        'VALUES (:flnatureza, :dsdocumento, :nmprimeiro, :nmsegundo, :dtr' +
        'egistro)'
      
        'RETURNING idpessoa, flnatureza, dsdocumento, nmprimeiro, nmsegun' +
        'do, dtregistro')
    ModifySQL.Strings = (
      
        'UPDATE pessoa SET flnatureza = :flnatureza, dsdocumento = :dsdoc' +
        'umento, nmprimeiro = :nmprimeiro, nmsegundo = :nmsegundo'
      'WHERE idpessoa = :idpessoa'
      
        'RETURNING idpessoa, flnatureza, dsdocumento, nmprimeiro, nmsegun' +
        'do')
    DeleteSQL.Strings = (
      'DELETE FROM pessoa WHERE idpessoa = :idpessoa')
    FetchRowSQL.Strings = (
      
        'select idpessoa, flnatureza, dsdocumento, nmprimeiro, nmsegundo,' +
        ' dtregistro from pessoa where idpessoa = :idpessoa')
    Left = 80
    Top = 192
  end
  object FDUpdateSQLEndereco: TFDUpdateSQL
    Connection = FDConnection
    InsertSQL.Strings = (
      'INSERT INTO endereco (idendereco, idpessoa, dscep)'
      'VALUES (:idendereco, :idpessoa, :dscep)'
      'RETURNING idendereco, idpessoa, dscep')
    ModifySQL.Strings = (
      'UPDATE endereco SET dscep = :dscep'
      'WHERE idpessoa = :idpessoa'
      'RETURNING idendereco, idpessoa, dscep')
    DeleteSQL.Strings = (
      'DELETE FROM endereco WHERE idpessoa = :idpessoa')
    FetchRowSQL.Strings = (
      
        'select idendereco, idpessoa, dscep from endereco where idpessoa ' +
        '= :idpessoa')
    Left = 224
    Top = 192
  end
  object QryEndereco: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SchemaAdapter = FDSchemaAdapter
    SQL.Strings = (
      
        'select idendereco, idpessoa, dscep from endereco where idpessoa ' +
        '= :idpessoa')
    Left = 184
    Top = 112
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryEnderecoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryEnderecoidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
    end
    object QryEnderecodscep: TWideStringField
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 15
    end
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 344
    Top = 120
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    Left = 568
    Top = 144
  end
end
