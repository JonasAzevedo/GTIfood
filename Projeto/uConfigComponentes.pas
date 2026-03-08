unit uConfigComponentes;

interface

uses
  System.SysUtils,
  System.Classes,
  uConfigINI,
  ADRCompo.Helper.DataSet, ADRIFood.Component.Events, ADRIFood.Model.Interfaces,
  ADRIFood.Model.Types, ADRIFood.Entity.Classes.CatalogV20,
  ADRIFood.Entity.Classes.Events, ADRIFood.Entity.Classes.FinancialV30,
  ADRIFood.Entity.Classes.Item, ADRIFood.Entity.Classes.LogisticsV10,
  ADRIFood.Entity.Classes.Merchant, ADRIFood.Entity.Classes.Order,
  ADRIFood.Entity.Classes.Order.VirtualBag, ADRIFood.Entity.Classes.Picking,
  ADRIFood.Entity.Classes.Promotion, ADRIFood.Entity.Classes.Review,
  ADRIFood.Entity.Classes.Shipping, ADRIFood.Component,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase;


type
  TConfigComponentes = class
  private
    FConfig: TConfigINI;
    procedure ConfigurarADRIFood;
    procedure ConfigurarConnection;
    procedure ValidarAutenticacao;
  public
    constructor Create;
    procedure Configurar;
  end;

implementation

uses
  RTTI, unDM;

{ TConfigComponentes }

constructor TConfigComponentes.Create;
begin
  inherited Create;
  FConfig := TConfigINI.Abrir;
end;

procedure TConfigComponentes.Configurar;
begin
  ConfigurarADRIFood;
  ValidarAutenticacao;
  ConfigurarConnection;
end;

procedure TConfigComponentes.ConfigurarADRIFood;
begin
  DM.ADRIFood.SoftwareHouse.Id := FConfig.SoftwareHouseId;

  if (FConfig.ApiType = TApiType.atMerchant) then
    DM.ADRIFood.APIType := TADRIFoodAPIType(atMerchant)
  else if (FConfig.ApiType = TApiType.atGroceries) then
    DM.ADRIFood.APIType := TADRIFoodAPIType(atGroceries)
  else
    raise Exception.Create('API Type não definido');

  if (FConfig.AuthorizationType = TAuthorizationType.ctCentralized) then
  begin
    DM.ADRIFood.Credentials.AuthorizationType := TADRIFoodAuthorizationType(ctCentralized);
    DM.ADRIFood.Credentials.Centralizada.ClientId := FConfig.Centralizado.ClientId;
    DM.ADRIFood.Credentials.Centralizada.ClientSecret := FConfig.Centralizado.ClientSecret;
  end
  else if (FConfig.AuthorizationType = TAuthorizationType.ctDistributed) then
  begin
    DM.ADRIFood.Credentials.AuthorizationType := TADRIFoodAuthorizationType(ctDistributed);
    DM.ADRIFood.Credentials.Distribuida.ClientId := FConfig.Distribuido.ClientId;
    DM.ADRIFood.Credentials.Distribuida.ClientSecret := FConfig.Distribuido.ClientSecret;
  end
  else
    raise Exception.Create('AuthorizationType não definido');
end;

procedure TConfigComponentes.ConfigurarConnection;
begin
  try
    DM.FDConnection.Close;
    DM.FDConnection.Params.Clear;
    DM.FDConnection.Params.DriverID := FConfig.Banco.DriverID;
    DM.FDConnection.Params.Values['Server'] := FConfig.Banco.Server;
    DM.FDConnection.Params.Values['Database'] := FConfig.Banco.Database;
    DM.FDConnection.Params.Values['User_Name'] := FConfig.Banco.User_Name;
    DM.FDConnection.Params.Values['Password'] := FConfig.Banco.Password;
    DM.FDConnection.Params.Values['Port'] := FConfig.Banco.Port.ToString;
    DM.FDConnection.LoginPrompt := False;
    DM.FDConnection.Connected := True;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao conectar ao Banco de Dados ' + E.Message);
    end;
  end;
end;

procedure TConfigComponentes.ValidarAutenticacao;
begin
  try
    DM.ADRIFood.MerchantV10.MerchantList.Execute(DM.DataSetListarMercado);
    if DM.DataSetListarMercado.isEmpty then
      Exit;

    DM.MerchantId := DM.DataSetListarMercado.FieldByName('Id').AsString;
    DM.MerchantName := DM.DataSetListarMercado.FieldByName('Name').AsString;
  except
    DM.MerchantId := EmptyStr;
    DM.MerchantName := EmptyStr;
  end;
end;

end.
