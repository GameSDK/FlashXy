package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerNew extends PlayerMsg
	{
		
		public var Name:String = "";
		public var Account:String = "";
		public var Party:String = "";
		public var Sex:int = 0;
		public var Head:int = 0;
		
		private var NameLen:int = 20;
		private var AccounLen:int = 32;
		private var PartyLen:int = 20;
		private var SexLen:int = 1;
		private var HeadLen:int = 1;
		
		public function NetPlayerNew()
		{
			msgPool.push(Name);
			msgPool.push(Account);
			msgPool.push(Party);
			msgPool.push(Sex);
			msgPool.push(Head);
			
			msgLen.push(NameLen);
			msgLen.push(AccounLen);
			msgLen.push(PartyLen);
			msgLen.push(SexLen);
			msgLen.push(HeadLen);
		}
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = Account;
			msgPool[2] = Party;
			msgPool[3] = Sex;
			msgPool[4] = Head;
			
			MakeMsg(MsgDef.NM_PLAYER_NEW);
		}
	}
}