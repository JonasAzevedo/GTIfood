object DM: TDM
  Height = 484
  Width = 596
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Jonas\GT IFood\Projeto\BD\estoque.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 88
    Top = 32
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorHome = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\'
    VendorLib = 'fbclient.dll'
    Left = 88
    Top = 120
  end
  object DataSetListarMercado: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 360
    Top = 48
  end
  object dsListarMercado: TDataSource
    DataSet = DataSetListarMercado
    Left = 352
    Top = 136
  end
end
