unit u_planogram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, sLabel, sEdit,u_fungsi,
  sSpinEdit, sButton, sSkinProvider, cxStyles,
  cxGraphics, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, sCheckBox,
  Mask, sMaskEdit, sCustomComboEdit, sCurrEdit, 
  cxCustomData, cxFilter, cxData, sCurrencyEdit, sSpeedButton, ExtCtrls,
  sPanel, DBCtrls, ComCtrls, sPageControl, mySQLDbTables, sSplitter;

type
  Tf_planogram = class(TForm)
    pc_plano: TsPageControl;
    ts_rak: TsTabSheet;
    ts_barang: TsTabSheet;
    sb_cari: TsSpeedButton;
    grid_plano: TcxGrid;
    t_data_plano: TcxGridDBTableView;
    dt_No: TcxGridDBColumn;
    dt_PID: TcxGridDBColumn;
    dt_barcode: TcxGridDBColumn;
    dt_nama: TcxGridDBColumn;
    dt_kk: TcxGridDBColumn;
    dt_db: TcxGridDBColumn;
    dt_ab: TcxGridDBColumn;
    dt_kap: TcxGridDBColumn;
    dt_display: TcxGridDBColumn;
    l_data_plano: TcxGridLevel;
    ed_masuk: TsEdit;
    p1: TsPanel;
    l_1: TsLabel;
    l_2: TsLabel;
    l_set: TsLabel;
    l_notset: TsLabel;
    se_rak: TsSpinEdit;
    se_shelving: TsSpinEdit;
    b_cetak: TsButton;
    sButton1: TsButton;
    ce_set: TsCurrencyEdit;
    ce_notset: TsCurrencyEdit;
    sSkinProvider1: TsSkinProvider;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid: TcxGrid;
    TvPlanoBarang: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    LvPlanoBarang: TcxGridLevel;
    edBarang: TsEdit;
    SbBarang: TsSpeedButton;
    ds_plano: TDataSource;
    Q_plano: TmySQLQuery;
    tPlanoBarangColumn1: TcxGridDBColumn;
    tPlanoBarangColumn2: TcxGridDBColumn;
    t_data_planoColumn1: TcxGridDBColumn;
    ts_Double: TsTabSheet;
    GridBarangD: TcxGrid;
    t_BarangD: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    LvBarangD: TcxGridLevel;
    GridPlanoD: TcxGrid;
    t_PlanoD: TcxGridDBTableView;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    LvPlanoD: TcxGridLevel;
    Q_barangD: TmySQLQuery;
    ds_BarangD: TDataSource;
    Q_PlanoD: TmySQLQuery;
    ds_PlanoD: TDataSource;
    spltrD1: TsSplitter;
    pPlanoD: TsPanel;
    btnRefresh: TsButton;
    btnHapus: TsButton;
    ds_planoRak: TDataSource;
    Q_planoRak: TmySQLQuery;
    procedure plano_double;
    procedure hapusPlanogram(aQuery:TmySQLQuery);
    procedure segarkan;
    procedure se_rakChange(Sender: TObject);
    procedure se_shelvingChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_data_planoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure b_cetakClick(Sender: TObject);
    procedure ed_masukKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sButton1Click(Sender: TObject);
    procedure sb_cariClick(Sender: TObject);
    procedure l_setClick(Sender: TObject);
    procedure l_notsetClick(Sender: TObject);
    procedure l_setMouseEnter(Sender: TObject);
    procedure l_setMouseLeave(Sender: TObject);
    procedure ed_masukKeyPress(Sender: TObject; var Key: Char);
    procedure segarkan_barang;
    procedure pc_planoPageChanging(Sender: TObject; NewPage: TsTabSheet;
      var AllowChange: Boolean);
    procedure edBarangKeyPress(Sender: TObject; var Key: Char);
    procedure edBarangKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TvPlanoBarangKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure t_BarangDFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure pc_planoChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure t_PlanoDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_planogram: Tf_planogram;
  fungsi:tfungsi;
  kd_barang: string;

implementation

uses u_dm, u_utama, u_cari;

