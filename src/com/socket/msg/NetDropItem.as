package com.socket.msg
{
	import com.socket.PlayerMsg;	
	public class NetDropItem extends PlayerMsg
	{
		public var Name:String = "";
		public var Where:int = 0;
		public var Index:int = 0;
		
		private var NameLen:int = 20;
		private var WhereLen:int = 1;
		private var IndexLen:int = 1;		
		
		public function NetDropItem()
		{
			msgPool.push(Name);
			msgPool.push(Where);
			msgPool.push(Index);
			
			msgLen.push(NameLen);
			msgLen.push(WhereLen);
			msgLen.push(IndexLen);
		
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Where = msgPool[1];
			Index = msgPool[2];
		}	
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = Where;
			msgPool[2] = Index;
			MakeMsg(MsgDef.NM_DROP_ITEM);
		}			
	}
}