unit u_purchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sTooledit, sEdit, Buttons,
  sSpeedButton, sButton, Mask, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sLabel, ExtCtrls, sPanel, sMemo, cxCustomData,
  cxGraphics, cxDataStorage, cxEdit, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxCurrencyEdit,UFungsi, sBevel, ComCtrls,
  sSkinProvider, cxImageComboBox, cxStyles, cxFilter,
  cxData, sDialogs,uTerbilang;

type                                               
  Tf_purchase = class(TForm)
    panel4: TsPanel;
    sPanel1: TsPanel;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    t_view_harga: TcxGridColumn;
    Level: TcxGridLevel;
    panel1: TsPanel;
    Mm_nama: TsMemo;
    ce_harga: TsCurrencyEdit;
    panel2: TsPanel;
    sBevel1: TsBevel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sb_supplier: TsSpeedButton;
    sb_cari: TsSpeedButton;
    L_supp: TsLabel;
    ed_no_faktur: TsEdit;
    ed_tgl: TsDateEdit;
    ed_supplier: TsEdit;
    ed_code: TsEdit;
    panel3: TsPanel;
    ed_nilai_faktur: TsCurrencyEdit;
    sSpeedButton18: TsSpeedButton;
    sSkinProvider1: TsSkinProvider;
    b_rekom: TsButton;
    sLabel5: TsLabel;
    sPanel2: TsPanel;
    b_simpan_file: TsButton;
    b_load: TsButton;
    od: TsOpenDialog;
    sd: TsSaveDialog;
    b_auto: TsButton;
    t_view_total_harga: TcxGridColumn;
    spnl1: TsPanel;
    b_new: TsButton;
    b_simpan: TsButton;
    b_print: TsButton;
    l_1: TsLabel;
    l_2: TsLabel;
    l_3: TsLabel;
    l_4: TsLabel;
    t_view_barcode: TcxGridColumn;
    procedure bersih;
    procedure tampil_data;
    procedure CreateRows;
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_newClick(Sender: TObject);
    procedure sb_supplierClick(Sender: TObject);
    procedure ed_supplierKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sb_cariClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure b_printClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_no_fakturChange(Sender: TObject);
    procedure sSpeedButton18Click(Sender: TObject);
    procedure b_rekomClick(Sender: TObject);
    procedure b_simpan_fileClick(Sender: TObject);
    procedure b_loadClick(Sender: TObject);
    procedure b_autoClick(Sender: TObject);
    procedure TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_no_fakturKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_purchase: Tf_purchase;
  sub_sub_total:integer;

implementation

uses u_dm, u_cari, u_utama, u_list_purchase;

{$R *.dfm}

procedure Tf_purchase.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(dm.metu_kabeh) then
begin
  if Assigned(active) then
  begin
    idx := f_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
    f_utama.tc_child.Tag := -1;
    f_utama.tc_child.TabIndex := idx;
    f_utama.tc_child.Tag := 0;
  end;
end;
end;

procedure Tf_purchase.bersih;
begin
l_supp.Caption:= '';
ed_tgl.Date:= now();
mm_nama.Clear;
ce_harga.Clear;
ed_supplier.Clear;
ed_no_faktur.Clear;
tableview.DataController.RecordCount:=0;
ed_nilai_faktur.Clear;
end;

procedure Tf_purchase.tampil_data;
Var h : Integer;
    x_hpp:real;
begin
ed_supplier.Text:= dm.Q_list_purchase.fieldbyname('kd_suplier').AsString;
l_supp.Caption:= dm.Q_list_purchase.fieldbyname('n_supp').AsString;
ed_no_faktur.Text:= dm.Q_list_purchase.fieldbyname('kd_purchase').AsString;
ed_tgl.Text:= formatdatetime('dd/MM/yyyy',dm.Q_list_purchase.fieldbyname('tgl_purchase').AsDateTime);

fungsi.SQLExec(dm.Q_temp,'select * from tb_purchase_rinci where kd_perusahaan="'+
dm.Q_list_purchase.fieldbyname('kd_perusahaan').AsString+'" and kd_purchase="'+
dm.Q_list_purchase.fieldbyname('kd_purchase').AsString+'"',true);