{$R *.dfm}

procedure Tf_planogram.se_rakChange(Sender: TObject);
begin
{if se_rak.Value>0 then
begin
fungsi.SQLExec(dm.Q_plano,'select * from vw_planogram_set where (kd_perusahaan="'+f_utama.sb.Panels[3].Text
+'" and no_rak='+se_rak.Text+' and no_shelving='+se_shelving.Text+')',true);

se_shelving.Enabled:= true
end else  se_shelving.Enabled:= false;
}
if se_rak.Value>0 then
se_shelving.Enabled:= true
else
se_shelving.Enabled:= false;

se_shelving.Value:=0;
end;

procedure Tf_planogram.se_shelvingChange(Sender: TObject);
begin
if se_shelving.Value>0 then
begin
fungsi.SQLExec(Q_planoRak,'select * from vw_planogram_set where (kd_perusahaan="'+f_utama.sb.Panels[3].Text
+'" and no_rak='+se_rak.Text+' and no_shelving='+se_shelving.Text+')',true);
end else
begin
  Q_planoRak.Close;
end;
end;

procedure Tf_planogram.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Q_planoRak.Close;
action:= cafree;
end;

procedure Tf_planogram.t_data_planoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key= vk_delete) then
  begin
    hapusPlanogram(Q_planoRak);

    fungsi.SQLExec(Q_planoRak,'select * from vw_planogram_set where (kd_perusahaan="'+f_utama.sb.Panels[3].Text
    +'" and no_rak="'+se_rak.Text+'" and no_shelving="'+se_shelving.Text+'")',true);

    segarkan;
  end;
end;

procedure Tf_planogram.FormShow(Sender: TObject);
begin
segarkan;
pc_plano.ActivePage:= ts_rak;
end;

procedure Tf_planogram.b_cetakClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_planogram where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
dm.laporan.LoadFromFile(dm.WPath + '\laporan\gp_planogram.fr3');
dm.laporan.ShowReport;
end;

procedure Tf_planogram.ed_masukKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var x_data:integer;
begin
if key= vk_f2 then sb_cariClick(Sender);

if key =vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
if (not(se_rak.Enabled)) or (not(se_shelving.Enabled)) or (ed_masuk.Text='') then exit;

  fungsi.SQLExec(dm.Q_temp,'select kd_barang from tb_barang where (kd_perusahaan="'+
  f_utama.sb.Panels[3].Text+'") and (kd_barang ="'+ed_masuk.Text+'" or barcode1 ="'+ed_masuk.Text
  +'" or barcode2 = "'+ed_masuk.Text+'" or barcode3 = "'+ed_masuk.Text+'")',true);

  if dm.Q_temp.Eof then
  begin
  showmessage('data barang tidak ada....');
  se_rak.SetFocus;
  ed_masuk.SetFocus;
  end else
  begin
  x_data:= Q_planoRak.RecordCount+1;

  dm.My_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_Exe,'insert into tb_planogram(kd_perusahaan,kd_barang,no_rak,no_shelving,no_urut,`update`) values("'+
    f_utama.sb.Panels[3].Text+'","'+dm.Q_temp.fieldbyname('kd_barang').AsString+'","'+se_rak.Text+'","'+
//    se_shelving.Text+'","'+inttostr(x_data)+'","'+formatdatetime('yyyy-MM-dd', date())+'")',false);
    se_shelving.Text+'","0","'+formatdatetime('yyyy-MM-dd', date())+'")',false);

    fungsi.SQLExec(Q_planoRak,'select * from vw_planogram_set where (kd_perusahaan="'+f_utama.sb.Panels[3].Text
    +'" and no_rak="'+se_rak.Text+'" and no_shelving="'+se_shelving.Text+'")',true);

    Q_planoRak.First;

    segarkan;

    ed_masuk.Clear;
    ed_masuk.SetFocus;
    dm.My_conn.Commit;
