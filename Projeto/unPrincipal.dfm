object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'GT Ifood'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object btnInserirItem: TButton
    Left = 296
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Inserir Item'
    TabOrder = 0
    OnClick = btnInserirItemClick
  end
  object Edit1: TEdit
    Left = 400
    Top = 361
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Edit1'
  end
  object btnCategorias: TButton
    Left = 360
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Categorias'
    Enabled = False
    TabOrder = 2
    OnClick = btnCategoriasClick
  end
  object btnProdutos: TButton
    Left = 360
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Produtos'
    Enabled = False
    TabOrder = 3
    OnClick = btnProdutosClick
  end
end