if dm.Q_temp.RecordCount<>0 then
begin
  tableview.DataController.RecordCount:= dm.Q_temp.RecordCount;
  for h:= 0 to dm.Q_temp.RecordCount-1 do
  begin
  TableView.DataController.SetValue(h, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
  TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(h, 2, dm.Q_temp.FieldByName('qty_purchase').AsString);
  TableView.DataController.SetValue(h, 4, dm.Q_temp.fieldbyname('harga_pokok').AsString);
  TableView.DataController.SetValue(h, 5, dm.Q_temp.fieldbyname('barcode').AsString);
  x_hpp:= dm.Q_temp.fieldbyname('harga_pokok').AsFloat/dm.Q_temp.FieldByName('qty_purchase').AsFloat;
  TableView.DataController.SetValue(h, 3, x_hpp);
  dm.Q_temp.Next;
  end;
  tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount+1);
end;
end;

procedure Tf_purchase.CreateRows;
var baris_baru: integer;
f: integer;
begin
if tableview.DataController.RecordCount<>0 then
begin
  for f:=0 to tableview.DataController.RecordCount-1 do
  begin
    if (pos(TableView.DataController.GetValue(f,0),dm.Q_temp.fieldbyname('kd_barang').AsString)>0)then
    begin
      TableView.DataController.SetValue(f, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
      TableView.DataController.SetValue(f, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
      TableView.DataController.SetValue(f, 2, TableView.DataController.GetValue(f,2) + 1);
      TableView.DataController.SetValue(f, 4, TableView.DataController.GetValue(f,2) * TableView.DataController.GetValue(f,3));
      TableView.DataController.SetValue(f, 5, dm.Q_temp.fieldbyname('barcode3').AsString);
      tableview.DataController.ChangeFocusedRecordIndex(f);
      exit;
    end;
  end;
end;

  baris_baru:= tableview.DataController.RecordCount+1;
  tableview.DataController.RecordCount:=baris_baru;
  TableView.DataController.SetValue(baris_baru-1, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
  TableView.DataController.SetValue(baris_baru-1, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(baris_baru-1, 2, 1);
  TableView.DataController.SetValue(baris_baru-1, 3, dm.Q_temp.fieldbyname('hpp_aktif').AsString);
  TableView.DataController.SetValue(baris_baru-1, 4, dm.Q_temp.fieldbyname('hpp_aktif').AsString);
  TableView.DataController.SetValue(baris_baru-1, 5, dm.Q_temp.fieldbyname('barcode3').AsString);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
  mm_nama.Text:= tableView.DataController.GetValue(baris_baru-1,1);
  ce_harga.Text:= tableView.DataController.GetValue(baris_baru-1,3);
end;

procedure Tf_purchase.ed_codeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
  if ed_code.Text='' then exit;
  fungsi.sqlExec(dm.Q_temp,'SELECT kd_barang,n_barang,barcode3, '+
  'hpp_aktif,kd_sat3 FROM tb_barang WHERE ((kd_barang = "'+
  ed_code.Text+'" OR barcode3 = "'+ed_code.Text+'" OR barcode2 = "'+
  ed_code.Text+'" OR barcode1 = "'+ed_code.Text+'") AND kd_perusahaan="'+f_utama.sb.Panels[3].Text+'")', true);
  if dm.Q_temp.RecordCount<>0 then
   begin
   createrows;
   end else
   begin
   showmessage('data tidak dapat ditemukan dalam daftar barang...');
   end;
ed_code.Clear
end;

if (key= vk_f2) and (sb_cari.Enabled= True) then sb_cariClick(Sender);

if key= vk_up then
begin
  if tableview.DataController.FocusedRecordIndex >=1 then
     tableview.DataController.ChangeFocusedRecordIndex(tableview.DataController.FocusedRecordIndex-1);
key:=VK_NONAME;

end;
if key= vk_down then
tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.FocusedRowIndex+1);

end;

procedure Tf_purchase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Shift=[ssctrl]) and (Key= vk_delete) then
if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
TableView.DataController.DeleteFocused;

if key=vk_f2 then ed_code.SetFocus;
if key=vk_f3 then grid.SetFocus;
if key=vk_f4 then sb_supplierClick(Sender);
if key=vk_f5 then b_autoClick(Sender);
end;

procedure Tf_purchase.b_newClick(Sender: TObject);
begin
bersih;
end;

procedure Tf_purchase.sb_supplierClick(Sender: TObject);
begin
ed_supplier.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kode,n_supp from tb_supp where kd_perusahaan="'+
            f_utama.sb.Panels[3].Text+'"';
    tblcap[0]:= 'Kode';
    tblCap[1]:= 'Nama Supplier';
    CariT := 9;
    tampil_button(True,True);
    if ShowModal = mrOk then
    begin
        ed_supplier.Text:=TblVal[0];
        L_supp.Caption:= tblval[1];
    end;
  finally
  close;
  end;
end;

procedure Tf_purchase.ed_supplierKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_return) and (sb_supplier.Enabled= True) then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
sb_supplierClick(Sender);
end;
end;

procedure Tf_purchase.sb_cariClick(Sender: TObject);
begin
  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_barang, n_barang from tb_barang where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"';
    tblcap[0]:= 'PID';
    tblCap[1]:= 'Deskripsi Barang';
    tampil_button(False,True);
    if ShowModal = mrOk then
    begin
        ed_code.Text:=TblVal[0];
    end;
  finally
  close;
  end;
end;

procedure Tf_purchase.b_simpanClick(Sender: TObject);
var x: integer;
isi_sql,kd_faktur:string;
begin    
if (ed_supplier.Text='') or (ed_no_faktur.Text='') then
begin
showmessage('Data Supplier dan no faktur harus di isi terlebih dahulu...');
exit;
end;

if (ed_no_faktur.Color=clblue) then
begin
showmessage('no faktur ini sudah ada dalam database....');
exit;
end;

if tableview.DataController.RecordCount=0 then
begin
showmessage('Data barang masih kosong...');
exit;
end;

kd_faktur:= ed_no_faktur.Text;

  for x:=0 to tableview.DataController.RecordCount-1 do
  begin
  isi_sql:=isi_sql +'("'+f_utama.sb.Panels[3].Text+'","'+ed_no_faktur.Text
  +'","'+formatdatetime('yyyy-MM-dd',ed_tgl.Date)+'","'+TableView.DataController.GetDisplayText(x,0)+'","'+
  TableView.DataController.GetDisplayText(x,1)+'","'+floattostr(TableView.DataController.GetValue(x,2))+'","'+
  floattostr(TableView.DataController.GetValue(x,4))+'","'+TableView.DataController.GetDisplayText(x,5)+'",date(now())),';
  end;
  delete(isi_sql,length(isi_sql),1);

dm.db_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_exe,'insert into tb_purchase_global(kd_perusahaan,kd_purchase,tgl_purchase,'+
'kd_suplier,nilai_faktur,pengguna,simpan_pada) values ("'+f_utama.sb.Panels[3].Text+'","'+ed_no_faktur.Text
+'","'+formatdatetime('yyyy-MM-dd',ed_tgl.Date)+'","'+ed_supplier.Text+'","'+
ed_nilai_faktur.Text+'","'+f_utama.Sb.Panels[0].Text+'",now())',false);

  fungsi.SQLExec(dm.Q_exe,'insert into tb_purchase_rinci(kd_perusahaan,kd_purchase,tgl_purchase,'+
  'kd_barang,n_barang,qty_purchase,harga_pokok,barcode,tgl_simpan) values  '+isi_sql, false);

