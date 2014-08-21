package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerGet extends PlayerMsg
	{
		public var Name:String = "";
		public var Line:int = 0;
		
		private var NameLen:int = 20;
		private var LineLen:int = 1;
		
		public function NetPlayerGet()
		{
			msgPool.push(Name);
			msgPool.push(Line);
			
			msgLen.push(NameLen);
			msgLen.push(LineLen);
		}
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = Line;
			MakeMsg(MsgDef.NM_PLAYER_GET);
		}		
	}
}