except on e:exception do begin
  dm.My_conn.Rollback;
  showmessage('pemindahan data gagal '#10#13'' +e.Message);
  end;
end;
  end;
end;

if key= vk_up then
begin
  if t_data_plano.DataController.FocusedRecordIndex >=1 then
     t_data_plano.DataController.FocusedRecordIndex:=
     t_data_plano.DataController.FocusedRecordIndex-1;
  key:=VK_NONAME;
end;

if key= vk_down then
t_data_plano.DataController.FocusedRowIndex:=
t_data_plano.DataController.FocusedRowIndex+1;

if (Shift=[ssctrl]) and (Key= vk_delete) then
  begin
    hapusPlanogram(Q_planoRak);

    fungsi.SQLExec(Q_planoRak,'select * from vw_planogram_set where (kd_perusahaan="'+f_utama.sb.Panels[3].Text
    +'" and no_rak="'+se_rak.Text+'" and no_shelving="'+se_shelving.Text+'")',true);

    segarkan;
  end;

end;

procedure Tf_planogram.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then close;

if Key=vk_f2 then ed_masuk.SetFocus;
if key=vk_f3 then se_rak.SetFocus;
if key=vk_f4 then se_shelving.SetFocus;
if key=vk_f5 then grid_plano.SetFocus;
end;

procedure Tf_planogram.sButton1Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_planogram where kd_perusahaan="'+
f_utama.sb.Panels[3].Text+'" and no_rak ='+se_rak.Text+'',true);
dm.laporan.LoadFromFile(dm.WPath + '\laporan\gp_planogram.fr3');
dm.laporan.ShowReport;
end;

procedure Tf_planogram.segarkan;
var all_brg:integer;
begin
fungsi.SQLExec(dm.Q_Exe,'select count(kd_barang) as all_jumlah from tb_barang where kd_perusahaan="'+
f_utama.sb.Panels[3].Text+'"',true);
all_brg:= dm.Q_Exe.fieldbyname('all_jumlah').AsInteger;

fungsi.SQLExec(dm.Q_Exe,'select count(distinct kd_barang) as jumlah from tb_planogram where kd_perusahaan="'+
f_utama.sb.Panels[3].Text+'"',true);
ce_set.Value:= dm.Q_Exe.fieldbyname('jumlah').AsInteger;;
ce_notset.Value:=all_brg-ce_set.Value;
end;

procedure Tf_planogram.sb_cariClick(Sender: TObject);
begin
if pc_plano.ActivePage = ts_rak then
ed_masuk.SetFocus else
edBarang.SetFocus;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_barang, n_barang from tb_barang where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"';
    tblcap[0]:= 'PID';
    tblCap[1]:= 'Deskripsi Barang';
    tampil_button(False,True);
    if ShowModal = mrOk then
    begin
        if pc_plano.ActivePage = ts_rak then
        ed_masuk.Text:=TblVal[0] else
        edBarang.Text:= tblval[0];
    end;
  finally
  close;
  end;
end;

procedure Tf_planogram.l_setClick(Sender: TObject);
begin
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_barang, n_barang from tb_barang where kd_perusahaan="'+
            f_utama.sb.Panels[3].Text+'" and kd_barang IN '+
            '(select kd_barang from tb_planogram where kd_perusahaan="'+
            f_utama.sb.Panels[3].Text+'" GROUP BY kd_barang)';
    tblcap[0]:= 'PID';
    tblCap[1]:= 'Deskripsi Barang';
    tampil_button(False,False);
    ShowModal;
  finally
  close;
  end;

end;

procedure Tf_planogram.l_notsetClick(Sender: TObject);
begin
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_barang, n_barang from tb_barang where kd_perusahaan="'+
            f_utama.sb.Panels[3].Text+'" and kd_barang not IN '+
            '(select kd_barang from tb_planogram where kd_perusahaan="'+
            f_utama.sb.Panels[3].Text+'" GROUP BY kd_barang)';
    tblcap[0]:= 'PID';
    tblCap[1]:= 'Deskripsi Barang';
    tampil_button(False,False);
    ShowModal;
  finally
  close;
  end;
end;

procedure Tf_planogram.l_setMouseEnter(Sender: TObject);
begin
with TsLabel(Sender).Font do
begin
  style:= Style + [fsBold,fsUnderline];
