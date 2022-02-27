object BucharestDTF: TBucharestDTF
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'BucharestDTF'
  ClientHeight = 82
  ClientWidth = 151
  Color = 16744448
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    151
    82)
  PixelsPerInch = 96
  TextHeight = 13
  object HoraLabel: TLabel
    Left = 7
    Top = 5
    Width = 42
    Height = 13
    Caption = '00:00:00'
  end
  object FecharLabel: TLabel
    Left = 139
    Top = 4
    Width = 6
    Height = 13
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'X'
    OnClick = FecharLabelClick
    ExplicitLeft = 175
  end
  object BatteryLabel: TLabel
    Left = 7
    Top = 21
    Width = 43
    Height = 13
    Caption = 'Bat: 15%'
  end
  object ExecTimer: TTimer
    OnTimer = ExecTimerTimer
    Left = 96
    Top = 32
  end
end
