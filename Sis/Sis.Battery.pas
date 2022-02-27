unit Sis.Battery;

interface

function GetBatteryPerc:integer;
function getPowerStatus:String;
function GetBatteryFlag(flag:Integer):String;

implementation

uses Windows, SysUtils;

function GetBatteryPerc:integer;
var
  SysPowerStatus: TSystemPowerStatus;
begin
  GetSystemPowerStatus(SysPowerStatus);
  if Boolean(SysPowerStatus.ACLineStatus) then
  begin
    Result := -1;
    exit;
  end;

  result := SysPowerStatus.BatteryLifePercent;
end;

function GetBatteryFlag(flag:Integer):String;
begin
case flag of
  1: result := 'Battery is healthy.';
  2: result := 'Battery is running on low power.';
  4: result := 'Battery is on critical,please charge.';
  8: result := 'Battery is charging.';
  9: result := 'Battery is healthy and on AC power';
  128: result := 'System has no battery.';
  255: result := 'Unknown.';
end;
end;

function SecToTime(Sec: integer): string;
var
   H, M, S: string;
   ZH, ZM, ZS: Integer;
begin
  if Sec  < 0 then
  begin
    Result := 'N/A';
    exit;
  end;
   ZH := Sec div 3600;
   ZM := Sec div 60 - ZH * 60;
   ZS := Sec - (ZH * 3600 + ZM * 60) ;
   H := IntToStr(ZH) ;
   M := IntToStr(ZM) ;
   S := IntToStr(ZS) ;
   Result := H + ':' + M + ':' + S;
end;

function getPowerStatus:String;
var
  SysPowerStatus: TSystemPowerStatus;
begin
  GetSystemPowerStatus(SysPowerStatus);
  if Boolean(SysPowerStatus.ACLineStatus) then
  begin
      Result := 'System is running on external power(AC)';
  end
  else
  begin
    result := 'System is running on battery';
  end;
  result := result + #13#10 + 'Battery level: ' + intToStr(SysPowerStatus.BatteryLifePercent) + ' %' + #13#10 +
                      'Battery lifetime: ' + SecToTime(SysPowerStatus.BatteryLifeTime) + #13#10 +
                      'Batteryflag: ' + getBatteryflag(SysPowerStatus.BatteryFlag);
end;

end.
