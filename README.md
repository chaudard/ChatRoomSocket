# ChatRoomSocket

run the server and click 'start'
run the client and click 'connect'
Start sending messages from server to client, and from client to server.

------------------------------------------------------------------------------------------------------

see : http://docwiki.embarcadero.com/CodeExamples/Tokyo/en/Chat_Room_Socket_(Delphi)

NB : if i use port 0 , i get a windows socket error 10049 ; so i use 8080 (see 'Port' property in component)
see also : https://msdn.microsoft.com/en-us/library/windows/desktop/ms740668(v=vs.85).aspx

Note:
I met some problems in the beginning because the components TClientSocket and TServerSocket
were not in the 'internet' components palette.
However , the package dclsockets140.bpl was installed
Menu : component , install packages : 'Components Socket Embarcadero' is checked.
(for me : the path of this package is : C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\bin\dclsockets140.bpl)

So, i decided to select 'Components Socket Embarcadero' and click on button 'components' (see buttons : add - suppress - modify - components)
Another window appears with the 2 components i was looking for , click ok.
Check your 'internet' components palette : the components appear now (magic but i do not understand).
