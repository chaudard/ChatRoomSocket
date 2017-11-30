object FormClient: TFormClient
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 224
  ClientWidth = 219
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
    Top = 88
    Width = 33
    Height = 13
    Caption = 'history'
  end
  object btSend: TButton
    Left = 152
    Top = 56
    Width = 49
    Height = 25
    Caption = 'Send'
    TabOrder = 0
    OnClick = btSendClick
  end
  object btConnection: TButton
    Left = 8
    Top = 8
    Width = 193
    Height = 25
    Caption = 'Connect/Disconnect'
    TabOrder = 1
    OnClick = btConnectionClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 107
    Width = 193
    Height = 109
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 8
    Top = 58
    Width = 138
    Height = 21
    TabOrder = 3
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 8080
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 144
    Top = 136
  end
end