dm.db_conn.Commit;

showmessage('penyimpanan data berhasil...');

ed_no_faktur.Clear;
ed_no_faktur.Text:= kd_faktur;
b_print.SetFocus;

except
on E:exception do
begin
dm.db_conn.Rollback;
messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message, mterror, [mbOk],0);
end;
end;
end;

procedure Tf_purchase.b_printClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_cetak_purchase where kd_perusahaan="'+
f_utama.sb.Panels[3].Text+'" and kd_purchase="'+ed_no_faktur.Text+'"',true);
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_purchase_rinci.fr3');
dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsFloat)+'Rupiah';
dm.laporan.ShowReport;
end;

procedure Tf_purchase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=cafree;
f_purchase:= nil;
f_utama.MDIChildDestroyed(Self.Handle);
end;

procedure Tf_purchase.ed_no_fakturChange(Sender: TObject);
var urip: Boolean; // jenenge mbahku :-)
begin
fungsi.SQLExec(dm.Q_temp,'select kd_purchase from tb_purchase_global where kd_purchase="'+
ed_no_faktur.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
if not(dm.Q_temp.Eof) then
begin
ed_no_faktur.Color:=clblue;
Caption:= 'PO ('+ed_no_faktur.Text+')';
f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] :=Caption;
urip:= True;
end else
begin
ed_no_faktur.Color:=clwhite;
Caption:= 'PO (New)';
f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] :=Caption;
urip:= False;
end;