end;
end;

procedure Tf_planogram.l_setMouseLeave(Sender: TObject);
begin
with TsLabel(Sender).Font do
begin
  style:= Style - [fsBold,fsUnderline];
end;
end;

procedure Tf_planogram.ed_masukKeyPress(Sender: TObject; var Key: Char);
var kode: string;
begin
kode:= ed_masuk.Text;

 if key=#43 then // tanda + ubah no
 begin
  delete(kode,pos('+',kode),1);
  ed_masuk.Clear;
  key:=#0;

  if Q_planoRak.RecordCount=0 then Exit;
  
  if (StrToIntDef(kode,0) = 0) or (Length(kode) =0) or (Length(kode) >3) then Exit;

  Q_planoRak.Edit;
  Q_planoRak.FieldByName('no_urut').AsString:= kode;
  Q_planoRak.Post;
 end;

 if Key=#47 then //tanda (/)  ubah rak
 begin
    delete(kode,pos('/',kode),1);
    ed_masuk.Clear;
    key:=#0;

    if (StrToIntDef(kode,0) = 0) or (Length(kode) =0) or (Length(kode) >4) then
    se_rak.Value:= 0 else
    se_rak.Text:= kode;
 end;

 if Key=#42 then //tanda (*)  ubah shelving
 begin
    delete(kode,pos('/',kode),1);
    ed_masuk.Clear;
    key:=#0;

    if (StrToIntDef(kode,0) = 0) or (Length(kode) =0) or (Length(kode) >2) then
    se_shelving.Value:=0 else
    se_shelving.Text:= kode;
 end;
end;

procedure Tf_planogram.segarkan_barang;
begin
//untuk me refresh barang
fungsi.SQLExec(Q_plano,'select * from vw_planogram_set where kd_perusahaan="'+f_utama.sb.Panels[3].Text
+'" and (no_rak=0 or no_shelving=0 or no_urut=0)',true);
end;

procedure Tf_planogram.pc_planoPageChanging(Sender: TObject;
  NewPage: TsTabSheet; var AllowChange: Boolean);
begin
if (NewPage =ts_barang) then
segarkan_barang;
end;

procedure Tf_planogram.edBarangKeyPress(Sender: TObject; var Key: Char);
var kode: string;
begin
kode:= edBarang.Text;

 if key=#43 then // tanda + ubah no
 begin
  delete(kode,pos('+',kode),1);
  ed_masuk.Clear;
  key:=#0;

  if Q_plano.RecordCount=0 then Exit;

  if (StrToIntDef(kode,0) = 0) or (Length(kode) =0) or (Length(kode) >3) then Exit;

  Q_plano.Edit;
  Q_plano.FieldByName('no_urut').AsString:= kode;
  Q_plano.Post;
 end;

 if Key=#47 then //tanda (/)  ubah rak
 begin
    delete(kode,pos('/',kode),1);
    ed_masuk.Clear;
    key:=#0;

  if Q_plano.RecordCount=0 then Exit;

  if (StrToIntDef(kode,0) = 0) or (Length(kode) =0) or (Length(kode) >3) then Exit;

  Q_plano.Edit;
  Q_plano.FieldByName('no_rak').AsString:= kode;
  Q_plano.Post;
 end;

 if Key=#42 then //tanda (*)  ubah shelving
 begin
    delete(kode,pos('/',kode),1);
    ed_masuk.Clear;
    key:=#0;

  if Q_plano.RecordCount=0 then Exit;

  if (StrToIntDef(kode,0) = 0) or (Length(kode) =0) or (Length(kode) >3) then Exit;

  Q_plano.Edit;
  Q_plano.FieldByName('no_shelving').AsString:= kode;
  Q_plano.Post;
 end;
end;

procedure Tf_planogram.edBarangKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key= vk_f2 then sb_cariClick(Sender);

