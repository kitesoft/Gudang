unit u_real_card;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sTooledit, sButton, sLabel, UFungsi, ComCtrls, sEdit,
  sCheckBox, sGroupBox, sComboBox, sSkinProvider, Buttons, sSpeedButton, Menus,
  sRadioButton, sCurrEdit, sCurrencyEdit, Mask, sMaskEdit, sCustomComboEdit;

type
  TF_realCard = class(TForm)
    btnRealCard: TsButton;
    ed_PID: TEdit;
    lv_data: TListView;
    lb_data: TListBox;
    cb_karep: TsCheckBox;
    gb_tgl: TsGroupBox;
    sLabel1: TsLabel;
    de_mulai: TsDateEdit;
    de_sampai: TsDateEdit;
    sLabel2: TsLabel;
    cb_macam: TsComboBox;
    sLabel3: TsLabel;
    sSkinProvider1: TsSkinProvider;
    sb_cari: TsSpeedButton;
    pm1: TPopupMenu;
    BukaDataBarang1: TMenuItem;
    HapusBarangini1: TMenuItem;
    HapusSemuaBarang1: TMenuItem;
    N1: TMenuItem;
    rbRak: TsRadioButton;
    rbHarga: TsRadioButton;
    gb_Rak: TsGroupBox;
    edRak: TsCurrencyEdit;
    l_1: TsLabel;
    procedure btnRealCardClick(Sender: TObject);
    procedure ed_PIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lv_dataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cb_karepClick(Sender: TObject);
    procedure de_sampaiChange(Sender: TObject);
    procedure sb_cariClick(Sender: TObject);
    procedure BukaDataBarang1Click(Sender: TObject);
    procedure HapusBarangini1Click(Sender: TObject);
    procedure HapusSemuaBarang1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_realCard: TF_realCard;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure TF_realCard.btnRealCardClick(Sender: TObject);
begin
  if cb_karep.Checked = true then
  begin
    if lb_data.Items.Count = 0 then
      Exit;
    fungsi.SQLExec(dm.Q_laporan,
      'select * from vw_planogram where kd_perusahaan="' + dm.kd_perusahaan +
      '" and kd_barang in(' + lb_data.Items.CommaText + ') and kd_macam_harga="'
      + cb_macam.Text + '"', true);
  end
  else if rbHarga.Checked = True then
  begin
    fungsi.SQLExec(dm.Q_laporan,
      'select * from vw_planogram where kd_perusahaan="' + dm.kd_perusahaan +
      '" and date(update_pada)>="' + formatdatetime('yyyy-MM-dd', de_mulai.Date)
      + '" and date(update_pada)<="' + formatdatetime('yyyy-MM-dd', de_sampai.Date)
      + '" and kd_macam_harga="' + cb_macam.Text + '"', true);
  end
  else
  begin
    fungsi.SQLExec(dm.Q_laporan,
      'select * from vw_planogram where kd_perusahaan="' + dm.kd_perusahaan +
      '" and no_rak=' + edRak.Text + ' ', true);
  end;
  dm.laporan.LoadFromFile(dm.WPath + '\laporan\gp_real_card.fr3');
  dm.laporan.ShowReport;
end;

procedure TF_realCard.ed_PIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ItemBaru: TListItem;
begin
  if key = vk_f2 then
    sb_cariClick(Sender);

  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    cb_karep.Checked := True;
    fungsi.SQLExec(dm.Q_temp, 'select * from vw_planogram where kd_perusahaan="'
      + dm.kd_perusahaan + '" and (kd_barang="' + ed_PID.Text +
      '" or barcode3="' + ed_PID.Text + '")', true);

    if dm.Q_temp.Eof then
      showmessage('data tidak ada...')
    else
    begin
      lb_data.Items.Add(dm.Q_temp.fieldbyname('kd_barang').AsString);
      with lv_data do
      begin
        ItemBaru := Items.Add;
        ItemBaru.Caption := dm.Q_temp.fieldbyname('kd_barang').AsString;
        ItemBaru.SubItems.Add(dm.Q_temp.fieldbyname('n_barang').AsString);
        ItemBaru.SubItems.Add(dm.Q_temp.fieldbyname('barcode3').AsString);
        ItemBaru.SubItems.Add(dm.Q_temp.fieldbyname('harga_jual3').AsString);
      end;
    end;
    ed_PID.Clear;
  end;
end;

procedure TF_realCard.lv_dataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_delete then
  begin
    lb_data.Items.Delete(lv_data.ItemIndex);
    lv_data.DeleteSelected;
  end;
end;

procedure TF_realCard.cb_karepClick(Sender: TObject);
begin
  gb_tgl.Enabled := not (cb_karep.Checked);
  gb_Rak.Enabled := not (cb_karep.Checked);
end;

procedure TF_realCard.de_sampaiChange(Sender: TObject);
begin
  if de_sampai.Date < de_mulai.Date then
    de_sampai.Date := de_mulai.Date;
end;

procedure TF_realCard.sb_cariClick(Sender: TObject);
begin
  ed_PID.SetFocus;
  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'select kd_barang, n_barang from tb_barang where kd_perusahaan="' +
      dm.kd_perusahaan + '"';
    tblcap[0] := 'PID';
    tblCap[1] := 'Deskripsi Barang';
    tampil_button(False, True);
    if ShowModal = mrOk then
    begin
      ed_PID.Text := TblVal[0];
    end;
  finally
    close;
  end;
end;

procedure TF_realCard.BukaDataBarang1Click(Sender: TObject);
begin
  sb_cariClick(Sender);
end;

procedure TF_realCard.HapusBarangini1Click(Sender: TObject);
begin
  lb_data.Items.Delete(lv_data.ItemIndex);
  lv_data.DeleteSelected;
end;

procedure TF_realCard.HapusSemuaBarang1Click(Sender: TObject);
begin
  lb_data.Clear;
  lv_data.Clear;
end;

procedure TF_realCard.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if lv_data.Items.Count > 0 then
  begin
    ShowMessage('hapus dulu seluruh data,,,');
    CanClose := False;
  end;

end;

procedure TF_realCard.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_f2 then
    ed_PID.SetFocus;
end;

end.


