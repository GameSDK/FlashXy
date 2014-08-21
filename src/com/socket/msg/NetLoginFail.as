package com.socket.msg
{
	import com.socket.PlayerMsg;

	public class NetLoginFail extends PlayerMsg
	{
		public var Error:String = "";
		public var Socket:int = 0;
		
		private var ErrorLen:int = 80;
		private var SocketLen:int = 4;
		
		public function NetLoginFail()
		{
			msgPool.push(Error);
			msgPool.push(Socket);
			
			msgLen.push(ErrorLen);
			msgLen.push(SocketLen);

		}
		public function RecvMsg():void
		{
			GetMsg();
			Error = msgPool[0];
			Socket = msgPool[1];
		}		
	}
}