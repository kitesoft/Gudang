unit u_merk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sEdit, sLabel, UFungsi, sSkinProvider;

type
  TF_merk = class(TForm)
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    ed_kode: TEdit;
    ed_desc: TEdit;
    B_save: TsButton;
    B_new: TsButton;
    sSkinProvider1: TsSkinProvider;
    procedure baru;
    procedure ubah;
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
  private
    merk_baru: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_merk: TF_merk;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure TF_merk.baru;
begin
{fungsi.SQLExec(dm.q_temp,'select * from tb_merk',true);
ed_kode.Text:= inttostr(dm.Q_temp.recordcount+1);
}
  ed_kode.Clear;
  ed_kode.ReadOnly := false;
  ed_desc.Clear;
  merk_baru := true;
end;

procedure TF_merk.ubah;
begin
  ed_kode.Text := F_cari.q_cari.FieldByName('kd_merk').AsString;
  ed_desc.text := F_cari.q_cari.FieldByName('n_merk').AsString;
  merk_baru := false;
end;

procedure TF_merk.B_newClick(Sender: TObject);
begin
  baru;
end;

procedure TF_merk.B_saveClick(Sender: TObject);
begin
  dm.db_conn.StartTransaction;
  try
    if merk_baru = true then
      fungsi.SQLExec(dm.Q_Exe,
        'insert into tb_merk (kd_merk,n_merk,`update`)values ("' + ed_kode.Text
        + '","' + ed_desc.Text + '","' + formatdatetime('yyyy-MM-dd', date()) +
        '")', false)
    else
      fungsi.SQLExec(dm.Q_Exe, 'update tb_merk set n_merk="' + ed_desc.Text +
        '",`update`="' + formatdatetime('yyyy-MM-dd', date()) +
        '" where kd_merk="' + ed_kode.Text + '"', false);

    dm.db_conn.Commit;
    showmessage('penyimpanan data sukses....');
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
  close;
end;

end.


