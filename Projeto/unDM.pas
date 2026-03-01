unit unDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.DApt, Datasnap.DBClient,
  System.Generics.Collections, ADRCompo.Helper.DataSet,
  ADRIFood.Component.Events, ADRIFood.Model.Interfaces, ADRIFood.Model.Types,
  ADRIFood.Entity.Classes.CatalogV20, ADRIFood.Entity.Classes.Events,
  ADRIFood.Entity.Classes.FinancialV30, ADRIFood.Entity.Classes.Item,
  ADRIFood.Entity.Classes.LogisticsV10, ADRIFood.Entity.Classes.Merchant,
  ADRIFood.Entity.Classes.Order, ADRIFood.Entity.Classes.Order.VirtualBag,
  ADRIFood.Entity.Classes.Picking, ADRIFood.Entity.Classes.Promotion,
  ADRIFood.Entity.Classes.Review, ADRIFood.Entity.Classes.Shipping,
  ADRIFood.Component;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    DataSetListarMercado: TFDMemTable;
    dsListarMercado: TDataSource;
    qryProdutos: TFDQuery;
    qryCategorias: TFDQuery;
    ADRIFood: TADRIFood;
    qryInsert: TFDQuery;
    qryCategoriasCODIGO: TStringField;
    qryCategoriasDESCRICAO: TStringField;
    qryCategoriasCODIGO_INTEGRACAO: TStringField;
    qryCategoriasINTEGRADO: TStringField;
    qryCategoriasENVIAR: TStringField;
    procedure ADRIFoodLogResponse(ARequestId, AContent: string;
      AStatusCode: Integer; AUrl: string);
    procedure qryCategoriasINTEGRADOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryCategoriasENVIARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  public
    function InserirCategoria(const ACategoria: string; const ACodigoIntegracao: string): Boolean;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.ADRIFoodLogResponse(ARequestId, AContent: string;
  AStatusCode: Integer; AUrl: string);
var
  logFile: TStringList;
  fileName: string;
begin
  logFile := TStringList.Create;
  try
    fileName := ExtractFilePath(GetModuleName(HInstance)) + 'IFood.log';
    if FileExists(fileName) then
      logFile.LoadFromFile(fileName);

    logFile.Add('');
    logFile.Add('Request ID: ' + ARequestId);
    logFile.Add('Status Code: ' + AStatusCode.ToString);
    logFile.Add('Content: ' + AContent);
    logFile.Add('============================');

    logFile.SaveToFile(fileName);
  finally
    logFile.Free;
  end;
end;

function TDM.InserirCategoria(const ACategoria: string; const ACodigoIntegracao: string): Boolean;
begin
  try
    qryInsert.Close;
    qryInsert.SQL.Clear;
    qryInsert.SQL.Add('INSERT INTO INTEGRACAO_CATEGORIA_IFOOD (grupo, codigo_integracao)');
    qryInsert.SQL.Add('VALUES (:grupo, :codigo_integracao)');
    qryInsert.ParamByName('grupo').AsString := ACategoria;
    qryInsert.ParamByName('codigo_integracao').AsString := ACodigoIntegracao;
    qryInsert.ExecSQL;
    Result := True;
  finally
    qryInsert.Close;
  end;
end;

procedure TDM.qryCategoriasENVIARGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := EmptyStr;
end;

procedure TDM.qryCategoriasINTEGRADOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := EmptyStr;
end;

end.
