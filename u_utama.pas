unit u_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, ComCtrls, sStatusBar, 
  Menus, ActnList, StdActns, XPStyleActnCtrls, ActnMan,U_fungsi,
  sPageControl, Buttons, sSpeedButton, ExtCtrls, sPanel,inifiles,
  madExceptVcl,shellapi, StdCtrls, sButton, DB, Grids, DBGrids, sListBox,
  sMemo, sGauge, sTabControl, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, sEdit,
  cxClasses, cxGridLevel, cxGrid, mySQLDbTables,WinInet;//,IniFiles;

  const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  Tf_utama = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sb: TsStatusBar;
    MainMenu1: TMainMenu;
    AL: TActionList;
    ac_barang: TAction;
    ac_harga: TAction;
    ac_receipt: TAction;
    ac_return: TAction;
    ac_company: TAction;
    ac_jenis: TAction;
    ac_golongan: TAction;
    ac_kategori: TAction;
    ac_merk: TAction;
    Ac_supplier: TAction;
    Ac_satuan: TAction;
    ac_purchase: TAction;
    ac_barang_supp: TAction;
    ac_planogram: TAction;
    ac_cust: TAction;
    ac_user: TAction;
    ac_list_purchase: TAction;
    ac_list_receipt: TAction;
    ac_list_return: TAction;
    pc: TsPageControl;
    ts_master: TsTabSheet;
    sTabSheet2: TsTabSheet;
    ts_set_inv: TsTabSheet;
    ts_transaksi: TsTabSheet;
    SetUpDefaultCompany1: TMenuItem;
    DefaultCompany1: TMenuItem;
    Action1: TAction;
    ac_lap: TAction;
    Timer1: TTimer;
    HidePanelControl1: TMenuItem;
    UbahSkin1: TMenuItem;
    N1: TMenuItem;
    SettingInventori1: TMenuItem;
    MasterData1: TMenuItem;
    Company1: TMenuItem;
    Supplier1: TMenuItem;
    Pelanggan1: TMenuItem;
    User1: TMenuItem;
    Jenis1: TMenuItem;
    Golongan1: TMenuItem;
    Kategori1: TMenuItem;
    Merk1: TMenuItem;
    Satuan1: TMenuItem;
    ransaksi1: TMenuItem;
    PO1: TMenuItem;
    RO1: TMenuItem;
    Return1: TMenuItem;
    N4: TMenuItem;
    DaftarPurchaseOrderPO1: TMenuItem;
    DaftarReceiptOrderRO1: TMenuItem;
    DaftarReturnPembelian1: TMenuItem;
    Inventory1: TMenuItem;
    Barang1: TMenuItem;
    Harga1: TMenuItem;
    Planogram1: TMenuItem;
    BarangSupplier1: TMenuItem;
    Laporan1: TMenuItem;
    time_out: TTimer;
    N2: TMenuItem;
    LogOut1: TMenuItem;
    animasi: TTimer;
    sPanel2: TsPanel;
    sSpeedButton12: TsSpeedButton;
    sSpeedButton13: TsSpeedButton;
    sSpeedButton14: TsSpeedButton;
    sSpeedButton15: TsSpeedButton;
    sb_kirim_data: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sCoolBar1: TsPanel;
    sBitBtn1: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    sSpeedButton23: TsSpeedButton;
    sPanel3: TsPanel;
    sSpeedButton18: TsSpeedButton;
    sSpeedButton19: TsSpeedButton;
    sb_return_kirim: TsSpeedButton;
    sPanel1: TsPanel;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    sSpeedButton7: TsSpeedButton;
    sSpeedButton8: TsSpeedButton;
    sSpeedButton9: TsSpeedButton;
    sSpeedButton10: TsSpeedButton;
    Pertolongan1: TMenuItem;
    CentralofProfitHelp1: TMenuItem;
    spdbtnac_return: TsSpeedButton;
    ac_kirim: TAction;
    spdbtnkirim: TsSpeedButton;
    ac_list_kirim: TAction;
    KirimData1: TMenuItem;
    DaftarKirimBarang1: TMenuItem;
    sb_lap: TsSpeedButton;
    ac_kirim_data: TAction;
    sb_update_barang_harga: TsSpeedButton;
    ac_update: TAction;
    sg_update: TsGauge;
    ts_1: TsTabSheet;
    spnl1: TsPanel;
    sb_list_receipt: TsSpeedButton;
    sb_Action1: TsSpeedButton;
    sb_list_purchase: TsSpeedButton;
    sb_list_return1: TsSpeedButton;
    sb_list_kirim1: TsSpeedButton;
    sb_receipt: TsSpeedButton;
    ac_return_kirim: TAction;
    ac_list_return_kirim: TAction;
    sb_list_kirim: TsSpeedButton;
    ac_list_sales: TAction;
    ac_list_so: TAction;
    sb_list_return_kirim: TsSpeedButton;
    sb_list_sales: TsSpeedButton;
    tc_child: TsTabControl;
    pm1: TPopupMenu;
    utupSemua1: TMenuItem;
    utupSemuaKecualiini1: TMenuItem;
    utup1: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    ac_realcard: TAction;
    Q_time: TmySQLQuery;
    SbubahPassword: TsSpeedButton;
    mniN6: TMenuItem;
    mniCekUpdateProgram1: TMenuItem;
    ac_cekUpdate: TAction;
    sb_kembang: TsSpeedButton;
    ReturnKirim1: TMenuItem;
    RealCard1: TMenuItem;
    DaftarReturnKirim1: TMenuItem;
    DaftarPenjualan1: TMenuItem;
    DaftarStokOpnameSO1: TMenuItem;
    ac_list_return_jual: TAction;
    btnRetunJual: TsSpeedButton;
    procedure ac_barangExecute(Sender: TObject);
    procedure ac_hargaExecute(Sender: TObject);
    procedure ac_receiptExecute(Sender: TObject);
    procedure ac_returnExecute(Sender: TObject);
    procedure ac_companyExecute(Sender: TObject);
    procedure ac_jenisExecute(Sender: TObject);
    procedure ac_golonganExecute(Sender: TObject);
    procedure ac_kategoriExecute(Sender: TObject);
    procedure ac_merkExecute(Sender: TObject);
    procedure Ac_supplierExecute(Sender: TObject);
    procedure Ac_satuanExecute(Sender: TObject);
    procedure ac_purchaseExecute(Sender: TObject);
    procedure ac_barang_suppExecute(Sender: TObject);
    procedure ac_planogramExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_custExecute(Sender: TObject);
    procedure ac_userExecute(Sender: TObject);
    procedure ac_list_purchaseExecute(Sender: TObject);
    procedure ac_list_receiptExecute(Sender: TObject);
    procedure ac_list_returnExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DefaultCompany1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ac_lapExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure HidePanelControl1Click(Sender: TObject);
    procedure UbahSkin1Click(Sender: TObject);
    procedure LogOut1Click(Sender: TObject);
    procedure time_outTimer(Sender: TObject);
    procedure animasiTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CentralofProfitHelp1Click(Sender: TObject);
    procedure ac_kirimExecute(Sender: TObject);
    procedure ac_list_kirimExecute(Sender: TObject);
    procedure ac_kirim_dataExecute(Sender: TObject);
    procedure ac_updateExecute(Sender: TObject);
    procedure ac_list_salesExecute(Sender: TObject);
    procedure ac_list_soExecute(Sender: TObject);
    procedure MDIChildCreated(const childHandle : THandle);
    procedure MDIChildDestroyed(const childHandle : THandle);
    procedure tc_childChange(Sender: TObject);
    procedure utupSemua1Click(Sender: TObject);
    procedure utup1Click(Sender: TObject);
    procedure utupSemuaKecualiini1Click(Sender: TObject);
    procedure ac_return_kirimExecute(Sender: TObject);
    procedure ac_list_return_kirimExecute(Sender: TObject);
    procedure panel_auto_width;
    procedure ac_realcardExecute(Sender: TObject);
    procedure SbubahPasswordClick(Sender: TObject);
    procedure ac_cekUpdateExecute(Sender: TObject);
    procedure cek_update();
    procedure ac_list_return_jualExecute(Sender: TObject);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    function HakAkses(kunci:string): Boolean;
    { Public declarations }
  end;

  type
  TupdateTread = class(TThread)
  private
    FUrlCek  : string;
    FCurVer  : string;
    FUrlDownload   : string;
    isupdate : Boolean;
  protected
    procedure Execute; override;
    procedure ThreadExecute;
    function UpdateApp(const Url: string): string;
  public
    constructor create(UrlCek:string;CurrentVersion:string;UrlDownload:string);
  end;

