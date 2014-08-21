package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerData extends PlayerMsg
	{
		public var	Name:String = "";//角色名
		public var	Family:String = "";//家族
		public var	Faction:String = "";//帮会
		public var	Title:String = "";//称号
		public var	Flower:String = "";//花名
		public var	Partner:String = "";//情侣
		public var	Mate:String = "";//配偶
		public var	Master:String = "";//师傅
		public var	Prentice:String = "";//徒弟
		public var	TaskDate:String = "";//任务日期
		public var	Lock:int = 0;//仓库锁0,1
		public var	Pk:int = 0;//PK模式0,7
		public var	CarryAppe:int = 0;//扩展背包
		public var	StoreAppe:int = 0;//扩展仓库
		public var	Mount:int = 0;//上坐骑
		public var	MapX:int = 0;//地图X
		public var	MapY:int = 0;//地图Y
		public var	PreventOnline:int = 0;//防沉迷在线时间
		public var	AwardTime:int = 0;//奖励时间秒
		public var	Strength:int = 0;//力量
		public var	Celerity:int = 0;//敏捷
		public var	Body:int = 0;//体质
		public var	Soul:int = 0;//精神
		public var	Wit:int = 0;//智力
		public var	Point:int = 0;//潜能点
		public var	SkillPoint:int = 0;//技能点
		public var	Life:int = 0;//生命
		public var	Mana:int = 0;//法力		
		
		private var NameLen:int = 20;//角色名
		private var FamilyLen:int = 20;//家族
		private var FactionLen:int = 20;//帮会
		private var TitleLen:int = 20;//称号
		private var FlowerLen:int = 20;//花名
		private var PartnerLen:int = 20;//情侣
		private var MateLen:int = 20;//配偶
		private var MasterLen:int = 20;//师傅
		private var PrenticeLen:int = 20;//徒弟
		private var TaskDateLen:int = 20;//任务日期
		private var LockLen:int = 1;//仓库锁0,1
		private var PkLen:int = 1;//PK模式0,7
		private var CarryAppeLen:int = 1;//扩展背包
		private var StoreAppeLen:int = 1;//扩展仓库
		private var MountLen:int = 1;//上坐骑
		private var MapXLen:int = 4;//地图X
		private var MapYLen:int = 4;//地图Y
		private var PreventOnlineLen:int = 4;//防沉迷在线时间
		private var AwardTimeLen:int = 4;//奖励时间秒
		private var StrengthLen:int = 4;//力量
		private var CelerityLen:int = 4;//敏捷
		private var BodyLen:int = 4;//体质
		private var SoulLen:int = 4;//精神
		private var WitLen:int = 4;//智力
		private var PointLen:int = 4;//潜能点
		private var SkillPointLen:int = 4;//技能点
		private var LifeLen:int = 4;//生命
		private var ManaLen:int = 4;//法力
		
		public function NetPlayerData()
		{
			msgPool.push(Name);		
			msgPool.push(Family);						
			msgPool.push(Faction);						
			msgPool.push(Title);						
			msgPool.push(Flower);						
			msgPool.push(Partner);						
			msgPool.push(Mate);						
			msgPool.push(Master);						
			msgPool.push(Prentice);						
			msgPool.push(TaskDate);						
			msgPool.push(Lock);						
			msgPool.push(Pk);						
			msgPool.push(CarryAppe);						
			msgPool.push(StoreAppe);						
			msgPool.push(Mount);						
			msgPool.push(MapX);						
			msgPool.push(MapY);						
			msgPool.push(PreventOnline);						
			msgPool.push(AwardTime);						
			msgPool.push(StrengthLen);						
			msgPool.push(CelerityLen);	
			msgPool.push(BodyLen);	
			msgPool.push(SoulLen);	
			msgPool.push(WitLen);	
			msgPool.push(PointLen);	
			msgPool.push(SkillPointLen);	
			msgPool.push(LifeLen);		
			msgPool.push(ManaLen);			
			
			msgLen.push(NameLen);
			msgLen.push(FamilyLen);			
			msgLen.push(FactionLen);			
			msgLen.push(TitleLen);			
			msgLen.push(FlowerLen);			
			msgLen.push(PartnerLen);			
			msgLen.push(MateLen);			
			msgLen.push(MasterLen);			
			msgLen.push(PrenticeLen);			
			msgLen.push(TaskDateLen);			
			msgLen.push(LockLen);			
			msgLen.push(PkLen);			
			msgLen.push(CarryAppeLen);			
			msgLen.push(StoreAppeLen);			
			msgLen.push(MountLen);			
			msgLen.push(MapXLen);			
			msgLen.push(MapYLen);			
			msgLen.push(PreventOnlineLen);			
			msgLen.push(AwardTimeLen);			
			msgLen.push(StrengthLen);			
			msgLen.push(CelerityLen);			
			msgLen.push(BodyLen);			
			msgLen.push(SoulLen);			
			msgLen.push(WitLen);			
			msgLen.push(PointLen);			
			msgLen.push(SkillPointLen);			
			msgLen.push(LifeLen);			
			msgLen.push(ManaLen);			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];		
			Family = msgPool[1];						
			Faction = msgPool[2];							
			Title = msgPool[3];					
			Flower = msgPool[4];						
			Partner = msgPool[5];						
			Mate = msgPool[6];						
			Master = msgPool[7];						
			Prentice = msgPool[8];						
			TaskDate = msgPool[9];						
			Lock = msgPool[10];						
			Pk = msgPool[11];						
			CarryAppe = msgPool[12];					
			StoreAppe = msgPool[13];					
			Mount = msgPool[14];					
			MapX = msgPool[15];				
			MapY = msgPool[16];		
			PreventOnline = msgPool[17];					
			AwardTime = msgPool[18];					
			StrengthLen = msgPool[19];						
			CelerityLen = msgPool[20];	
			BodyLen = msgPool[21];
			SoulLen = msgPool[22];
			WitLen = msgPool[23];	
			PointLen = msgPool[24];
			SkillPointLen = msgPool[25];	
			LifeLen = msgPool[26];		
			ManaLen = msgPool[27];				
		}
	}
}