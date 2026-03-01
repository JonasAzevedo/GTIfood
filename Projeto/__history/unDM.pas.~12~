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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
