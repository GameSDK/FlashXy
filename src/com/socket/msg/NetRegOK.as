package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetRegOK extends PlayerMsg
	{
		public var OkMsg:String = "";
		public var Socket:int = 0;
		
		private var OkMsgLen:int = 32;
		private var SocketLen:int = 4;
		
		public function NetRegOK()
		{
			msgPool.push(OkMsg);
			msgPool.push(Socket);
			
			msgLen.push(OkMsgLen);
			msgLen.push(SocketLen);
			
		}
		public function RecvMsg():void
		{
			GetMsg();
			OkMsg = msgPool[0];
			Socket = msgPool[1];
		}
	}
}