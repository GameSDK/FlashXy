package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetCommand extends PlayerMsg
	{
		
		public var Command:String = "";
		public var Param:String = "";
		
		private var CommandLen:int = 20;
		private var ParamLen:int = 200;
		
		public function NetCommand()
		{
			msgPool.push(Command);
			msgPool.push(Param);
			
			msgLen.push(CommandLen);
			msgLen.push(ParamLen);
		}
		public function RecvMsg():void
		{
			GetMsg();
			Command = msgPool[0];
			Param =  msgPool[1];
		}
	}
}