package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerInfo extends PlayerMsg
	{
		public var Name:String="";
		public var Party:String="";
		public var Sex:int=0;
		public var Head:int=0;
		public var Level:int=0;
		public var Locked:int=0;
		
		private var NameLen:int = 20;
		private var PartyLen:int = 20;
		private var SexLen:int =1;
		private var HeadLen:int =1;
		private var LevelLen:int =1;
		private var LockedLen:int =1;
		
		public function NetPlayerInfo()
		{
			msgPool.push(Name);
			msgPool.push(Party);
			msgPool.push(Sex);
			msgPool.push(Head);
			msgPool.push(Level);
			msgPool.push(Locked);	
			
			msgLen.push(NameLen);			
			msgLen.push(PartyLen);			
			msgLen.push(SexLen);			
			msgLen.push(HeadLen);			
			msgLen.push(LevelLen);			
			msgLen.push(LockedLen);			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Party = msgPool[1];
			Sex = msgPool[2];
			Head = msgPool[3];
			Level = msgPool[4];
			Locked = msgPool[5];
		}		
	}
}