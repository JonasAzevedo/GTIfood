unit uConfigINI;

interface

uses
  System.SysUtils,
  System.IniFiles;

type
  TApiType = (atMerchant, atGroceries);
  TAuthorizationType = (ctCentralized, ctDistributed);

  TConfigClient = record
    ClientId: string;
    ClientSecret: string;
  end;

  TConfigBanco = record
    DriverID: string;
    Server: string;
    Database: string;
    User_Name: string;
    Password: string;
    Port: Integer;
  end;

  TConfigINI = record
  private
    FArquivo: string;
    procedure Carregar;
    function StrToApiType(const AValue: string): TApiType;
    function StrToAuthorizationType(const AValue: string): TAuthorizationType;
  public
    ApiType: TApiType;
    AuthorizationType: TAuthorizationType;
    SoftwareHouseId: string;
    Centralizado: TConfigClient;
    Distribuido: TConfigClient;
    Banco: TConfigBanco;

    class function Abrir: TConfigINI; static;
  end;

implementation

{ TConfigINI }

procedure TConfigINI.Carregar;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FArquivo);
  try
    ApiType :=
      StrToApiType(Ini.ReadString('APIType', 'Type', ''));

    AuthorizationType :=
      StrToAuthorizationType(
        Ini.ReadString('APIType', 'AuthorizationType', '')
      );

    SoftwareHouseId :=
      Ini.ReadString('SoftwareHouse', 'Id', '');

    Centralizado.ClientId :=
      Ini.ReadString('Centralizado', 'ClientId', '');

    Centralizado.ClientSecret :=
      Ini.ReadString('Centralizado', 'ClientSecret', '');

    Distribuido.ClientId :=
      Ini.ReadString('Distribuido', 'ClientId', '');

    Distribuido.ClientSecret :=
      Ini.ReadString('Distribuido', 'ClientSecret', '');

    Banco.DriverID := Ini.ReadString('Banco', 'DriverID', '');
    Banco.Server := Ini.ReadString('Banco', 'Server', '');
    Banco.Database := Ini.ReadString('Banco', 'Database', '');
    Banco.User_Name := Ini.ReadString('Banco', 'User_Name', '');
    Banco.Password := Ini.ReadString('Banco', 'Password', '');
    Banco.Port := Ini.ReadInteger('Banco', 'Port', 0);
  finally
    Ini.Free;
  end;
end;

class function TConfigINI.Abrir: TConfigINI;
begin
  Result.FArquivo := ExtractFilePath(ParamStr(0)) + 'config.ini';
  Result.Carregar;
end;

function TConfigINI.StrToApiType(const AValue: string): TApiType;
begin
  if SameText(AValue, 'atMerchant') then
    Result := atMerchant
  else if SameText(AValue, 'atGroceries') then
    Result := atGroceries;
end;

function TConfigINI.StrToAuthorizationType(
  const AValue: string): TAuthorizationType;
begin
  if SameText(AValue, 'ctCentralized') then
    Result := ctCentralized
  else
    Result := ctDistributed;
end;

end.
