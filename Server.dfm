object FormServer: TFormServer
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 209
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 42
    Height = 13
    Caption = 'message'
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 33
    Height = 13
    Caption = 'history'
  end
  object btSend: TButton
    Left = 151
    Top = 58
    Width = 42
    Height = 21
    Caption = 'Send'
    TabOrder = 0
    OnClick = btSendClick
  end
  object btRunning: TButton
    Left = 8
    Top = 8
    Width = 185
    Height = 25
    Caption = 'Start/Stop'
    TabOrder = 1
    OnClick = btRunningClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 115
    Width = 185
    Height = 89
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 8
    Top = 58
    Width = 137
    Height = 21
    TabOrder = 3
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 8080
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 144
    Top = 152
  end
end
