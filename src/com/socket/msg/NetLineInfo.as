package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetLineInfo extends PlayerMsg
	{
		public var Host:String = "";
		public var Port:int = 0;
		public var Line:int = 0;
		
		private var HostLen:int = 20;
		private var PortLen:int = 2;
		private var LineLen:int = 2;

		public function NetLineInfo()
		{
			msgPool.push(Host);
			msgPool.push(Port);
			msgPool.push(Line);
			
			msgLen.push(HostLen);
			msgLen.push(PortLen);
			msgLen.push(LineLen);
			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Host = msgPool[0];
			Port = msgPool[1];
			Line = msgPool[2];
		}
	}
}