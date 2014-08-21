package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerGetOK extends PlayerMsg
	{
		public var Name:String = "";
		public var Host:String = "";
		public var Identity:String = "";
		public var Port:int = 0;
		
		private var NameLen:int = 20;
		private var HostLen:int = 20;
		private var IdentityLen:int = 20;
		private var PortLen:int = 2;
		
		public function NetPlayerGetOK()
		{
			msgPool.push(Name);
			msgPool.push(Host);
			msgPool.push(Identity);
			msgPool.push(Port);
			
			msgLen.push(NameLen);
			msgLen.push(HostLen);			
			msgLen.push(IdentityLen);			
			msgLen.push(PortLen);			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Host = msgPool[1];
			Identity = msgPool[2];
			Port = msgPool[3];
			
		}		
	}
}