var
  f_utama: Tf_utama;
  fungsi:TFungsi;
  turun,koneksi:boolean;

//function tes_koneksi:Boolean; external 'tools\gain.dll';

implementation

uses u_barang, u_edit_harga, u_return, u_cari, u_dm, u_purchase,
  u_barang_supp, u_planogram,u_list_purchase, u_list_receipt,
  u_list_return, U_Login,acselectskin, u_lap, u_RO, U_kirim, u_list_kirim,
  u_kirim_data, u_list_sales, u_list_SO, u_return_kirim,
  u_list_return_kirim, U_toko, u_hari, u_emp, u_ubahPassword,
  u_list_return_jual;//, u_koneksi;

{$R *.dfm}

//add a tab for an MDI child
procedure tf_utama.MDIChildCreated(const childHandle : THandle);
begin
  tc_child.Tabs.AddObject(TForm(FindControl(childHandle)).Caption, TObject(childHandle));
  tc_child.TabIndex := -1 + tc_child.Tabs.Count;

  if f_utama.MDIChildCount > 1 then
  begin
    tc_child.Visible:=True;
  end;
end;

//remove a tab for this MDI child
procedure tf_utama.MDIChildDestroyed(const childHandle : THandle);
var
  idx: Integer;
begin
  idx := tc_child.Tabs.IndexOfObject(TObject(childHandle));
  tc_child.Tabs.Delete(idx);

  if f_utama.MDIChildCount = 2 then
  tc_child.Visible:=False;
