unit u_list_kirim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, sSkinProvider, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, Buttons, sBitBtn,
  ExtCtrls, sPanel,U_fungsi, sSpeedButton, cxCurrencyEdit, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sLabel, sCheckBox, sComboBox, sButton,
  sDialogs,FileCtrl;

type
  TF_list_kirim = class(TForm)
    sPanel1: TsPanel;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    t_datan_supp: TcxGridDBColumn;
    t_datakd_purchase: TcxGridDBColumn;
    t_datatgl_purchase: TcxGridDBColumn;
    t_datanilai_faktur: TcxGridDBColumn;
    t_dataColumn1: TcxGridDBColumn;
    l_data: TcxGridLevel;
    sSkinProvider1: TsSkinProvider;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    p1: TsPanel;
    l_1: TsLabel;
    l_2: TsLabel;
    de_mulai: TsDateEdit;
    de_sampai: TsDateEdit;
    cb_belum: TsCheckBox;
    cbCabang: TsComboBox;
    btnSimpan: TsButton;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure segarkan;
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure cb_belumClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_list_kirim: TF_list_kirim;
  fungsi:tfungsi;

implementation

uses u_dm, U_kirim, u_utama;

{$R *.dfm}

procedure TF_list_kirim.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(metu_kabeh) then
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

procedure TF_list_kirim.segarkan;
begin
btnSimpan.Enabled:= False;
  if not(cb_belum.Checked) then
  begin
    fungsi.SQLExecT(dm.Q_list_kirim,'select * from vw_list_kirim  where kd_perusahaan="'+f_utama.sb.panels[3].Text+'"  and tgl_kirim >= '+
    quotedstr(FormatDateTime('yyyy-MM-dd',de_mulai.Date))+' and tgl_kirim <= '+quotedstr(FormatDateTime('yyyy-MM-dd',de_sampai.Date))+'',true);
  end
  else
  begin
    fungsi.SQLExecT(dm.Q_list_kirim,'call sp_belum_kirim("'+cbCabang.Text+'")',True);
    btnSimpan.Enabled:= True;
  end;
end;

procedure TF_list_kirim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
action:= cafree;
F_list_kirim:= nil;
end;

procedure TF_list_kirim.t_dataCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
application.CreateForm(tF_kirim, F_kirim);

F_kirim.Show;
F_kirim.tampil_data;
end;


procedure TF_list_kirim.FormCreate(Sender: TObject);
var
  Year, Month, Day: Word;
begin
DecodeDate(Now, Year, Month, Day);
de_mulai.Date:= EncodeDate(Year,Month,1);
de_sampai.Date:= Date();

f_utama.MDIChildCreated(self.Handle);
segarkan;
end;

procedure TF_list_kirim.sb_1Click(Sender: TObject);
begin
close;
end;

procedure TF_list_kirim.sb_2Click(Sender: TObject);
begin
segarkan;
end;

procedure TF_list_kirim.cb_belumClick(Sender: TObject);
begin
cbCabang.Visible:= cb_belum.Checked;
btnSimpan.Visible:= cbCabang.Visible;
end;

procedure TF_list_kirim.btnSimpanClick(Sender: TObject);
var
  tempat,nama_file : string;
  y: Integer;
  F: TextFile;
  qty,hpp,tot:Real;
begin
if SelectDirectory('Pilih Folder', ExtractFileDrive(dm.WPath), tempat) then
  begin
    dm.Q_list_kirim.First;
    while not(dm.Q_list_kirim.Eof) do
    begin
    fungsi.SQLExec(dm.Q_temp,'select * from tb_kirim_rinci where kd_perusahaan="'+
    dm.Q_list_kirim.fieldbyname('kd_perusahaan').AsString+'" and kd_kirim="'+
    dm.Q_list_kirim.fieldbyname('kd_kirim').AsString+'"',true);

    nama_file:= tempat+'\'+dm.Q_list_kirim.fieldbyname('kd_kirim').AsString+'.skr';

      AssignFile(F, nama_file);
      Rewrite(F);
      Writeln(F, dm.Q_list_kirim.fieldbyname('kd_tk_kirim').AsString);
      Writeln(F, dm.Q_list_kirim.fieldbyname('n_pelanggan').AsString);
      Writeln(F, dm.Q_list_kirim.fieldbyname('kd_kirim').AsString);
      Writeln(F, formatdatetime('dd/MM/yyyy',dm.Q_list_kirim.fieldbyname('tgl_kirim').AsDateTime));
      Writeln(F, dm.q_temp.recordcount);

      if dm.Q_temp.RecordCount<>0 then
      begin
        for y:= 0 to dm.Q_temp.RecordCount-1 do
        begin
          qty:= dm.Q_temp.FieldByName('qty_kirim').AsFloat;
          hpp:=dm.Q_temp.fieldbyname('harga_pokok').AsFloat;
          tot:= hpp/qty;

          Writeln(F, dm.Q_temp.FieldByName('kd_barang').AsString);
          Writeln(F, dm.Q_temp.fieldbyname('n_barang').AsString);
          Writeln(F, dm.Q_temp.FieldByName('qty_kirim').asstring);
          Writeln(F, floattostr(tot));
          Writeln(F, dm.Q_temp.fieldbyname('harga_pokok').AsString);
          Writeln(F, dm.Q_temp.fieldbyname('barcode').AsString);

          dm.Q_temp.Next;
        end;
      end;
      CloseFile(F);
      fungsi.amankan(nama_file,nama_file,321);

    dm.Q_list_kirim.Next;
    end;
  showmessage('penyimpanan data berhasil...');
  end;
end;

end.