sb_supplier.Enabled:=not(urip);
b_auto.Enabled:= not(urip);
sb_cari.Enabled:=not(urip);

b_simpan.Enabled:=not(urip);
b_print.Enabled:= urip;
b_rekom.Enabled:= not(urip);

ed_tgl.ReadOnly:=urip;
ed_code.ReadOnly:=urip;
end;

procedure Tf_purchase.sSpeedButton18Click(Sender: TObject);
begin
close;
end;

procedure Tf_purchase.b_rekomClick(Sender: TObject);
var h:integer;
begin
if (ed_supplier.Text='') then exit;

fungsi.SQLExec(dm.Q_temp,'select * from vw_purchase_order where kd_perusahaan="'+
f_utama.sb.panels[3].text+'" and kd_suplier="'+ED_SUPPLIER.Text+'" and aktif="Y"',true);

if dm.Q_temp.RecordCount<>0 then
begin
  tableview.DataController.RecordCount:= dm.Q_temp.RecordCount;
  for h:= 0 to dm.Q_temp.RecordCount-1 do
  begin
  TableView.DataController.SetValue(h, 0, dm.Q_temp.FieldByName('kode').AsString);
  TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(h, 2, dm.Q_temp.FieldByName('purchase_order').AsString);
  TableView.DataController.SetValue(h, 3, dm.Q_temp.fieldbyname('harga_pokok').AsString);
  TableView.DataController.SetValue(h, 4, strtofloatdef(dm.Q_temp.fieldbyname('harga_pokok').AsString,0)*strtofloatdef(dm.Q_temp.FieldByName('purchase_order').AsString,0));
  TableView.DataController.SetValue(h, 5, dm.Q_temp.fieldbyname('barcode').AsString);
  dm.Q_temp.Next;
  end;
end;
end;

procedure Tf_purchase.b_simpan_fileClick(Sender: TObject);
var
  F: TextFile;
  x: Integer;
begin
sd.InitialDir:= dm.DocPath;
if sd.Execute then
begin
  AssignFile(F, sd.FileName);
  Rewrite(F);
  Writeln(F, ed_supplier.text);
  Writeln(F, l_supp.caption);
  Writeln(F, ed_no_faktur.text);
  Writeln(F, ed_tgl.text);
  Writeln(F, tableview.DataController.RecordCount);
  for x:=0 to tableview.DataController.RecordCount-1 do
    begin
      Writeln(F, TableView.DataController.GetValue(x,0));
      Writeln(F, TableView.DataController.GetValue(x,1));
      Writeln(F, TableView.DataController.GetValue(x,2));
      Writeln(F, TableView.DataController.GetValue(x,3));
      Writeln(F, TableView.DataController.GetValue(x,4));
      Writeln(F, TableView.DataController.GetValue(x,5));
    end;
  CloseFile(F);
  fungsi.amankan(sd.FileName,sd.FileName,123);
//  bersih;
end;

end;

procedure Tf_purchase.b_loadClick(Sender: TObject);
var
  F: TextFile;
  Tmp, x: Integer;
  TmpStr: string;
begin
od.InitialDir:= dm.DocPath;
if od.Execute then
begin
  try
  fungsi.amankan(od.FileName,od.FileName,123);
  AssignFile(F, od.FileName);
  Reset(F);
  Readln(F, TmpStr);
  ed_supplier.text:= TmpStr;
  Readln(F, TmpStr);
  l_supp.caption:= TmpStr;
  Readln(F, TmpStr);
  ed_no_faktur.text:=TmpStr;
  Readln(F, TmpStr);
  ed_tgl.text:=TmpStr;
  Readln(F, Tmp);
  tableview.DataController.RecordCount:=Tmp;
  for x:=0 to tableview.DataController.RecordCount-1 do
    begin
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 0, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 1, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 2, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 3, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 4, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 5, TmpStr);
    end;
  CloseFile(F);
  
  tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount);
  mm_nama.Text:= tableView.DataController.GetValue(tableview.DataController.RecordCount-1,1);
  ce_harga.Text:= tableView.DataController.GetValue(tableview.DataController.RecordCount-1,3);

  fungsi.amankan(od.FileName,od.FileName,123);
  except
  ShowMessage('proses load data gagal...');
  end;
end;                  
end;

