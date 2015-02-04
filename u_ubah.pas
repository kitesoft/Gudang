unit u_ubah;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, StdCtrls, sEdit, sLabel, Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, ComCtrls, sStatusBar,
  ExtCtrls, DBCtrls,u_fungsi, Buttons, sBitBtn, sComboBox, sTooledit,
  sCheckBox, cxControls, cxDBNavigator, sGroupBox, sButton,DateUtils;

type
  TF_ubah_harga = class(TForm)
    sSkinProvider1: TsSkinProvider;
    Ed_Plu: TsEdit;
    Ed_deskripsi: TsEdit;
    ed_pokok: TsCurrencyEdit;
    ed_marginP: TsCurrencyEdit;
    ed_marginRp: TsCurrencyEdit;
    Ed_harga1: TsCurrencyEdit;
    ed_harga2: TsCurrencyEdit;
    ed_harga3: TsCurrencyEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    ed_qty1: TsCurrencyEdit;
    ed_qty2: TsCurrencyEdit;
    sCurrencyEdit3: TsCurrencyEdit;
    Ed_sat1: TsEdit;
    Ed_sat2: TsEdit;
    Ed_sat3: TsEdit;
    sb: TsStatusBar;
    btn_simpan: TsBitBtn;
    sBitBtn2: TsBitBtn;
    Ed_macam: TsEdit;
    cb_macam: TsComboBox;
    sLabel7: TsLabel;
    b_update: TsBitBtn;
    g_1: TsGroupBox;
    de_awal: TsDateEdit;
    l_1: TsLabel;
    de_ahir: TsDateEdit;
    l_2: TsLabel;
    ed_discP: TsCurrencyEdit;
    l_3: TsLabel;
    l_4: TsLabel;
    ed_discRp: TsCurrencyEdit;
    g_2: TsGroupBox;
    ed_harga3New: TsCurrencyEdit;
    ed_harga2New: TsCurrencyEdit;
    l_5: TsLabel;
    l_6: TsLabel;
    l_7: TsLabel;
    ed_harga1New: TsCurrencyEdit;
    ed_marginPNew: TsCurrencyEdit;
    ed_marginRpNew: TsCurrencyEdit;
    l_8: TsLabel;
    l_9: TsLabel;
    sButton1: TsButton;
    procedure FormShow(Sender: TObject);
    procedure ubah;
    procedure btn_simpanClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_macamChange(Sender: TObject);
    procedure ed_harga3Exit(Sender: TObject);
    procedure ed_pokokExit(Sender: TObject);
    procedure cb_periodikClick(Sender: TObject);
    procedure ed_harga2Exit(Sender: TObject);
    procedure ed_marginRpExit(Sender: TObject);
    procedure b_updateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sButton1Click(Sender: TObject);
    procedure harga_baru;
    procedure ed_discRpExit(Sender: TObject);
    procedure ed_discPExit(Sender: TObject);
    procedure Ed_harga1Exit(Sender: TObject);
    procedure de_ahirExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ubah_harga: TF_ubah_harga;
  fungsi:TFungsi;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure TF_ubah_harga.harga_baru;
begin
//merubah harga baru setelah diskon
if ed_harga3.Value <>0 then
ed_discP.Value:= (ed_discRp.Value/ed_harga3.Value)*100;

ed_harga3New.Value:= ed_harga3.Value - ed_discRp.Value;

ed_marginRpNew.Value:= ed_harga3New.Value-ed_pokok.Value;
if ed_pokok.Value<>0 then
ed_marginPNew.Value:= (ed_marginrpNew.Value/ed_pokok.Value)*100;
ed_harga2New.Value :=  ed_harga2.Value - (ed_discRp.Value*ed_qty2.Value);
ed_harga1New.Value :=  ed_harga1.Value - (ed_discRp.Value*ed_qty2.Value*ed_qty1.Value);
end;

procedure TF_ubah_harga.ubah;
var sat1,sat2,sat3:string;
begin
cb_macam.ItemIndex:=cb_macam.Items.IndexOf(dm.Q_harga.FieldByName('kd_macam_harga').AsString);