if key =vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
  if (edBarang.Text='') then exit;

  fungsi.SQLExec(dm.Q_temp,'select kd_barang from tb_barang where (kd_perusahaan="'+
  f_utama.sb.Panels[3].Text+'") and (kd_barang ="'+edBarang.Text+'" or barcode1 ="'+edBarang.Text
  +'" or barcode2 = "'+edBarang.Text+'" or barcode3 = "'+edBarang.Text+'")',true);

  if dm.Q_temp.Eof then
  begin
  showmessage('data barang tidak ada....');
  cxGrid.SetFocus;
  edBarang.SetFocus;
  end else
  begin
    dm.My_conn.StartTransaction;
    try
      fungsi.SQLExec(dm.Q_Exe,'insert into tb_planogram(kd_perusahaan,kd_barang,`update`) values("'+
      f_utama.sb.Panels[3].Text+'","'+dm.Q_temp.fieldbyname('kd_barang').AsString+'",date(now()))',false);

      segarkan_barang;

      edBarang.Clear;
      edBarang.SetFocus;
      dm.My_conn.Commit;
    except on e:exception do begin
      dm.My_conn.Rollback;
      showmessage('pemindahan data gagal '#10#13'' +e.Message);
      end;
    end;
  end;
end;


if key= vk_up then
begin
  if TvPlanoBarang.DataController.FocusedRecordIndex >=1 then
     TvPlanoBarang.DataController.FocusedRecordIndex:=
     TvPlanoBarang.DataController.FocusedRecordIndex-1;
  key:=VK_NONAME;
end;

if key= vk_down then
TvPlanoBarang.DataController.FocusedRowIndex:=
TvPlanoBarang.DataController.FocusedRowIndex+1;

if (Shift=[ssctrl]) and (Key= vk_delete) then
  begin
    hapusPlanogram(Q_plano);
    segarkan_barang;
    segarkan;
  end;
end;

procedure Tf_planogram.hapusPlanogram(aQuery:TmySQLQuery);
begin
if MessageDlg('Yakinkah, akan menghapus data ini?...', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
begin
dm.My_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_Exe,'delete from tb_planogram where kd_perusahaan="'+f_utama.sb.Panels[3].Text
+'" and kd_barang="'+aQuery.fieldbyname('kd_barang').AsString+'" and no_rak="'+
aQuery.fieldbyname('no_rak').AsString+'" and no_shelving="'+
aQuery.fieldbyname('no_shelving').AsString+'" and no_urut="'+
aQuery.fieldbyname('no_urut').AsString+'"',false);

dm.My_conn.Commit;
except on e:exception do begin
  dm.My_conn.Rollback;
  showmessage('penghapusan data gagal '#10#13'' +e.Message);
  end;
end;
end;
end;

procedure Tf_planogram.TvPlanoBarangKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key= vk_delete) then
  begin
    hapusPlanogram(Q_plano);
    segarkan_barang;
    segarkan;
  end;
end;

procedure Tf_planogram.plano_double;
begin
fungsi.SQLExec(Q_barangD,'select * from vw_planogram_double where kd_perusahaan = "'+
f_utama.sb.Panels[3].Text+'"',True);
fungsi.SQLExec(Q_PlanoD,'select * from tb_planogram where kd_perusahaan = "'+
f_utama.sb.Panels[3].Text+'" and kd_barang="'+Q_barangD.fieldbyname('kd_barang').AsString+'"',True);
end;

procedure Tf_planogram.t_BarangDFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
fungsi.SQLExec(Q_PlanoD,'select * from tb_planogram where kd_perusahaan = "'+
f_utama.sb.Panels[3].Text+'" and kd_barang="'+Q_barangD.fieldbyname('kd_barang').AsString+'"',True);
end;

procedure Tf_planogram.pc_planoChange(Sender: TObject);
begin
if pc_plano.ActivePage = ts_Double then
  if Q_barangD.IsEmpty then plano_double;
end;

procedure Tf_planogram.btnRefreshClick(Sender: TObject);
begin
plano_double;
end;

procedure Tf_planogram.btnHapusClick(Sender: TObject);
begin
hapusPlanogram(Q_PlanoD);
plano_double;
end;

procedure Tf_planogram.t_PlanoDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key= vk_delete) then
  begin
    btnHapusClick(Self);
  end;
end;

end.