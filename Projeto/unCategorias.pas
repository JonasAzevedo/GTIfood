unit unCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, unDM,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCategorias = class(TForm)
    grCategorias: TDBGrid;
    dsCategorias: TDataSource;
    pnlBotoes: TPanel;
    btnEnviar: TButton;
    mmSaida: TMemo;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmCategorias.FormShow(Sender: TObject);
begin
  DM.qryCategorias.Open;
end;

procedure TfrmCategorias.btnEnviarClick(Sender: TObject);
var
  id: string;
begin
  if DM.qryCategorias.IsEmpty then
    Exit;

  DM.qryCategorias.First;
  while not(DM.qryCategorias.Eof) do
  begin
    DM.ADRIFood.Category.NewThis
      .name(DM.qryCategorias.FieldByName('descricao').AsString)
      .externalCode(DM.qryCategorias.FieldByName('codigo').AsString)
      .available(True)
      .sequence(1);

    id := DM.ADRIFood.Category.Insert;
    mmSaida.Lines.Add(id);

    DM.qryCategorias.Next;
  end;
end;

end.
