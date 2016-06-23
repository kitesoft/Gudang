unit U_Group_Barang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, Buttons, sSpeedButton, ExtCtrls, sPanel,
  StdCtrls, sButton, mySQLDbTables;

type
  TFGroupBarang = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sPanel1: TsPanel;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    p1: TsPanel;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    tvKodeGroup: TcxGridDBColumn;
    tvDeskripsi: TcxGridDBColumn;
    l_data: TcxGridLevel;
    btnBaru: TsButton;
    btnEdit: TsButton;
    btnHapus: TsButton;
    tvJumlahItem: TcxGridDBColumn;
    tvJumlahQty: TcxGridDBColumn;
    QGroupBarang: TmySQLQuery;
    dsGroupBarang: TDataSource;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure OpenGroupDetail(Baru: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure segarkan;
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnBaruClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGroupBarang: TFGroupBarang;

implementation

uses
  u_utama, u_dm, u_Group_Barang_Detail;

{$R *.dfm}

{ TFGroupBarang }

procedure TFGroupBarang.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (metu_kabeh) then
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

procedure TFGroupBarang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  FGroupBarang := nil;
end;

procedure TFGroupBarang.sb_1Click(Sender: TObject);
begin
  Close;
end;

procedure TFGroupBarang.sb_2Click(Sender: TObject);
begin
  segarkan;
end;

procedure TFGroupBarang.segarkan;
begin
    fungsi.SQLExecT(QGroupBarang,'select * from vw_group_barang',true);
end;

procedure TFGroupBarang.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
  segarkan;
end;

procedure TFGroupBarang.btnEditClick(Sender: TObject);
begin
  OpenGroupDetail(False);
end;

procedure TFGroupBarang.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  OpenGroupDetail(False);
end;

procedure TFGroupBarang.OpenGroupDetail(Baru: Boolean);
begin
  Application.CreateForm(TFGroupBarangDetail,FGroupBarang);
  FGroupBarang.ShowModal;
end;

procedure TFGroupBarang.btnBaruClick(Sender: TObject);
begin
  OpenGroupDetail(True);
end;

procedure TFGroupBarang.btnHapusClick(Sender: TObject);
begin
  // Hapus Data Group Barang...
end;

end.

