object F_realCard: TF_realCard
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cetak Real Card'
  ClientHeight = 383
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel3: TsLabel
    Left = 344
    Top = 356
    Width = 67
    Height = 13
    Caption = 'Macam Harga'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sb_cari: TsSpeedButton
    Tag = 9
    Left = 512
    Top = 112
    Width = 24
    Height = 21
    OnClick = sb_cariClick
    SkinData.SkinSection = 'SPEEDBUTTON'
    Images = dm.gambar
    ImageIndex = 0
  end
  object btnRealCard: TsButton
    Left = 376
    Top = 8
    Width = 153
    Height = 97
    Caption = '&Real Card'
    TabOrder = 0
    OnClick = btnRealCardClick
    SkinData.SkinSection = 'BUTTON'
  end
  object ed_PID: TEdit
    Left = 8
    Top = 112
    Width = 497
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyDown = ed_PIDKeyDown
  end
  object lv_data: TListView
    Left = 8
    Top = 136
    Width = 529
    Height = 209
    Columns = <
      item
        Caption = 'PID'
        Width = 60
      end
      item
        Caption = 'Deskripsi'
        Width = 300
      end
      item
        Caption = 'Barcode'
        Width = 100
      end
      item
        Caption = 'Harga'
        Width = 60
      end>
    PopupMenu = pm1
    TabOrder = 2
    ViewStyle = vsReport
    OnKeyDown = lv_dataKeyDown
  end
  object lb_data: TListBox
    Left = 544
    Top = 80
    Width = 41
    Height = 177
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object cb_karep: TsCheckBox
    Left = 8
    Top = 352
    Width = 235
    Height = 20
    Caption = '&Tentukan Sendiri Barang yang akan dicetak'
    TabOrder = 4
    OnClick = cb_karepClick
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object gb_tgl: TsGroupBox
    Left = 8
    Top = 32
    Width = 201
    Height = 73
    TabOrder = 5
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Left = 8
      Top = 24
      Width = 19
      Height = 13
      Caption = 'Dari'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 8
      Top = 48
      Width = 35
      Height = 13
      Caption = 'Sampai'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object de_mulai: TsDateEdit
      Left = 56
      Top = 16
      Width = 129
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnChange = de_sampaiChange
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.ParentFont = False
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object de_sampai: TsDateEdit
      Left = 56
      Top = 40
      Width = 129
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnChange = de_sampaiChange
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.ParentFont = False
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object cb_macam: TsComboBox
    Left = 416
    Top = 352
    Width = 121
    Height = 24
    Alignment = taLeftJustify
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
    SkinData.SkinSection = 'COMBOBOX'
    VerticalAlignment = taAlignTop
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Rockwell'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 6
    Text = 'HETK'
    Items.Strings = (
      'HETK'
      'HGTK')
  end
  object rbRak: TsRadioButton
    Left = 224
    Top = 8
    Width = 102
    Height = 20
    Caption = 'berdasarkan Rak'
    TabOrder = 7
    SkinData.SkinSection = 'RADIOBUTTON'
  end
  object rbHarga: TsRadioButton
    Left = 8
    Top = 8
    Width = 167
    Height = 20
    Caption = 'Berdasarkan Perubahan Harga'
    Checked = True
    TabOrder = 8
    TabStop = True
    SkinData.SkinSection = 'RADIOBUTTON'
  end
  object gb_Rak: TsGroupBox
    Left = 216
    Top = 32
    Width = 145
    Height = 73
    TabOrder = 9
    SkinData.SkinSection = 'GROUPBOX'
    object l_1: TsLabel
      Left = 8
      Top = 16
      Width = 54
      Height = 13
      Alignment = taCenter
      Caption = 'Nomer Rak'
    end
    object edRak: TsCurrencyEdit
      Left = 8
      Top = 36
      Width = 129
      Height = 21
      AutoSize = False
      TabOrder = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.ParentFont = False
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      DisplayFormat = '### ### ##0;-### ### ##0;0'
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 160
  end
  object pm1: TPopupMenu
    Left = 272
    Top = 224
    object BukaDataBarang1: TMenuItem
      Caption = 'Buka Data Barang'
      OnClick = BukaDataBarang1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object HapusBarangini1: TMenuItem
      Caption = 'Hapus Barang ini'
      OnClick = HapusBarangini1Click
    end
    object HapusSemuaBarang1: TMenuItem
      Caption = 'Hapus Semua Barang'
      OnClick = HapusSemuaBarang1Click
    end
  end
end
