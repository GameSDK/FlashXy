package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetDelItem extends PlayerMsg
	{
		public var Name:String = "";
		
		private var NameLen:int = 20;
		
		public function NetDelItem()
		{
			msgPool.push(Name);
			msgLen.push(NameLen);
		}
		
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
		}
	}
}