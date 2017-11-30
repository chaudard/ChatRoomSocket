unit Server;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls;

type
  TFormServer = class(TForm)
    btSend: TButton;
    btRunning: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    ServerSocket1: TServerSocket;
    Label1: TLabel;
    Label2: TLabel;
    procedure btRunningClick(Sender: TObject);
    procedure btSendClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Déclarations privées }
    str: string;
    procedure SendMyText(const MyText: string);
  public
    { Déclarations publiques }
  end;

var
  FormServer: TFormServer;

implementation

{$R *.dfm}

procedure TFormServer.btRunningClick(Sender: TObject);
begin
   if(ServerSocket1.Active = False)//The button caption is ‘Start’
   then
   begin
      ServerSocket1.Active := True;//Activates the server socket
      Memo1.Text:=Memo1.Text+'Server Started'+#13#10;
      btRunning.Caption:='Stop';//Set the button caption
   end
   else//The button caption is ‘Stop’
   begin
      ServerSocket1.Active := False;//Stops the server socket
      Memo1.Text:=Memo1.Text+'Server Stopped'+#13#10;
      btRunning.Caption:='Start';
     //If the server is closed, then it cannot send any messages
      btSend.Enabled:=false;//Disables the “Send” button
      Edit1.Enabled:=false;//Disables the edit box
   end;
end;

procedure TFormServer.btSendClick(Sender: TObject);
begin
     Str:=Edit1.Text;//Take the string (message) sent by the server
     SendMyText(Str);
     Edit1.Text:='';//Clears the edit box
end;

procedure TFormServer.SendMyText(const MyText: string);
var
  i: integer;
begin
     Memo1.Text:=Memo1.Text+'me: '+MyText+#13#10;//Adds the message to the memo box
//Sends the messages to all clients connected to the server
     for i:=0 to ServerSocket1.Socket.ActiveConnections-1 do
      ServerSocket1.Socket.Connections[i].SendText(MyText);//Sent
end;

procedure TFormServer.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Socket.SendText('Connected');//Sends a message to the client
//If at least a client is connected to the server, then the server can communicate
//Enables the Send button and the edit box
  btSend.Enabled:=true;
  Edit1.Enabled:=true;
end;

procedure TFormServer.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
//The server cannot send messages if there is no client connected to it
  if ServerSocket1.Socket.ActiveConnections-1=0 then
  begin
    btSend.Enabled:=false;
    Edit1.Enabled:=false;
  end;
end;


procedure TFormServer.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  myText: string;
begin
//Read the message received from the client and add it to the memo text
// The client identifier appears in front of the message
  Memo1.Text:=Memo1.Text+'Client'+IntToStr(Socket.SocketHandle)+' :'+Socket.ReceiveText+#13#10;
{
  // test send directly another message ; it works !
  myText := 'send directly from server after read.';
  SendMyText(myText);
}
end;

end.
