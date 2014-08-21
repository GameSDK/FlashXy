package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetNpcDie extends PlayerMsg
	{
		public var Name:String = "";
		private var NameLen:int = 20;
		
		public function NetNpcDie()
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