{if cb_macam.Text='HETK' then
  ed_macam.Text:='HARGA ECERAN' else
if cb_macam.Text='HGTK' then
  ed_macam.Text:='HARGA GROSIR' else
  ed_macam.Text:='';
}

  if cb_macam.Text='HGTK' then
  ed_macam.Text:='HARGA GROSIR' else
  begin
  ed_macam.Text:='HARGA ECERAN';
  cb_macam.ItemIndex:= 0;
  end;
  
ed_plu.Text:= dm.Q_harga.FieldByName('kd_barang').AsString;
ed_DESKRIPSI.Text:= dm.Q_harga.FieldByName('n_barang').AsString;
ed_pokok.Text:= dm.Q_harga.FieldByName('hpp_aktif').AsString;
ed_marginP.Text:= dm.Q_harga.FieldByName('laba_P').AsString;
ed_marginRp.Text:= dm.Q_harga.FieldByName('laba').AsString;
ed_harga1.Text:= dm.Q_harga.FieldByName('harga_jual1').AsString;
ed_harga2.Text:= dm.Q_harga.FieldByName('harga_jual2').AsString;
ed_harga3.Text:= dm.Q_harga.FieldByName('harga_jual3').AsString;
ed_qty1.Text:= dm.Q_harga.FieldByName('Qty1').AsString;
ed_qty2.Text:= dm.Q_harga.FieldByName('Qty2').AsString;
sat1:= dm.Q_harga.FieldByName('kd_sat1').AsString;
fungsi.SQLExec(dm.Q_Exe,'select * from tb_satuan where kd_satuan="'+sat1+'"',true);
ed_sat1.Text:= dm.Q_Exe.FieldByName('n_singkat').AsString;
sat2:= dm.Q_harga.FieldByName('kd_sat2').AsString;
fungsi.SQLExec(dm.Q_Exe,'select * from tb_satuan where kd_satuan="'+sat2+'"',true);
ed_sat2.Text:= dm.Q_Exe.FieldByName('n_singkat').AsString;
sat3:= dm.Q_harga.FieldByName('kd_sat3').AsString;
fungsi.SQLExec(dm.Q_Exe,'select * from tb_satuan where kd_satuan="'+sat3+'"',true);
ed_sat3.Text:= dm.Q_Exe.FieldByName('n_singkat').AsString;

de_awal.date:= dm.Q_harga.FieldByName('awal').AsDateTime;
de_ahir.date:= dm.Q_harga.FieldByName('ahir').AsDateTime;
ed_discRp.Text:= dm.Q_harga.FieldByName('diskon').AsString;
ed_discP.Text:= dm.Q_harga.FieldByName('diskonP').AsString;

harga_baru;

sb.SimpleText:= 'Updated at: '+dm.Q_harga.FieldByName('update').AsString+' by: '+dm.Q_harga.FieldByName('kode_user').AsString+'';

end;


procedure TF_ubah_harga.FormShow(Sender: TObject);
begin

if f_utama.sb.Panels[8].Text='PUSAT' then
begin
  ed_pokok.Enabled:= True;
  b_update.Visible:=True;
end else
begin
  ed_pokok.Enabled:= False;
  b_update.Visible:= False;
end;
end;

function caridanganti
  (sSrc, sLookFor, sReplaceWith : string) : string;
var
  nPos, nLenLookFor : integer;
begin
  nPos        := Pos(sLookFor, sSrc);
  nLenLookFor := Length(sLookFor);
  while (nPos > 0) do begin
    Delete(sSrc, nPos, nLenLookFor);
    Insert(sReplaceWith, sSrc, nPos);
    nPos := Pos(sLookFor, sSrc);
  end;
  Result := sSrc;
end;

procedure TF_ubah_harga.btn_simpanClick(Sender: TObject);
var posisi:integer;
begin
posisi:= dm.Q_harga.RecNo;