end;

procedure Tf_utama.WmAfterShow(var Msg: TMessage);
begin
  dm.sm.Active:= true;

  application.CreateForm(tF_login, f_login);
  f_login.sb.Panels[0].Text:=sb.Panels[3].Text;
  f_login.sb.Panels[1].Text:=sb.Panels[4].Text;
  f_login.ShowModal;
end;


procedure Tf_utama.ac_barangExecute(Sender: TObject);
begin
if not(HakAkses('gdInvBarang')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

if f_barang = nil then
  application.CreateForm(tf_barang, f_barang);

  f_barang.Show;
end;

procedure Tf_utama.ac_hargaExecute(Sender: TObject);
begin
if not(HakAkses('gdInvHarga')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

if f_edit_harga = nil then
  application.CreateForm(tf_edit_harga, f_edit_harga);

  f_edit_harga.Show;
end;

procedure Tf_utama.ac_receiptExecute(Sender: TObject);
begin
if not(HakAkses('gdTrRO')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_RO, f_RO);
  f_RO.Show;
end;

procedure Tf_utama.ac_returnExecute(Sender: TObject);
begin
if not(HakAkses('gdTrReturn')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_return, f_return);
  f_return.Show;
end;

procedure Tf_utama.ac_companyExecute(Sender: TObject);
begin
if not(HakAkses('gdMaster')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_perusahaan, n_perusahaan from tb_company';
    tblcap[0]:= 'Kode';
    tblCap[1]:= 'Nama';
    Caption:='Daftar Perusahaan';
    cariT:= 8;
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_utama.ac_jenisExecute(Sender: TObject);
begin
if not(HakAkses('gdSetting')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_jenis,n_jenis from tb_jenis';
    tblcap[0]:= 'No';
    tblCap[1]:= 'Deskripsi';
    Caption:='Daftar Jenis Barang';
    cariT:= 1;
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_utama.ac_golonganExecute(Sender: TObject);
begin
if not(HakAkses('gdSetting')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_golbrg, kd_jenis,n_golbrg from tb_golongan';
    tblcap[0]:= 'No Gol';
    tblCap[1]:= 'No Jenis';
    tblCap[2]:= 'Deskripsi';
    Caption:='Daftar Golongan Barang';
    cariT:= 2;
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_utama.ac_kategoriExecute(Sender: TObject);
begin
if not(HakAkses('gdSetting')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select tag,n_kategori from tb_kategori';
    tblcap[0]:= 'No';
    tblCap[1]:= 'Deskripsi';
    Caption:='Daftar Kategori Barang';
    cariT:= 4;
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_utama.ac_merkExecute(Sender: TObject);
begin
if not(HakAkses('gdSetting')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_merk,n_merk from tb_merk';
    tblcap[0]:= 'No';
    tblCap[1]:= 'Deskripsi';
    Caption:='Daftar Merk Barang';
    cariT:= 3;
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_utama.Ac_supplierExecute(Sender: TObject);
begin
if not(HakAkses('gdMaster')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kode,n_supp from tb_supp where kd_perusahaan = "'+sb.Panels[3].text+'"';
    tblcap[0]:= 'Kode';
    tblCap[1]:= 'Nama Supplier';
    Caption:='Daftar Supplier';
    cariT:= 9;
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_utama.Ac_satuanExecute(Sender: TObject);
begin
if not(HakAkses('gdSetting')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_satuan,n_satuan,n_singkat from tb_satuan';
    tblcap[0]:= 'No';
    tblCap[1]:= 'Deskripsi';
    tblCap[2]:= 'Singkatan';
    Caption:='Daftar Satuan';
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_utama.ac_purchaseExecute(Sender: TObject);
begin
if not(HakAkses('gdTrPO')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_purchase, f_purchase);
  f_purchase.Show;
end;

procedure Tf_utama.ac_barang_suppExecute(Sender: TObject);
begin
if not(HakAkses('gdInvBrgSupp')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_barang_supp, f_barang_supp);
  f_barang_supp.ShowModal;
end;

procedure Tf_utama.ac_planogramExecute(Sender: TObject);
begin
if not(HakAkses('gdInvPlano')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_planogram, f_planogram);
  f_planogram.ShowModal;
end;

procedure Tf_utama.FormShow(Sender: TObject);
begin
  sb.Panels[9].Text:='Versi: '+fungsi.program_versi;
  pc.ActivePage:= ts_master;

  metu_kabeh:=False;

  sb.Panels[2].Text:= dm.My_conn.DatabaseName +'@'+ dm.My_conn.Host;
  sb.Panels[3].Text:=kd_comp;
  fungsi.SQLExec(dm.Q_Show,'select * from tb_company where kd_perusahaan = "'+sb.Panels[3].text+'"',true);
  sb.Panels[4].Text:=dm.Q_Show.fieldbyname('n_perusahaan').AsString;

  sb.Panels[8].Text:=dm.Q_Show.fieldbyname('ket').AsString;


  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);

end;

procedure Tf_utama.ac_custExecute(Sender: TObject);
begin
if not(HakAkses('gdMaster')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_pelanggan,n_pelanggan from tb_pelanggan where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"';
    tblcap[0]:= 'Kode';
    tblCap[1]:= 'Nama Pelanggan';
    Caption:='Daftar Pelanggan';
    CariT:= 11;
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_utama.ac_userExecute(Sender: TObject);
begin
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_user,n_user from tb_user where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"';
    tblcap[0]:= 'Kode';
    tblCap[1]:= 'Nama Pengguna';
    Caption:='Daftar Pengguna';
    CariT:= 12;
    tampil_button(true,False);
    ShowModal;
  finally
  close;
  end;

end;

procedure Tf_utama.ac_list_purchaseExecute(Sender: TObject);
begin
if f_List_purchase = nil then
  application.CreateForm(tf_list_purchase, f_list_purchase);

  f_list_purchase.Show;
end;

procedure Tf_utama.ac_list_receiptExecute(Sender: TObject);
begin
if f_list_receipt = nil then
application.CreateForm(tf_list_receipt, f_list_receipt);

f_list_receipt.Show;
end;

procedure Tf_utama.ac_list_returnExecute(Sender: TObject);
begin
if f_list_return = nil then
application.CreateForm(tf_list_return, f_list_return);

f_list_return.Show;
end;

procedure Tf_utama.FormClose(Sender: TObject; var Action: TCloseAction);
var appINI : TIniFile;
begin
  appINI := TIniFile.Create(dm.WPath+'\tools\gain.ini') ;
  appINI.WriteString('gudang','kd_perusahaan',sb.Panels[3].Text);
  appINI.Free;

metu_kabeh:=True;
dm.My_conn.Connected:= false;

action:=cafree;
f_utama:=nil;
end;

procedure Tf_utama.DefaultCompany1Click(Sender: TObject);
begin
if f_utama.MDIChildCount<>0 then
begin
showmessage('tutup dulu semua windows...');
exit;
end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_perusahaan, n_perusahaan from tb_company';
    tblcap[0]:= 'Kode';
    tblCap[1]:= 'Nama Perusahaan';
    CariT := 8;
    tampil_button(False,True);
    if ShowModal = mrOk then
    begin
      if sb.Panels[3].Text <> TblVal[0] then
       begin
         application.CreateForm(Tf_login, f_login);
         F_Login.sb.Panels[0].Text:= tblval[0];
         F_Login.sb.Panels[1].Text:= tblval[1];
         f_login.ShowModal;
       end;
    end;
  finally
  close;
  end;

end;

procedure Tf_utama.Action1Execute(Sender: TObject);
begin
close;
end;

procedure Tf_utama.ac_lapExecute(Sender: TObject);
begin
Application.CreateForm(TF_toko,F_toko);
F_toko.ShowModal;
end;

procedure Tf_utama.Timer1Timer(Sender: TObject);
var  days: array[1..7] of string;
begin
if sb.Panels[0].Text='' then
begin
ShowMessage('kode user kosong... lakukan login ulang...');
Timer1.Enabled:= False;
Exit;
end;

  days[1] := 'Minggu';
  days[2] := 'Senin';
  days[3] := 'Selasa';
  days[4] := 'Rabu';
  days[5] := 'Kamis';
  days[6] := 'Jumat';
  days[7] := 'Sabtu';

try
fungsi.SQLExec(Q_time,'select now() as sekarang',True);

sb.Panels[5].Text:=days[DayOfWeek(Q_time.fieldbyname('sekarang').AsDateTime)];
sb.Panels[6].Text:=formatdatetime('dd mmm yyyy', Q_time.fieldbyname('sekarang').AsDateTime);
waktu_sekarang:= Q_time.fieldbyname('sekarang').AsDateTime;
sb.Panels[7].Text:=FormatDateTime('hh:nn:ss',Q_time.fieldbyname('sekarang').AsDateTime);
except
  Timer1.Enabled:= False;
  if (MessageDlg('KONEKSI TERPUTUS DENGAN SERVER...'+#13+#10+'coba '+
  'hubungkan kembali??????', mtWarning, [mbOK], 0) = mrOk) then
  begin
    Timer1.Enabled:= True;
  end;
end;

if sb.Panels[7].Text >= '23:59:00' then
begin
  if f_hari = nil then
  begin
    Application.CreateForm(Tf_hari, f_hari);
    f_hari.ShowModal;
  end;
end else
begin
  if f_hari <> nil then
  f_hari.Close;
end;

//tes_koneksi(koneksi);
{
if tes_koneksi = False then
begin
  if f_koneksi = nil then
  begin
    Application.CreateForm(Tf_koneksi, f_koneksi);
    f_koneksi.ShowModal;
    dm.koneksikan;
  end;
end else
begin
  if f_koneksi <> nil then
  begin
    f_koneksi.Close;
    dm.koneksikan;
  end;
end;}
end;

procedure Tf_utama.HidePanelControl1Click(Sender: TObject);
begin
if (hidepanelcontrol1.Checked=true) then
begin
hidepanelcontrol1.Checked:= false;
pc.Visible:= true;
end else
begin
hidepanelcontrol1.Checked:= true;
pc.Visible:= false;
end;
end;

procedure Tf_utama.UbahSkin1Click(Sender: TObject);
begin
selectskin(dm.sm);
end;

procedure Tf_utama.LogOut1Click(Sender: TObject);
begin
if f_utama.MDIChildCount<>0 then
begin
showmessage('tutup dulu semua windows...');
exit;
end;

sb.Panels[0].Text:= 'USER';
sb.Panels[1].Text:= 'NAMA USER';
sop:= true;

application.CreateForm(tF_login, f_login);
f_login.sb.Panels[0].Text:=sb.Panels[3].Text;
f_login.sb.Panels[1].Text:=sb.Panels[4].Text;
f_login.ShowModal;
end;

procedure Tf_utama.time_outTimer(Sender: TObject);
begin
time_out.Enabled:= false;
close;
end;

procedure Tf_utama.animasiTimer(Sender: TObject);
begin
if turun=true then
begin
AlphaBlendValue:= AlphaBlendValue-1;
  if AlphaBlendValue = 0 then turun:= false;
end else
begin
f_utama.AlphaBlendValue:= f_utama.AlphaBlendValue+1;
  if AlphaBlendValue = 255 then
  begin
  turun:= true;
  end;
end;
end;

procedure Tf_utama.FormCreate(Sender: TObject);
const
  crMycursor = 1;
begin
  Screen.Cursors[crMyCursor]:=LoadCursorFromFile(pchar(dm.WPath+'\tools\c_gudang.ani'));
  Cursor := crMyCursor;
  DecimalSeparator:= '.';
  ThousandSeparator := ',';
  ShortDateFormat:='dd/mm/yyyy';
  ShortTimeFormat:='hh:nn:ss';
end;

procedure Tf_utama.CentralofProfitHelp1Click(Sender: TObject);
begin
ShellExecute(Handle,'open', PChar('hh.exe'),PChar(dm.wpath+'tools/bantuan.chm::/Central_of_Profit.htm'), nil, SW_SHOW);
end;

procedure Tf_utama.ac_kirimExecute(Sender: TObject);
begin
if not(HakAkses('gdTrKirim')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

application.CreateForm(tF_kirim, F_kirim);
F_kirim.Show;
end;

procedure Tf_utama.ac_list_kirimExecute(Sender: TObject);
begin
if f_List_kirim = nil then
application.CreateForm(tf_List_kirim, f_List_kirim);

f_List_kirim.Show;
end;

procedure Tf_utama.ac_kirim_dataExecute(Sender: TObject);
begin
if not(HakAkses('gdInvBrgUpdate')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;
application.CreateForm(TF_kirim_data, F_kirim_data);
F_kirim_data.ShowModal;
end;

procedure Tf_utama.ac_updateExecute(Sender: TObject);
var
W:Integer;
begin
if not(HakAkses('gdInvBrgUpdate')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

if MessageDlg('Proses ini akan mengganti (insert Update dan Delete) '+#13+#10+'seluruh '+
'data  barang dan harga sesuai dengan data '+#13+#10+'yang ada dalam database Pusat '+
'dan '+#13+#10+'mungkin akan berlangsung untuk beberapa menit...'+#13+#10+''+#13+#10+'Yakinkah '+
'Anda akan mengUpdate data ini???', mtWarning,[mbYes, mbNo],0) = mrno then Exit;

//untuk update data barang dan data harga dari pusat
sg_update.Progress:=0;
sg_update.Suffix:=' %(Menambah Barang Baru)';
sg_update.Visible:=True;
//memasukkan barang baru
dm.My_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_Exe,'INSERT IGNORE INTO tb_barang(kd_perusahaan,kd_barang,n_barang,kd_jenis,kd_kategori,kd_golbrg, '+
'kd_merk,kd_sat1,kd_sat2,kd_sat3,barcode1,barcode2,barcode3,Qty1,Qty2,minstok,maxstok, '+
'leadtime,aktif,minor,hpp_ahir,hpp_aktif,`update`) SELECT "'+SB.Panels[3].Text+'",kd_barang,n_barang,'+
'kd_jenis,kd_kategori,kd_golbrg,kd_merk,kd_sat1,kd_sat2,kd_sat3,barcode1,barcode2,'+
'barcode3,Qty1,Qty2,minstok,maxstok,leadtime,aktif,minor,hpp_ahir,hpp_aktif,`update` '+
'FROM tb_barang WHERE kd_perusahaan = "'+SB.Panels[8].Text+'"',False);

sg_update.Progress:=10;
sg_update.Suffix:=' %(Memperbarui data Barang)';

//mengupdate barang
fungsi.SQLExec(dm.Q_Exe,'UPDATE tb_barang B2,tb_barang B1 SET B2.n_barang=B1.n_barang, '+
'B2.kd_jenis=B1.kd_jenis,B2.kd_kategori=B1.kd_kategori,B2.kd_golbrg=B1.kd_golbrg, '+
'B2.kd_merk=B1.kd_merk,B2.kd_sat1=B1.kd_sat1,B2.kd_sat2=B1.kd_sat2,B2.kd_sat3=B1.kd_sat3, '+
'B2.barcode1=B1.barcode1,B2.barcode2=B1.barcode2,B2.barcode3=B1.barcode3,B2.Qty1=B1.Qty1, '+
'B2.Qty2=B1.Qty2,B2.hpp_ahir=B1.hpp_ahir,B2.hpp_aktif=B1.hpp_aktif,B2.`update`=B1.`update` '+
'WHERE B2.kd_barang=B1.kd_barang AND B2.kd_perusahaan="'+SB.Panels[3].Text+'" AND B1.kd_perusahaan="'+SB.Panels[8].Text+'"',False);

sg_update.Progress:=20;
sg_update.Suffix:=' %(Menghapus data Barang lama)';

fungsi.SQLExec(dm.Q_temp,'SELECT kd_barang from tb_barang WHERE kd_perusahaan = "'+
SB.Panels[3].Text+'" AND kd_barang NOT IN (SELECT kd_barang FROM tb_barang WHERE kd_perusahaan="'+SB.Panels[8].Text+'")',True);

if not(dm.Q_temp.Eof) then
begin
//menghapus barang
dm.Q_temp.First;
  for W:=1 to dm.Q_temp.RecordCount do
  begin
    fungsi.SQLExec(dm.Q_Exe,'delete from tb_barang '+
    'WHERE kd_perusahaan = "'+SB.Panels[3].Text+'" AND '+
    'kd_barang = "'+dm.Q_temp.fieldbyname('kd_barang').AsString+'"',False);

    fungsi.SQLExec(dm.Q_Exe,'delete from tb_mutasi '+
    'WHERE kd_perusahaan = "'+SB.Panels[3].Text+'" AND '+
    'kd_barang = "'+dm.Q_temp.fieldbyname('kd_barang').AsString+'"',False);

    fungsi.SQLExec(dm.Q_Exe,'delete from tb_barang_supp '+
    'WHERE kd_perusahaan = "'+SB.Panels[3].Text+'" AND '+
    'kd_barang = "'+dm.Q_temp.fieldbyname('kd_barang').AsString+'"',False);

    fungsi.SQLExec(dm.Q_Exe,'delete from tb_planogram '+
    'WHERE kd_perusahaan = "'+SB.Panels[3].Text+'" AND '+
    'kd_barang = "'+dm.Q_temp.fieldbyname('kd_barang').AsString+'"',False);

    dm.Q_temp.Next;
  end;
end;

sg_update.Progress:=30;
sg_update.Suffix:=' %(Menambah Harga Barang Baru)';

fungsi.SQLExec(dm.Q_Exe,'INSERT IGNORE INTO tb_barang_harga(kd_perusahaan,kd_barang,kd_macam_harga, '+
'laba,laba_P,harga_jual1,harga_jual2,harga_jual3,kode_user,`update`,awal,ahir,diskon,diskonP) '+
'SELECT "'+SB.Panels[3].Text+'",kd_barang,kd_macam_harga,laba,laba_P,harga_jual1,harga_jual2,harga_jual3, '+
'kode_user,`update`,awal,ahir,diskon,diskonP FROM tb_barang_harga WHERE kd_perusahaan = "'+SB.Panels[8].Text+'"',False);

sg_update.Progress:=40;
sg_update.Suffix:=' %(Memperbarui Harga Barang)';

fungsi.SQLExec(dm.Q_Exe,'UPDATE tb_barang_harga H1,tb_barang_harga H2 SET '+
'H1.laba=H2.laba,H1.laba_P=H2.laba_P, '+
'H1.harga_jual1=H2.harga_jual1,H1.harga_jual2=H2.harga_jual2,H1.harga_jual3=H2.harga_jual3, '+
'H1.kode_user=H2.kode_user,H1.`update`=H2.`update`,H1.awal=H2.awal,H1.ahir=H2.ahir,'+
'H1.diskon =H2.diskon,H1.diskonP =H2.diskonP WHERE H1.kd_barang=H2.kd_barang AND '+
'H1.kd_macam_harga=H2.kd_macam_harga AND '+
'H1.kd_perusahaan="'+SB.Panels[3].Text+'" AND H2.kd_perusahaan="'+SB.Panels[8].Text+'"',False);

sg_update.Progress:=50;
sg_update.Suffix:=' %(Proses hapus data harga barang...)';

fungsi.SQLExec(dm.Q_temp,'SELECT kd_barang from tb_barang_harga WHERE kd_perusahaan = "'+
SB.Panels[3].Text+'" AND kd_barang NOT IN (SELECT kd_barang FROM tb_barang_harga WHERE kd_perusahaan="'+SB.Panels[8].Text+'")',True);

if not(dm.Q_temp.Eof) then
begin
//menghapus barang
dm.Q_temp.First;
  for W:=1 to dm.Q_temp.RecordCount do
  begin
    fungsi.SQLExec(dm.Q_Exe,'delete from tb_barang_harga '+
    'WHERE kd_perusahaan = "'+SB.Panels[3].Text+'" AND '+
    'kd_barang = "'+dm.Q_temp.fieldbyname('kd_barang').AsString+'"',False);
    dm.Q_temp.Next;
  end;
end;

sg_update.Progress:=60;
sg_update.Suffix:=' %(Proses memasukkan barang supp...)';

fungsi.SQLExec(dm.Q_Exe,'INSERT IGNORE INTO tb_barang_supp(kd_perusahaan,kd_suplier,kd_barang,`update`) SELECT "'+
SB.Panels[3].Text+'","'+SB.Panels[8].Text+'",kd_barang,date(now()) '+
'FROM tb_barang WHERE kd_perusahaan = "'+SB.Panels[8].Text+'"',False);

sg_update.Progress:=70;
sg_update.Suffix:=' %(Proses Update selesai)';

sg_update.Visible:=False;
dm.My_conn.Commit;
ShowMessage('proses update barang dan harga Berhasil....');
except on E:Exception do
begin
  dm.My_conn.Rollback;
  sg_update.Visible:=False;
  ShowMessage('proses update barang dan harga gagal.... '#10#13''+e.Message);
end;
end;
end;

procedure Tf_utama.ac_list_salesExecute(Sender: TObject);
begin
if f_List_sales = nil then
application.CreateForm(tf_List_sales, f_List_sales);

f_List_sales.Show;
end;

procedure Tf_utama.ac_list_soExecute(Sender: TObject);
begin
if f_list_SO = nil then
application.CreateForm(tf_list_SO, f_list_SO);

f_list_SO.Show;
end;

procedure Tf_utama.tc_childChange(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Show;
      Break;
    end;
  end;
end;

procedure Tf_utama.utupSemua1Click(Sender: TObject);
var h: Integer;
begin
  for h:=0 to f_utama.MDIChildCount-1 do
  begin
    f_utama.MDIChildren[h].Close;
  end;
  tc_child.Visible:=False;
end;

procedure Tf_utama.utup1Click(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Close;
      Break;
    end;
  end;
end;

procedure Tf_utama.utupSemuaKecualiini1Click(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle <> cHandle then
    begin
      MDIChildren[k].Close;
    end;
  end;
  tc_child.Visible:=False;
end;

procedure Tf_utama.ac_return_kirimExecute(Sender: TObject);
begin
if not(HakAkses('gdTrReturnKirim')) then
begin
messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
  'melanjutkan AKSES ke dalamMENU ini...',mtWarning,[mbOk],0);
Exit;
end;

application.CreateForm(tf_return_kirim, f_return_kirim);
f_return_kirim.Show;
end;

procedure Tf_utama.ac_list_return_kirimExecute(Sender: TObject);
begin
if f_list_return_kirim = nil then
application.CreateForm(tf_list_return_kirim, f_list_return_kirim);

f_list_return_kirim.Show;
end;

procedure Tf_utama.panel_auto_width;
var x: integer;
    y: string;
begin
 for x:=0 to sb.Panels.Count-1 do
 begin
    y:= sb.Panels[x].text;
    sb.Panels[x].Width := sb.Canvas.TextWidth(y) +30;
 end;
end;

procedure Tf_utama.ac_realcardExecute(Sender: TObject);
begin
application.CreateForm(TF_lap,F_lap);
f_lap.ShowModal;
end;

function Tf_utama.HakAkses(kunci: string): Boolean;
begin
fungsi.SQLExec(dm.Q_temp,'select '+kunci+' from tb_user where kd_user="'+sb.Panels[0].Text+'" and kd_perusahaan="'+sb.Panels[3].Text+'"',true);
Result:= dm.Q_temp.FieldByName(kunci).AsBoolean;
end;

procedure Tf_utama.SbubahPasswordClick(Sender: TObject);
begin
//ubah password
Application.CreateForm(TF_ubahPassword,F_ubahPassword);
F_ubahPassword.ShowModal;
end;

procedure Tf_utama.cek_update;
var Appterbaru,URLcek,URLdownload: string;
    AppUpdate: TupdateTread;
begin
  fungsi.SQLExec(dm.Q_temp,'select * from app where kode = "update"',True);
  URLcek      := dm.Q_temp.FieldByName('URLcek').AsString;
  URLdownload := dm.Q_temp.FieldByName('URLdownload').AsString;

  AppUpdate:= TupdateTread.create(URLcek,fungsi.program_versi,URLdownload);
{      if MessageDlg('Aplikasi Gudang Terbaru Telah keluar:' + #13#10 +
        'Versi terbaru : ' + Appterbaru + #13#10#13#10 +
        'Download Applikasi Terbaru?',  mtWarning, [mbYes, mbNo], 0) = mrYes
        then
      begin
        ShellExecute(Self.WindowHandle,'open',PAnsiChar(URLdownload+'gudang'),nil,nil, SW_SHOWNORMAL);
      end;
}
end;

procedure Tf_utama.ac_cekUpdateExecute(Sender: TObject);
begin
  cek_update;
end;

constructor TupdateTread.create(UrlCek:string;CurrentVersion:string;UrlDownload:string);
begin
inherited create(False);
Self.FUrlCek:= UrlCek;
Self.FUrlDownload:=UrlDownload;
Self.FCurVer:= CurrentVersion;
FreeOnTerminate := True;
Resume;
end;

procedure TupdateTread.Execute;
begin
      Synchronize(ThreadExecute);
end;

procedure TupdateTread.ThreadExecute();
var Appterbaru: string;
begin
  isupdate:= False;
  
  Appterbaru:= UpdateApp(FUrlCek+'gudang');

  if Appterbaru <>''then
  begin
    if FCurVer<> Appterbaru then
    begin
      ShowMessage('applikasi terbaru sudah ada...');
      isupdate:= True;
    end;
  end;
end;

function TupdateTread.UpdateApp(const Url: string): string;
var
  NetHandle: HINTERNET;
  UrlHandle: HINTERNET;
  Buffer: array[0..1024] of Char;
  BytesRead: dWord;
begin
  //cek koneksi
  Result := '';

  if not(InternetGetConnectedState(nil,0))then
  begin
    Exit;
  end;

  NetHandle := InternetOpen('Delphi 5.x', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);

  if Assigned(NetHandle) then 
  begin
    UrlHandle := InternetOpenUrl(NetHandle, PChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);

    if Assigned(UrlHandle) then
      { UrlHandle valid? Proceed with download }
    begin
      FillChar(Buffer, SizeOf(Buffer), 0);
      repeat
        Result := Result + Buffer;
        FillChar(Buffer, SizeOf(Buffer), 0);
        InternetReadFile(UrlHandle, @Buffer, SizeOf(Buffer), BytesRead);
      until BytesRead = 0;
      InternetCloseHandle(UrlHandle);
    end
    else
      { UrlHandle is not valid. Raise an exception. }
      raise Exception.CreateFmt('Cannot open URL %s', [Url]);

    InternetCloseHandle(NetHandle);
  end
  else
    { NetHandle is not valid. Raise an exception }
    raise Exception.Create('Unable to initialize Wininet');
end;


procedure Tf_utama.ac_list_return_jualExecute(Sender: TObject);
begin
if f_list_return_jual = nil then
application.CreateForm(Tf_list_return_jual, f_list_return_jual);

f_list_return_jual.Show;
end;

end.

