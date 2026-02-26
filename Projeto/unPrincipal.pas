unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
  ADRCompo.Helper.DataSet, ADRIFood.Component.Events, ADRIFood.Model.Interfaces,
  ADRIFood.Model.Types, ADRIFood.Entity.Classes.CatalogV20,
  ADRIFood.Entity.Classes.Events, ADRIFood.Entity.Classes.FinancialV30,
  ADRIFood.Entity.Classes.Item, ADRIFood.Entity.Classes.LogisticsV10,
  ADRIFood.Entity.Classes.Merchant, ADRIFood.Entity.Classes.Order,
  ADRIFood.Entity.Classes.Order.VirtualBag, ADRIFood.Entity.Classes.Picking,
  ADRIFood.Entity.Classes.Promotion, ADRIFood.Entity.Classes.Review,
  ADRIFood.Entity.Classes.Shipping, ADRIFood.Component, unDM, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    ADRIFood: TADRIFood;
    SpeedButton1: TSpeedButton;
    btnListarMercado: TButton;
    GridListMerchants: TDBGrid;
    btnInserirItem: TButton;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnListarMercadoClick(Sender: TObject);
    procedure btnInserirItemClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ConfigurarADRIFood;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uConfigComponentes;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ConfigurarADRIFood;
end;

procedure TfrmPrincipal.ConfigurarADRIFood;
var
  LConfig: TConfigComponentes;
begin
  LConfig := TConfigComponentes.Create;
  try
    LConfig.Configurar(ADRIFood, DM.FDConnection);
  finally
    LConfig.Free;
  end;
end;

procedure TfrmPrincipal.btnListarMercadoClick(Sender: TObject);
begin
  // Carrega do IFood os Merchants que a credencial tem acesso.
  ADRIFood.MerchantV10.MerchantList.Execute(DM.DataSetListarMercado);

  // EXEMPLO: Setando o id do restaurante no componente
  if DM.DataSetListarMercado.RecordCount > 0 then
    ADRIFood.MerchantID(DM.DataSetListarMercado.FieldByName('Id').AsString);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  id: string;
begin
  ADRIFood.Category.NewThis
    .name('Categoria 01')
    .externalCode('01')
    .available(True)
    .sequence(1);

  id := ADRIFood.Category.Insert;

  Edit1.text := id;
end;

procedure TfrmPrincipal.btnInserirItemClick(Sender: TObject);
var
  id: string;
begin
  ADRIFood.ProductItem.NewThis
    .id('01')
    .categoryId('01')
    .productId('01')
    .name('Teste 01')
    .description('Desc Teste 01')
    .externalCode('01')
//    .imagePath(edtItemImageURL.Text)
//    .image(imgItem.Picture)
    .sequence(0)
    .serving(0)
    .originalValue(10)
    .value(10)
    .ean('01')
    .available(False)
    .vegetarian(False)
    .vegan(False)
    .organic(True)
    .glutenFree(False)
    .sugarFree(False)
    .lacFree(False)
    .alcoholicDrink(False)
    .natural(False);

  id := ADRIFood.ProductItem.Insert;
  Edit1.text := id;
end;

end.
