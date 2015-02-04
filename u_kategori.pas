unit u_kategori;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sEdit, sLabel,u_fungsi, sSkinProvider;

type
  TF_Kategori = class(TForm)
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    ed_kode: TsEdit;
    ed_desc: TsEdit;
    B_save: TsButton;
    B_new: TsButton;
    sSkinProvider1: TsSkinProvider;
    procedure baru;
    procedure ubah;
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Kategori: TF_Kategori;
  fungsi:tfungsi;
  kategori_baru:boolean;

implementation

uses u_dm, u_cari;

{$R *.dfm}

procedure TF_Kategori.baru;
begin
{fungsi.SQLExec(dm.q_temp,'select * from tb_kategori',true);
ed_kode.Text:= inttostr(dm.Q_temp.recordcount+1);
}
ed_kode.Clear;
ed_kode.ReadOnly:= false;

ed_desc.Clear;
kategori_baru:= true;
end;

procedure TF_Kategori.ubah;
begin
ed_kode.Text:= f_cari.q_cari.FieldByName('tag').AsString;
ed_desc.text:= f_cari.q_cari.FieldByName('n_kategori').AsString;
kategori_baru:= false;
end;

procedure TF_Kategori.B_newClick(Sender: TObject);
begin
baru;
end;

procedure TF_Kategori.B_saveClick(Sender: TObject);
begin
dm.My_Conn.StartTransaction;
try
if kategori_baru=true then
fungsi.SQLExec(dm.Q_Exe,'insert into tb_kategori (tag,n_kategori,`update`)values ("'+
ed_kode.Text+'","'+ed_desc.Text+'","'+formatdatetime('yyyy-MM-dd', date())+'")',false) else
fungsi.SQLExec(dm.Q_Exe,'update tb_kategori set n_kategori="'+ed_desc.Text+'",`update`="'+
formatdatetime('yyyy-MM-dd', date())+'" where tag="'+ed_kode.Text+'"',false);

dm.My_conn.Commit;
showmessage('penyimpanan data sukses....');
except on e:exception do begin
  dm.My_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;
f_cari.q_cari.Close;
f_cari.q_cari.Open;

f_cari.clm1.caption:='No';
f_cari.clm2.caption:='Deskripsi';
close;
end;

end.