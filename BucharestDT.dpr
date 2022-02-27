program BucharestDT;

uses
  Vcl.Forms,
  BucharestDTF_u in 'UI\PrincF\BucharestDTF_u.pas' {BucharestDTF},
  Sis.Versao in 'Sis\Sis.Versao.pas',
  Sis.Battery in 'Sis\Sis.Battery.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBucharestDTF, BucharestDTF);
  Application.Run;
end.
