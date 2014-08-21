package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetNpcRun extends PlayerMsg
	{
		public var Name:String = "";
		public var X:int = 0;
		public var Y:int = 0;
		public var Speed:int = 0;
		
		private var NameLen:int = 20;
		private var XLen:int = 2;
		private var YLen:int = 2;
		private var SpeedLen:int = 1;
				
		public function NetNpcRun()
		{
			msgPool.push(Name);
			msgPool.push(X);
			msgPool.push(Y);
			msgPool.push(Speed);
			
			msgLen.push(NameLen);
			msgLen.push(XLen);
			msgLen.push(YLen);
			msgLen.push(SpeedLen);
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			X = msgPool[1];
			Y = msgPool[2];
			Speed = msgPool[3];
		}
	}
}