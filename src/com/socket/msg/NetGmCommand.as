package com.socket.msg
{
	import flash.net.Socket;
	
	public class NetGmCommand extends PlayerMsg
	{
		public var GmName:String = "";
		public var Server:String = "";
		public var Command:String = "";
		
		private var GmNameLen:int = 20;
		private var ServerLen:int = 20;
		private var CommandLen:int = 200;
		
		public function NetGmCommand()
		{
			msgPool.push(GmName);
			msgPool.push(Server);
			msgPool.push(Command);
			
			msgLen.push(GmNameLen);
			msgLen.push(ServerLen);
			msgLen.push(CommandLen);	
			
		}
		
		public function SendMsg():void
		{
			msgPool[0] = GmName;
			msgPool[1] = Server;
			msgPool[2] = Command;			
			
			if (SocketClient.socket != null)
			{
				MakeMsg(SocketClient.socket, MsgDef.NM_GM_COMMAND);
			}
		}		
	}
}