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
    BatteryLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ExecTimerTimer(Sender: TObject);
    procedure FecharLabelClick(Sender: TObject);
  private
    { Private declarations }

    /// <summary>Ultimo horario lido de Now</summary>
    FAgora: TDateTime;

    /// <summary>Contagem de execucoes do ExecTimer</summary>
    FExecVez: integer;

    /// <summary>Preenche a variavel FAgora com Now</summary>
    procedure LeiaHoraAtual;

    /// <summary>coloca hora atual no HoraLabel</summary>
    procedure ExibaHora;

    /// <summary>coloca percentual da bateria no BatteryLabel</summary>
    procedure ExibaBattery;

  public
    { Public declarations }
  end;

var
  BucharestDTF: TBucharestDTF;

implementation

{$R *.dfm}

uses Sis.Battery, Sis.Versao;

procedure TBucharestDTF.ExecTimerTimer(Sender: TObject);
begin
  if (FExecVez div 60)=0 then
  begin
    LeiaHoraAtual;
    ExibaHora;
    ExibaBattery;
  end;

  inc(FExecVez);
end;

procedure TBucharestDTF.ExibaBattery;
begin
  BatteryLabel.Caption := 'Bat: ' + GetBatteryPerc.ToString + '%';
end;

procedure TBucharestDTF.ExibaHora;
begin
  HoraLabel.Caption := FormatDateTime('hh:nn', FAgora);
end;

procedure TBucharestDTF.FormCreate(Sender: TObject);
begin
  FExecVez := 0;

  Height := 56;
  Width := 90;

  Top := 20;
  Left := Screen.Width-Width;

//  showmessage(getPowerStatus);
end;

procedure TBucharestDTF.LeiaHoraAtual;
begin
  FAgora := Now;
end;

procedure TBucharestDTF.FecharLabelClick(Sender: TObject);
begin
  Close;
end;

end.
