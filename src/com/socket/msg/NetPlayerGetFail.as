package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerGetFail extends PlayerMsg
	{
		public var Error:String = "";
		
		private var ErrorLen:int = 80;

		public function NetPlayerGetFail()
		{
			msgPool.push(Error);
			
			msgLen.push(ErrorLen);
		}
		
		public function RecvMsg():void
		{
			GetMsg();
			Error = msgPool[0];
		}
	}
}