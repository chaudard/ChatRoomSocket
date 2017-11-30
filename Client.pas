unit Client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls;

type
  TFormClient = class(TForm)
    btSend: TButton;
    btConnection: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    ClientSocket1: TClientSocket;
    Label1: TLabel;
    Label2: TLabel;
    procedure btConnectionClick(Sender: TObject);
    procedure btSendClick(Sender: TObject);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Déclarations privées }
    str: string;
  public
    { Déclarations publiques }
  end;

var
  FormClient: TFormClient;

implementation

{$R *.dfm}

procedure TFormClient.btConnectionClick(Sender: TObject);
begin
//127.0.0.1 is the standard IP address to loop back to your own machine
    ClientSocket1.Address:='127.0.0.1';
    // i use port : 8080 (see top comments)
    ClientSocket1.Active := True;//Activates the client

 if(ClientSocket1.Socket.Connected=True)
    then
    begin
      str:='Disconnected';
      ClientSocket1.Active := False;//Disconnects the client
      btConnection.Caption:='Connect';
    end;
end;

procedure TFormClient.btSendClick(Sender: TObject);
begin
    Str:=Edit1.Text;
    Memo1.Text:=Memo1.Text+'me: '+str+#13#10;
    Edit1.Text:='';//Clears the edit box
    ClientSocket1.Socket.SendText(str);//Send the messages to the server
end;

procedure TFormClient.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   Memo1.Text:=Memo1.Text+'Disconnect'+#13#10;
   Socket.SendText(str);//Send the “Disconnected” message to the server
//str is set to “Disconnected” when the Disconnect button is pressed
//A client cannot send messages if it is not connected to a server
   btSend.Enabled:=False;
   Edit1.Enabled:=False;
   btConnection.Caption:='Connect';
end;

procedure TFormClient.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode:=0;
  ClientSocket1.Active := False;
// This can happen when no active server is started
  Memo1.Text:=Memo1.Text+'No connection found'+#13#10;
end;

procedure TFormClient.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
//Reads and displays the message received from the server;
    Memo1.Text:=Memo1.Text+'Server: '+Socket.ReceiveText+#13#10;
end;

end.