procedure Tf_purchase.b_autoClick(Sender: TObject);
var x:Integer;
pid,pid_temp:string;
begin
  if ed_supplier.Text='' then
  begin
    ShowMessage('untuk auto kode, supplier harus diisi terlebih dahulu');
    Exit;
  end;
  fungsi.SQLExec(dm.Q_temp,'select kd_purchase from tb_purchase_global where kd_suplier="'+
  ed_supplier.text+'" and kd_perusahaan = "'+f_utama.sb.Panels[3].Text
  +'" and kd_purchase like "PO-'+ed_supplier.text+'-%"order by kd_purchase',true);

  dm.Q_temp.First;

  for x:=1 to 10000 do
  begin
  if x<10    then pid:= 'PO-'+ed_supplier.text+'-000' else
  if x<100   then pid:= 'PO-'+ed_supplier.text+'-00' else
  if x<1000  then pid:= 'PO-'+ed_supplier.text+'-0' else
  if x<10000 then pid:= 'PO-'+ed_supplier.text+'-';

  pid_temp:= pid+inttostr(x);

  if dm.Q_temp.fieldbyname('kd_purchase').AsString=pid_temp then
  dm.Q_temp.Next else break;
  end;
  ed_no_faktur.Text:= pid_temp;
end;

procedure Tf_purchase.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
if (Atext <>'') then
ed_nilai_faktur.Value:= aVALUE
else ed_nilai_faktur.Clear;
end;

procedure Tf_purchase.FormShow(Sender: TObject);
begin
  if (f_utama.sb.Panels[8].Text='PUSAT') and (f_utama.HakAkses('gdTrPO')) then
  begin
  b_new.Enabled:=True;
  ed_no_faktur.Enabled:= True;
  b_rekom.Enabled:=True;
  end else
  begin
  b_new.Enabled:=false;
  ed_no_faktur.Enabled:= False;
  b_rekom.Enabled:=False;
  end;
end;

procedure Tf_purchase.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);

  ed_code.Width:= panel2.Width - 270;
end;

procedure Tf_purchase.ed_codeKeyPress(Sender: TObject; var Key: Char);
var kode: string;
b:Integer;
Qty,harga:real;
begin
{if not ((key>='0')and(key<='9')or(key=#8) or(key=#43) or (Key=#47)) then
begin
key:=#0;
Exit;
end;
}
if TableView.DataController.RecordCount=0 then Exit;

Qty    := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,2);
harga  := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,3);


kode:=Ed_Code.Text;

b:= TableView.DataController.GetFocusedRecordIndex;

 if key=#43 then // tanda + (repeat)
 begin
  delete(kode,pos('+',kode),1);
  ed_code.Clear;
  key:=#0;

  if (StrToIntDef(kode,0) = 0) or (Length(kode) =0) then Exit;

  TableView.DataController.SetValue(b, 2, kode); //Qty
  TableView.DataController.SetValue(b, 4, harga * StrToFloatdef(kode,0)); //total harga
 end;

 if Key=#47 then //tanda (/)  ubah harga
 begin
    delete(kode,pos('/',kode),1);
    ed_code.Clear;
    key:=#0;

    if (Length(kode) =0) then Exit;

  TableView.DataController.SetValue(b, 3, kode); //harga baru
  TableView.DataController.SetValue(b, 4, Qty * StrToFloatdef(kode,0)); //total harga
 end;
end;

procedure Tf_purchase.ed_no_fakturKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key= vk_return) and (b_auto.Enabled= True) then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
b_autoClick(Self);
end;
end;

procedure Tf_purchase.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if tableview.DataController.RecordCount=0 then
begin
mm_nama.Clear;
ce_harga.Clear;
exit;
end;
try
mm_nama.Text:= AFocusedRecord.DisplayTexts[1];
ce_harga.Value:= StrToIntDef(AFocusedRecord.Values[3],0);
except
end;
end;

procedure Tf_purchase.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if (ed_no_faktur.Color <> clblue) and (tableview.DataController.RecordCount>=1) then
begin
case MessageBox(0, 'Data Belum disimpan, '+#13+#10+'apakah anda akan menyimpan data ini???',
'Central of Profit', MB_ICONWARNING or MB_YESNOCANCEL) of
  idYes:
  begin
    b_simpanClick(Self);
    CanClose:= False;
  end;
  idNo:CanClose:= True;
  IDCANCEL:
  begin
    ed_code.SetFocus;
    CanClose:= False;
  end;  
end;

end;  
end;

end.
