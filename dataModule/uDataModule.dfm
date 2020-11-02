object dtm: Tdtm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 368
  Width = 464
  object dbConnection: TFDConnection
    Params.Strings = (
      'Database=C:\contatos\contatos.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Left = 304
    Top = 144
  end
end
