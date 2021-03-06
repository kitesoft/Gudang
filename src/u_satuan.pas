unit u_satuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sEdit, sButton, sLabel, UFungsi, sSkinProvider, StdCtrls;

type
  TF_satuan = class(TForm)
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    b_new: TsButton;
    b_save: TsButton;
    ed_nomer: TEdit;
    ed_desk: TEdit;
    ed_singkat: TEdit;
    sSkinProvider1: TsSkinProvider;
    procedure baru;
    procedure ubah;
    procedure b_newClick(Sender: TObject);
    procedure b_saveClick(Sender: TObject);
  private
    satuan_baru: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_satuan: TF_satuan;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure TF_satuan.baru;
begin
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_satuan', true);
  ed_nomer.Text := inttostr(dm.Q_temp.RecordCount + 1);
  ed_desk.Clear;
  ed_singkat.Clear;
  satuan_baru := true;
end;

procedure TF_satuan.ubah;
begin
  ed_nomer.Text := F_cari.q_cari.FieldByName('kd_satuan').AsString;
  ed_desk.text := F_cari.q_cari.FieldByName('n_satuan').AsString;
  ed_singkat.text := F_cari.q_cari.FieldByName('n_singkat').AsString;
  satuan_baru := false;
end;

procedure TF_satuan.b_newClick(Sender: TObject);
begin
  baru;
end;

procedure TF_satuan.b_saveClick(Sender: TObject);
begin
  dm.db_conn.StartTransaction;
  try
    if satuan_baru = true then
      fungsi.SQLExec(dm.Q_Exe,
        'insert into tb_satuan(kd_satuan,n_satuan,n_singkat,`update`)values("' +
        ed_nomer.Text + '","' + ed_desk.Text + '","' + ed_singkat.Text + '","' +
        formatdatetime('yyyy-MM-dd', date()) + '")', false)
    else
      fungsi.SQLExec(dm.Q_Exe, 'update tb_satuan set `update`="' +
        formatdatetime('yyyy-MM-dd', date()) + '",n_satuan="' + ed_desk.Text +
        '",n_singkat="' + ed_singkat.Text + '" where kd_satuan="' + ed_nomer.Text
        + '"', false);

    dm.db_conn.Commit;
    showmessage('penyimpanan data sukses...');
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' + e.Message);
    end;
  end;
  F_cari.q_cari.Close;
  F_cari.q_cari.Open;

  F_cari.clm1.caption := 'No';
  F_cari.clm2.caption := 'Deskripsi';
  F_cari.clm3.caption := 'Singkatan';
  close;
end;

end.


