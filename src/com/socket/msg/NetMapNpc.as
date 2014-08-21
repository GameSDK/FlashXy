package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetMapNpc extends PlayerMsg
	{
		public var Name:String = "";
		public var Owner:String = "";
		public var Family:String = "";
		public var Faction:String = "";
		public var DispName:String = "";
		public var Type:int = 0;
		public var Five:int = 0;
		public var Level:int = 0;
		public var Class:int = 0;
		public var State:int = 0;
		public var Dir:int = 0;
		public var Speed:int = 0;
		public var X:int = 0;
		public var Y:int = 0;
		public var Life:int = 0;
		public var LifeMax:int = 0;
		
		private var NameLen:int = 20;
		private var OwnerLen:int = 20;
		private var FamilyLen:int = 20;
		private var FactionLen:int = 20;
		private var DispNameLen:int = 20;
		private var TypeLen:int = 1;
		private var FiveLen:int = 1;
		private var LevelLen:int = 1;
		private var ClassLen:int = 1;
		private var StateLen:int = 1;
		private var DirLen:int = 1;
		private var SpeedLen:int = 1;
		private var XLen:int = 2;
		private var YLen:int = 2;
		private var LifeLen:int = 4;
		private var LifeMaxLen:int = 4;		
		
		public function NetMapNpc()
		{
			msgPool.push(Name);
			msgPool.push(Owner);
			msgPool.push(Family);
			msgPool.push(Faction);
			msgPool.push(DispName);
			msgPool.push(Type);
			msgPool.push(Five);
			msgPool.push(Level);
			msgPool.push(Class);
			msgPool.push(State);
			msgPool.push(Dir);
			msgPool.push(Speed);
			msgPool.push(X);
			msgPool.push(Y);
			msgPool.push(Life);
			msgPool.push(LifeMax);		
			
			msgLen.push(NameLen);
			msgLen.push(OwnerLen);
			msgLen.push(FamilyLen);
			msgLen.push(FactionLen);
			msgLen.push(DispNameLen);
			msgLen.push(TypeLen);
			msgLen.push(FiveLen);
			msgLen.push(LevelLen);
			msgLen.push(ClassLen);
			msgLen.push(StateLen);
			msgLen.push(DirLen);
			msgLen.push(SpeedLen);
			msgLen.push(XLen);
			msgLen.push(YLen);
			msgLen.push(LifeLen);
			msgLen.push(LifeMaxLen);
			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Owner = msgPool[1];
			Family = msgPool[2];
			Faction = msgPool[3];
			DispName = msgPool[4];
			Type = msgPool[5];
			Five = msgPool[6];
			Level = msgPool[7];
			Class = msgPool[8];
			State = msgPool[9];
			Dir = msgPool[10];
			Speed = msgPool[11];
			X = msgPool[12];
			Y = msgPool[13];
			Life = msgPool[14];
			LifeMax = msgPool[15];			
		}
	}
}