unit u_list_stock_opname;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage, cxEdit, DB, cxDBData,
  cxCurrencyEdit, sSkinProvider, Buttons, ExtCtrls, sPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, sSpeedButton, sTooledit, sLabel,
  cxCustomData, cxFilter, cxData, StdCtrls, Mask, sMaskEdit, sCustomComboEdit,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator;

type
  TF_list_SO = class(TForm)
    grid: TcxGrid;
    grid_data: TcxGridDBTableView;
    clmn_dataColumn1: TcxGridDBColumn;
    clmn_dataColumn2: TcxGridDBColumn;
    clmn_dataColumn3: TcxGridDBColumn;
    clmn_dataColumn4: TcxGridDBColumn;
    clmn_dataColumn5: TcxGridDBColumn;
    l_data: TcxGridLevel;
    sPanel1: TsPanel;
    sknprvdr1: TsSkinProvider;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    p1: TsPanel;
    l_1: TsLabel;
    l_2: TsLabel;
    de_mulai: TsDateEdit;
    de_sampai: TsDateEdit;
    t_data_simpan_pada: TcxGridDBColumn;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure segarkan;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_list_SO: TF_list_SO;

implementation

uses
  u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure TF_list_SO.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (dm.metu_kabeh) then
  begin
    if Assigned(active) then
    begin
      idx := F_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
      F_utama.tc_child.Tag := -1;
      F_utama.tc_child.TabIndex := idx;
      F_utama.tc_child.Tag := 0;
    end;
  end;
end;

procedure TF_list_SO.segarkan;
begin
  fungsi.SQLExec(dm.Q_List_SO,
    'select * from tb_koreksi_global where kd_perusahaan="' + dm.kd_perusahaan +
    '" and tgl_koreksi >= ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_mulai.Date))
    + ' and tgl_koreksi <= ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_sampai.Date))
    + ' order by tgl_koreksi desc', true);
end;

procedure TF_list_SO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  F_list_SO := nil;
  F_utama.MDIChildDestroyed(Self.Handle);
end;

procedure TF_list_SO.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_cetak_koreksi where kd_perusahaan=' + quotedstr(dm.kd_perusahaan)
    + ' and kd_koreksi="' + dm.Q_List_SO.fieldbyname('kd_koreksi').AsString + '"', true);
  dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_koreksi_rinci.fr3');
  dm.laporan.ShowReport;
end;

procedure TF_list_SO.FormShow(Sender: TObject);
begin
  segarkan;
end;

procedure TF_list_SO.FormCreate(Sender: TObject);
var
  Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  de_mulai.Date := EncodeDate(Year, Month, 1);
  de_sampai.Date := Date();

  F_utama.MDIChildCreated(self.Handle);
  segarkan;
end;

procedure TF_list_SO.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure TF_list_SO.sb_2Click(Sender: TObject);
begin
  segarkan;
end;

end.


