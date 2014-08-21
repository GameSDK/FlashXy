package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerMain extends PlayerMsg
	{
		public var Name:String = "";//角色名
		public var	Account:String = "";//帐号
		public var	Identity:String = "";//ID
		public var	Party:String = "";//门派
		public var	MapName:String = "";//地图
		public var	CreateDate:String = "";//创建日期
		public var	LogoutDate:String = "";//登出日期
		public var	OnlineTime:int = 0;//在线时间
		public var	Sex:int = 0;//性别0,1
		public var	Head:int = 0;//头像1,10
		public var	Level:int = 0;//等级0,255
		public var	Exp:int = 0;//经验
		public var	Gold:int = 0;//金子
		public var	BindGold:int = 0;//绑定金子
		public var	Silver:int = 0;//银子
		public var	BindSilver:int = 0;//绑定银子
		public var	Fame:int = 0;//声望
		public var	Evil:int = 0;//邪恶
		public var	Numen:int = 0;//元神
		public var	Literacy:int = 0;//文采
		public var	Favor:int = 0;//好感
		public var	Promote:int = 0;//飞升
		public var	ChargeGold:int = 0;//帐号充值金子
		public var	RemainGold:int = 0;//帐号剩余金子
		public var	GmLevel:int = 0;//GM等级
		public var	Prevent:int = 0;//防沉迷
		public var	BasicPoint:int = 0;//潜能点
		public var	SkillPoint:int = 0;//技能点		
		
		private var NameLen:int = 20;//角色名
		private var AccountLen:int = 32;//帐号
		private var IdentityLen:int = 20;//ID
		private var PartyLen:int = 10;//门派
		private var MapNameLen:int = 20;//地图
		private var CreateDateLen:int = 20;//创建日期
		private var LogoutDateLen:int = 20;//登出日期
		private var OnlineTimeLen:int = 4;//在线时间
		private var SexLen:int = 1;//性别0,1
		private var HeadLen:int = 1;//头像1,10
		private var LevelLen:int = 1;//等级0,255
		private var ExpLen:int = 4;//经验
		private var GoldLen:int = 4;//金子
		private var BindGoldLen:int = 4;//绑定金子
		private var SilverLen:int = 4;//银子
		private var BindSilverLen:int = 4;//绑定银子
		private var FameLen:int = 4;//声望
		private var EvilLen:int = 4;//邪恶
		private var NumenLen:int = 4;//元神
		private var LiteracyLen:int = 4;//文采
		private var FavorLen:int = 4;//好感
		private var PromoteLen:int = 4;//飞升
		private var ChargeGoldLen:int = 4;//帐号充值金子
		private var RemainGoldLen:int = 4;//帐号剩余金子
		private var GmLevelLen:int = 1;//GM等级
		private var PreventLen:int = 1;//防沉迷
		private var BasicPointLen:int = 2;//潜能点
		private var SkillPointLen:int = 2;//技能点
		
		public function NetPlayerMain()
		{
			msgPool.push(Name);
			msgPool.push(Account);	
			msgPool.push(Identity);	
			msgPool.push(Party);	
			msgPool.push(MapName);	
			msgPool.push(CreateDate);	
			msgPool.push(LogoutDate);	
			msgPool.push(OnlineTime);	
			msgPool.push(Sex);	
			msgPool.push(Head);	
			msgPool.push(Level);	
			msgPool.push(Exp);	
			msgPool.push(Gold);	
			msgPool.push(BindGold);	
			msgPool.push(Silver);	
			msgPool.push(BindSilver);	
			msgPool.push(Fame);	
			msgPool.push(Evil);	
			msgPool.push(Numen);	
			msgPool.push(Literacy);	
			msgPool.push(Favor);	
			msgPool.push(Promote);	
			msgPool.push(ChargeGold);	
			msgPool.push(RemainGold);	
			msgPool.push(GmLevel);	
			msgPool.push(Prevent);	
			msgPool.push(BasicPoint);	
			msgPool.push(SkillPoint);				
			
			msgLen.push(NameLen);
			msgLen.push(AccountLen);	
			msgLen.push(IdentityLen);	
			msgLen.push(PartyLen);	
			msgLen.push(MapNameLen);	
			msgLen.push(CreateDateLen);	
			msgLen.push(LogoutDateLen);	
			msgLen.push(OnlineTimeLen);	
			msgLen.push(SexLen);	
			msgLen.push(HeadLen);	
			msgLen.push(LevelLen);	
			msgLen.push(ExpLen);	
			msgLen.push(GoldLen);	
			msgLen.push(BindGoldLen);	
			msgLen.push(SilverLen);	
			msgLen.push(BindSilverLen);	
			msgLen.push(FameLen);	
			msgLen.push(EvilLen);	
			msgLen.push(NumenLen);	
			msgLen.push(LiteracyLen);	
			msgLen.push(FavorLen);	
			msgLen.push(PromoteLen);	
			msgLen.push(ChargeGoldLen);	
			msgLen.push(RemainGoldLen);	
			msgLen.push(GmLevelLen);	
			msgLen.push(PreventLen);	
			msgLen.push(BasicPointLen);	
			msgLen.push(SkillPointLen);	
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Account = msgPool[1];
			Identity = msgPool[2];
			Party = msgPool[3];
			MapName = msgPool[4];	
			CreateDate = msgPool[5];	
			LogoutDate = msgPool[6];	
			OnlineTime = msgPool[7];	
			Sex = msgPool[8];
			Head = msgPool[9];	
			Level = msgPool[10];
			Exp = msgPool[11];
			Gold = msgPool[12];
			BindGold = msgPool[13];	
			Silver = msgPool[14];	
			BindSilver = msgPool[15];	
			Fame = msgPool[16];
			Evil = msgPool[17];
			Numen = msgPool[18];
			Literacy = msgPool[19];
			Favor = msgPool[20];
			Promote = msgPool[21];
			ChargeGold = msgPool[22];
			RemainGold = msgPool[23];
			GmLevel = msgPool[24];
			Prevent = msgPool[25];
			BasicPoint = msgPool[26];
			SkillPoint = msgPool[27];		
		}
	}
}