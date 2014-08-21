package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetRunTask extends PlayerMsg
	{
		public var Name:String = "";
		public var Param:String = "";

		private var NameLen:int = 20;
		private var ParamLen:int = 100;
		
		public function NetRunTask()
		{
			msgPool.push(Name);
			msgPool.push(Param);
			
			msgLen.push(NameLen);
			msgLen.push(ParamLen);
		}
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = Param;
			MakeMsg(MsgDef.NM_RUN_TASK);
		}		
	}
}