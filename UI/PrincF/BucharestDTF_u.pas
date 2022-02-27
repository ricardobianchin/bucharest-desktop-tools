unit BucharestDTF_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TBucharestDTF = class(TForm)
    HoraLabel: TLabel;
    ExecTimer: TTimer;
    FecharLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ExecTimerTimer(Sender: TObject);
    procedure FecharLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BucharestDTF: TBucharestDTF;

implementation

{$R *.dfm}

procedure TBucharestDTF.ExecTimerTimer(Sender: TObject);
var
  dtAgora: TDateTime;
begin
  dtAgora := Now;
  HoraLabel.Caption := FormatDateTime('hh:nn', dtAgora);
end;

procedure TBucharestDTF.FormCreate(Sender: TObject);
begin
  Height := 32;
  Width := 90;

  Top := 20;
  Left := Screen.Width-Width;
end;

procedure TBucharestDTF.FecharLabelClick(Sender: TObject);
begin
  Close;
end;

end.
