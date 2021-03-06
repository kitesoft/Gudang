object F_toko: TF_toko
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Laporan Perkembangan Toko'
  ClientHeight = 170
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TsLabel
    Left = 8
    Top = 16
    Width = 58
    Height = 13
    Caption = 'Pilih Periode'
  end
  object lbl2: TsLabel
    Left = 264
    Top = 80
    Width = 161
    Height = 41
    AutoSize = False
    Caption = 'Gunakan Repair Mutasi Hanya '#13#10'jika dirasa ada kesalahan mutasi.'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sButton2: TsButton
    Left = 8
    Top = 136
    Width = 233
    Height = 25
    Caption = 'Preview Stok Out Barang'
    TabOrder = 4
    OnClick = sButton2Click
    SkinData.SkinSection = 'BUTTON'
  end
  object cb_periode: TsComboBox
    Left = 95
    Top = 12
    Width = 147
    Height = 21
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS SANS SERIF'
    Font.Style = []
    ItemIndex = -1
    ParentFont = False
    TabOrder = 0
    OnChange = cb_periodeChange
  end
  object btnMutasi: TsButton
    Left = 8
    Top = 72
    Width = 233
    Height = 25
    Caption = 'Preview Mutasi Barang'
    TabOrder = 2
    OnClick = btnMutasiClick
    SkinData.SkinSection = 'BUTTON'
  end
  object de_mutasi: TsDateEdit
    Left = 264
    Top = 16
    Width = 161
    Height = 21
    AutoSize = False
    Enabled = False
    EditMask = '!99/99/9999;1; '
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
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
  object b_benarkan_mutasi: TsButton
    Left = 264
    Top = 40
    Width = 161
    Height = 25
    Caption = '&Repair Mutasi'
    Enabled = False
    TabOrder = 6
    OnClick = b_benarkan_mutasiClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btnGross: TsButton
    Left = 8
    Top = 40
    Width = 233
    Height = 25
    Caption = 'Preview Gross Margin'
    TabOrder = 1
    OnClick = btnGrossClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btnMutasiHarga: TsButton
    Left = 8
    Top = 104
    Width = 233
    Height = 25
    Caption = 'Preview Mutasi Harga'
    TabOrder = 3
    OnClick = btnMutasiClick
    SkinData.SkinSection = 'BUTTON'
  end
end