dm.My_conn.StartTransaction;
try
fungsi.SQLExec(dm.q_temp,'select * from tb_barang_harga where kd_perusahaan="'+
f_utama.sb.Panels[3].Text+'" and kd_barang="'+ed_plu.Text+'" and kd_macam_harga="'+cb_macam.Text+'"',true);

if dm.q_temp.Eof then
fungsi.SQLExec(dm.Q_Exe,'insert into tb_barang_harga(kd_perusahaan,kd_macam_harga,kd_barang,laba,laba_P,harga_jual1, '+
'harga_jual2,harga_jual3,kode_user,awal,ahir,`update`,diskon,diskonP) values ("'+
f_utama.sb.Panels[3].Text+'","'+cb_macam.Text+'","'+ed_plu.Text+'","'+
ed_marginrp.Text+'","'+caridanganti(ed_marginP.Text,',','.')+'","'+ed_harga1.Text+'","'+
ed_harga2.Text+'","'+ed_harga3.Text+'","'+f_utama.sb.Panels[0].Text+'","'+
formatdatetime('yyyy-MM-dd',de_awal.date)+'","'+formatdatetime('yyyy-MM-dd',de_ahir.Date)+'","'+
formatdatetime('yyyy-MM-dd', date())+'","'+ed_discRp.Text+'","'+caridanganti(ed_discP.Text,',','.')+'")',false) else
fungsi.SQLExec(dm.Q_Exe,'update tb_barang_harga set laba="'+
ed_marginRP.Text+'",laba_P="'+caridanganti(ed_marginP.Text,',','.')+'",harga_jual1="'+ed_harga1.Text+'",harga_jual2="'+
ed_harga2.Text+'",harga_jual3="'+ed_harga3.Text+'",kode_user="'+
f_utama.sb.Panels[0].Text+'",`update`="'+formatdatetime('yyyy-MM-dd', date())+'",awal="'+formatdatetime('yyyy-MM-dd',de_awal.Date)+'",ahir="'+
formatdatetime('yyyy-MM-dd',de_ahir.Date)+'",diskon="'+ed_discRp.Text+'",diskonP="'+
caridanganti(ed_discP.Text,',','.')+'" where kd_barang="'+ed_plu.Text+'" and kd_macam_harga="'+
cb_macam.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',false);

fungsi.SQLExec(dm.Q_Exe,'update tb_barang set hpp_aktif="'+ed_pokok.Text
+'",`update` = "'+formatdatetime('yyyy-MM-dd', date())+'" where kd_barang="'+ed_plu.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',false);

dm.Q_harga.Close;
dm.Q_harga.Open;
dm.Q_harga.RecNo:= posisi;
dm.My_conn.Commit;
showmessage('proses ubah harga berhasil');
close;

except on E:exception do
begin
dm.My_Conn.Rollback;
messagedlg('proses ubah harga gagal '#10#13''+e.Message, mterror, [mbOk],0);
end;
end;
end;

procedure TF_ubah_harga.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then close;
end;

procedure TF_ubah_harga.cb_macamChange(Sender: TObject);
begin
if cb_macam.Text='HETK' then
  ed_macam.Text:='HARGA ECERAN' else
if cb_macam.Text='HGTK' then
  ed_macam.Text:='HARGA GROSIR' else
  ed_macam.Text:='';


fungsi.SQLExec(dm.Q_temp,'select hpp_aktif from tb_barang where kd_barang="'+
ed_plu.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
ed_pokok.Text:= dm.Q_temp.fieldbyname('hpp_aktif').AsString;

fungsi.SQLExec(dm.Q_temp,'select * from tb_barang_harga where kd_barang = "'+
ed_plu.Text+'"and kd_macam_harga = "'+cb_macam.Text+'"',true);

ed_marginP.Text:= dm.Q_temp.FieldByName('laba_P').AsString;
ed_marginRp.Text:= dm.Q_temp.FieldByName('laba').AsString;
ed_harga1.Text:= dm.Q_temp.FieldByName('harga_jual1').AsString;
ed_harga2.Text:= dm.Q_temp.FieldByName('harga_jual2').AsString;
ed_harga3.Text:= dm.Q_temp.FieldByName('harga_jual3').AsString;

sb.SimpleText:= 'Updated at: '+dm.Q_temp.FieldByName('update').AsString+' by: '+dm.Q_temp.FieldByName('kode_user').AsString+''

end;

procedure TF_ubah_harga.ed_harga3Exit(Sender: TObject);
begin
ed_marginRp.Value:= ed_harga3.Value-ed_pokok.Value;
if ed_pokok.Value<>0 then 
ed_marginP.Value:= (ed_marginrp.Value/ed_pokok.Value)*100;
ed_harga2.Value :=  ed_harga3.Value*ed_qty2.Value;
ed_harga1.Value :=  ed_harga2.Value*ed_qty1.Value;
harga_baru;
end;

procedure TF_ubah_harga.ed_pokokExit(Sender: TObject);
begin
if ed_pokok.Value<>0 then
ed_marginrp.Value:= (ed_marginp.Value/100)*ed_pokok.Value;
ed_harga3.Value:=ed_pokok.Value+ed_marginrp.Value;
ed_harga2.Value:=ed_harga3.Value*ed_qty2.Value;
ed_harga1.Value:=ed_harga2.Value*ed_qty1.Value;

harga_baru;
end;

procedure TF_ubah_harga.cb_periodikClick(Sender: TObject);
begin
de_awal.Clear;
de_ahir.Clear;
de_awal.Enabled:=not(de_awal.Enabled);
de_ahir.Enabled:=not(de_ahir.Enabled);
end;

procedure TF_ubah_harga.ed_harga2Exit(Sender: TObject);
begin
ed_harga1.Value :=  ed_harga2.Value*ed_qty1.Value;
harga_baru;
end;

procedure TF_ubah_harga.ed_marginRpExit(Sender: TObject);
begin
if ed_pokok.Value<>0 then
ed_marginp.Value:= (ed_marginrp.Value/ed_pokok.Value)*100;
ed_harga3.Value :=  ed_pokok.Value+ed_marginrp.Value;
ed_harga2.Value :=  ed_harga3.Value*ed_qty2.Value;
ed_harga1.Value :=  ed_harga2.Value*ed_qty1.Value;
harga_baru;
end;

procedure TF_ubah_harga.b_updateClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_temp,'select hpp_ahir from tb_barang where kd_barang="'+
ed_plu.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
ed_pokok.Text:= dm.Q_temp.fieldbyname('hpp_ahir').Text;
ed_pokokExit(Sender);
end;

procedure TF_ubah_harga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
F_ubah_harga:=nil;
end;

procedure TF_ubah_harga.sButton1Click(Sender: TObject);
var x,banyak:Integer;
    tanggal:TDate;
begin
  banyak:= DaysBetween(de_awal.date, de_ahir.date)+1;
  tanggal:= de_awal.Date -1;

  for x:=0 to banyak do
  begin
    tanggal := tanggal + 1;
    if FormatDateTime('dd/MM/yyyy',Date()) = FormatDateTime('dd/MM/yyyy',tanggal) then
    begin
      sbutton1.Caption:='ONO';
      Exit;
    end  else sbutton1.Caption := 'GAK MASUK';
  end;
end;

procedure TF_ubah_harga.ed_discRpExit(Sender: TObject);
begin
harga_baru;
end;

procedure TF_ubah_harga.ed_discPExit(Sender: TObject);
begin
ed_discRp.Value:= (ed_discP.Value/100) * ed_harga3.Value;
harga_baru;
end;

procedure TF_ubah_harga.Ed_harga1Exit(Sender: TObject);
begin
harga_baru;
end;

procedure TF_ubah_harga.de_ahirExit(Sender: TObject);
begin
if de_ahir.Date < de_awal.Date then
   de_ahir.Date:= de_awal.Date;
end;

end.