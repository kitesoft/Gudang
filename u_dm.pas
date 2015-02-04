unit u_dm;

interface

uses
  SysUtils, Classes, mySQLDbTables, DB, sSkinManager, dialogs,forms,
  ImgList, Controls, acAlphaImageList, frxClass, frxDBSet,inifiles,
  frxDesgn,  frxBarcode, cxStyles,Windows,raw_ping, frxExportXML;

type
  Tdm = class(TDataModule)
    My_conn: TmySQLDatabase;
    ds_show: TDataSource;
    Q_Exe: TmySQLQuery;
    Q_Show: TmySQLQuery;
    sm: TsSkinManager;
    Q_temp: TmySQLQuery;
    gambar: TsAlphaImageList;
    Q_harga: TmySQLQuery;
    ds_harga: TDataSource;
    Laporan: TfrxReport;
    q_list_purchase: TmySQLQuery;
    ds_list_purchase: TDataSource;
    Q_list_receipt: TmySQLQuery;
    ds_list_receipt: TDataSource;
    q_list_return: TmySQLQuery;
    ds_list_return: TDataSource;
    Q_laporan: TmySQLQuery;
    db_Laporan: TfrxDBDataset;
    image: TsAlphaImageList;
    ds_list_kirim: TDataSource;
    Q_list_kirim: TmySQLQuery;
    ds_list_sales: TDataSource;
    Q_list_sales: TmySQLQuery;
    ds_list_so: TDataSource;
    Q_List_SO: TmySQLQuery;
    ds_list_return_kirim: TDataSource;
    Q_list_return_kirim: TmySQLQuery;
    frxdsgnr1: TfrxDesigner;
    frxbrcdbjct1: TfrxBarCodeObject;
    stl_focus: TcxStyleRepository;
    cxstyl1: TcxStyle;
    Q_mutasi: TmySQLQuery;
    ds_mutasi: TDataSource;
    ds_child_sales: TDataSource;
    Q_child_sales: TmySQLQuery;
    Q_gross: TmySQLQuery;
    ds_gross: TDataSource;
    Q_stock_out: TmySQLQuery;
    ds_stock_out: TDataSource;
    frxmlxprt1: TfrxXMLExport;
    ds_barang: TDataSource;
    Q_barang: TmySQLQuery;
    ds_list_return_jual: TDataSource;
    Q_list_return_jual: TmySQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure smAfterChange(Sender: TObject);
    procedure koneksikan;
  private
    { Private declarations }
  public
    WPath: string;
    function FRObject(FastReport: TfrxReport; ObjectName: String): TObject;
    function FRMemo (FastReport: TfrxReport; ObjectName: String): TfrxMemoView;
    { Public declarations }
  end;

var
  dm: Tdm;
  kd_comp : string;
  waktu_sekarang: TDateTime;
  sop,metu_kabeh,terkoneksi:boolean;
  PPN:real;
  batasan :integer;
  Mgs : TMsg;

implementation


{$R *.dfm}

function Tdm.FRObject(FastReport: TfrxReport; ObjectName: String): TObject;
var
  i: Integer;
  AFound: Boolean;
begin
  AFound:=False;
  for I := 0 to FastReport.ComponentCount - 1 do
  begin
    if LowerCase(FastReport.Components[i].Name) = LowerCase(ObjectName) then
    begin
      Result:=TObject(FastReport.Components[i]);
      AFound:=True;
      Break;
    end;
  end;
  if not AFound then
  begin
    Result:=nil;
  end;
end;

function Tdm.FRMemo (FastReport: TfrxReport; ObjectName: String): TfrxMemoView;
begin
  Result := TfrxMemoView(FRObject(FastReport, ObjectName));
end;

function krupuk(const s: String; CryptInt: Integer): String;
var
  i: integer;
  s2: string;
begin
  if not (Length(s) = 0) then
    for i := 1 to Length(s) do
      s2 := s2 + Chr(Ord(s[i]) - cryptint);
  Result := s2;
end;

procedure Tdm.koneksikan;
var
  data,pusat,jalur1,jalur2,nama,kata: string;
  X: TextFile;
  appINI : TIniFile;
begin
My_conn.Connected:= False;
 assignfile(X,'tools\koneksi.cbCon');
 try
   reset(X);
   readln(X,pusat);
   readln(X,data);
   readln(X,jalur2);
   readln(X,nama);
   readln(X,kata);
   closefile(X);
 my_conn.Host :=krupuk(pusat,6);
 my_conn.DatabaseName:= krupuk(data,6);
 jalur1 :=krupuk(jalur2,6);
 my_conn.Port :=strtoint(jalur1);
 my_conn.UserName :=krupuk(nama,6);
 my_conn.UserPassword :=krupuk(kata,6);
 my_conn.Connected:= true;

 except
 showmessage('koneksi tidak berhasil');
 application.Terminate;
 end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  appINI : TIniFile;
begin
batasan:=1000;

WPath := ExtractFilePath(Application.ExeName);
sm.SkinDirectory:=wpath+'\tools\skins';
  appINI := TIniFile.Create(WPath+'\tools\gain.ini') ;
 try
  kd_comp := appINI.ReadString ('gudang', 'kd_perusahaan', '');
  PPN:= appINI.ReadFloat('gudang','PPN',10);
  sm.SkinName:=appINI.ReadString('gudang','nama_skin','Air (internal)');
  sm.HueOffset:=appini.ReadInteger('gudang','hue_skin',0);
  sm.Saturation:=appini.ReadInteger('gudang','sat_skin',0);
 finally
 appINI.Free;
 end;

sop:=true;
koneksikan;
end;

procedure Tdm.smAfterChange(Sender: TObject);
var appINI : TIniFile;
begin
  appINI := TIniFile.Create(dm.WPath+'\tools\gain.ini') ;
 try
  appINI.WriteString('gudang','nama_skin',dm.sm.SkinName);
  appINI.WriteInteger('gudang','hue_skin',dm.sm.HueOffset);
  appINI.WriteInteger('gudang','sat_skin',dm.sm.Saturation);
 finally
 appINI.Free;
 end;
end;

end.