object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'GT Ifood'
  ClientHeight = 473
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 28
  object grBxDadosMercado: TGroupBox
    Left = 0
    Top = 0
    Width = 505
    Height = 153
    Align = alTop
    Caption = 'Dados Mercado '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 503
    object lblTitMerchantName: TLabel
      Left = 20
      Top = 40
      Width = 58
      Height = 28
      BiDiMode = bdLeftToRight
      Caption = 'Nome:'
      ParentBiDiMode = False
    end
    object lblMerchantName: TLabel
      Left = 90
      Top = 40
      Width = 157
      Height = 28
      Caption = 'lblMerchantName'
    end
    object lblTitMerchantId: TLabel
      Left = 20
      Top = 80
      Width = 21
      Height = 28
      Caption = 'Id:'
    end
    object lblMerchantId: TLabel
      Left = 90
      Top = 80
      Width = 122
      Height = 28
      Caption = 'lblMerchantId'
    end
    object lblTitStatus: TLabel
      Left = 20
      Top = 120
      Width = 57
      Height = 28
      Caption = 'Status:'
    end
    object lblStatus: TLabel
      Left = 90
      Top = 120
      Width = 75
      Height = 28
      Caption = 'lblStatus'
    end
  end
  object grBxLog: TGroupBox
    Left = 0
    Top = 153
    Width = 505
    Height = 320
    Align = alClient
    Caption = 'Log '
    TabOrder = 1
    Visible = False
    ExplicitWidth = 503
    ExplicitHeight = 312
    object pnlAtualizarLog: TPanel
      Left = 2
      Top = 277
      Width = 501
      Height = 41
      Align = alBottom
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = pnlAtualizarLogClick
      ExplicitTop = 269
      ExplicitWidth = 499
    end
    object mmLog: TMemo
      Left = 2
      Top = 30
      Width = 501
      Height = 247
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object TrayIcon: TTrayIcon
    PopupMenu = PopupMenu
    Visible = True
    OnDblClick = TrayIconDblClick
    Left = 380
    Top = 81
  end
  object PopupMenu: TPopupMenu
    Left = 380
    Top = 23
    object mnItSair: TMenuItem
      Caption = 'Sair'
      OnClick = mnItSairClick
    end
  end
  object MainMenu: TMainMenu
    Left = 276
    Top = 23
    object mnItOpçoes: TMenuItem
      Caption = 'Op'#231#245'es'
      object mnItLog: TMenuItem
        Caption = 'Log'
        OnClick = mnItLogClick
      end
    end
    object mnItCadastros: TMenuItem
      Caption = 'Cadastros'
      Enabled = False
      object mnItCategorias: TMenuItem
        Caption = 'Categorias'
        Enabled = False
        OnClick = mnItCategoriasClick
      end
      object mnItProdutos: TMenuItem
        Caption = 'Produtos'
        Enabled = False
        OnClick = mnItProdutosClick
      end
    end
  end
end
