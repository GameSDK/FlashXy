package com.socket.msg
{
	import com.socket.PlayerMsg;
	public class NetQuickItem extends PlayerMsg
	{
		public var Name:String = "";
		public var Index:int = 0;
		
		private var NameLen:int = 20;
		private var IndexLen:int = 1;
		
		public function NetQuickItem()
		{
			msgPool.push(Name);
			msgPool.push(Index);
			
			msgLen.push(NameLen);
			msgLen.push(IndexLen);
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Index = msgPool[1];
		}	
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = Index;
			MakeMsg(MsgDef.NM_QUICK_ITEM);
		}			
	}
}