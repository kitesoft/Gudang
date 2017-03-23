object f_list_return_kirim: Tf_list_return_kirim
  Left = 193
  Top = 116
  Width = 928
  Height = 480
  Caption = 'Daftar Return Kirim'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 762
    Top = 0
    Width = 150
    Height = 441
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sb_2: TsSpeedButton
      Left = 0
      Top = 90
      Width = 150
      Height = 90
      Cursor = crHandPoint
      Caption = 'Refresh'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_2Click
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.image
      ImageIndex = 8
      Reflected = True
    end
    object sb_1: TsSpeedButton
      Left = 0
      Top = 0
      Width = 150
      Height = 90
      Cursor = crHandPoint
      Caption = 'Selesai'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_1Click
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.image
      ImageIndex = 7
      Reflected = True
    end
    object p1: TsPanel
      Left = 0
      Top = 351
      Width = 150
      Height = 90
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object l_1: TsLabel
        Left = 4
        Top = 5
        Width = 31
        Height = 13
        Caption = 'Mulai :'
      end
      object l_2: TsLabel
        Left = 4
        Top = 45
        Width = 41
        Height = 13
        Caption = 'Sampai :'
      end
      object de_mulai: TsDateEdit
        Left = 4
        Top = 21
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object de_sampai: TsDateEdit
        Left = 4
        Top = 61
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object cb_belum: TsCheckBox
      Left = 8
      Top = 192
      Width = 89
      Height = 20
      Caption = 'Belum Terkirim'
      TabOrder = 1
      OnClick = cb_belumClick
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object cbCabang: TsComboBox
      Left = 8
      Top = 216
      Width = 129
      Height = 21
      Alignment = taLeftJustify
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'BR001'
      Visible = False
      Items.Strings = (
        'BR001'
        'BR002'
        'BR003'
        'BR004'
        'BR005'
        'BR006')
    end
    object btnSimpan: TsButton
      Left = 8
      Top = 240
      Width = 129
      Height = 25
      Caption = 'Simpan Semua'
      Enabled = False
      TabOrder = 3
      Visible = False
      OnClick = btnSimpanClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 762
    Height = 441
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object t_data: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = t_dataCellDblClick
      DataController.DataSource = dm.ds_list_return_kirim
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Data'
          Kind = skCount
          Column = t_datan_supp
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_datanilai_faktur
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object t_datan_supp: TcxGridDBColumn
        Caption = 'Nama Toko'
        DataBinding.FieldName = 'n_pelanggan'
        Width = 190
      end
      object t_datakd_return: TcxGridDBColumn
        Caption = 'Kode Return'
        DataBinding.FieldName = 'kd_return_kirim'
        Width = 105
      end
      object t_dataColumn1: TcxGridDBColumn
        Caption = 'Kode Kirim'
        DataBinding.FieldName = 'kd_kirim'
      end
      object t_datatgl_return: TcxGridDBColumn
        Caption = 'Taggal Return'
        DataBinding.FieldName = 'tgl_return_kirim'
        Width = 79
      end
      object t_datanilai_faktur: TcxGridDBColumn
        Caption = 'Nilai Faktur'
        DataBinding.FieldName = 'nilai_faktur'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
        Width = 82
      end
      object t_dataColumn3: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'pengguna'
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 24
  end
end
