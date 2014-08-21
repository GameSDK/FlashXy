package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetMapMpc extends PlayerMsg
	{
		public var Name:String = "";
		public var Family:String = "";//家族
		public var Faction:String = "";//帮派
		public var Party:String = "";//门派
		public var Title:String = "";//家族称号
		public var SaleAd:String = "";//摆摊广告
		public var IndTitle:String = "";//个人称号
		public var Halo:String = "";//光环效果
		public var X:int = 0;//坐标
		public var Y:int = 0;//坐标
		public var Dir:int = 0;//方向
		public var State:int = 0;//状态
		public var Action:int = 0;//生活动作
		public var OnTeam:int = 0;//组队
		public var OnSale:int = 0;//摆摊
		public var Pk:int = 0;//PK状态
		public var Sex:int = 0;//性别
		public var Level:int = 0;//等级
		public var Promote:int = 0;//飞升
		public var ClothClass:int = 0;//衣服类别
		public var WeaponClass:int = 0;//武器类别
		public var RideClass:int = 0;//坐骑类别
		public var ClothFive:int = 0;//衣服五行
		public var WeaponFive:int = 0;//武器五行
		public var RideFive:int = 0;//坐骑五行
		public var Mount:int = 0;//是否上坐骑
		public var Cloth:String = "";
		public var Weapon:String = "";
		public var Ride:String = "";
		public var Life:int = 0;
		public var LifeMax:int = 0;
		public var Evil:int = 0;
		
		private var NameLen:int = 20;
		private var FamilyLen:int = 20;//家族
		private var FactionLen:int = 20;//帮派
		private var PartyLen:int = 20;//门派
		private var TitleLen:int = 20;//家族称号
		private var SaleAdLen:int = 20;//摆摊广告
		private var IndTitleLen:int = 20;//个人称号
		private var HaloLen:int = 20;//光环效果
		private var XLen:int = 2;//坐标
		private var YLen:int = 2;//坐标
		private var DirLen:int = 1;//方向
		private var StateLen:int = 1;//状态
		private var ActionLen:int = 1;//生活动作
		private var OnTeamLen:int = 1;//组队
		private var OnSaleLen:int = 1;//摆摊
		private var PkLen:int = 1;//PK状态
		private var SexLen:int = 1;//性别
		private var LevelLen:int = 1;//等级
		private var PromoteLen:int = 1;//飞升
		private var ClothClassLen:int = 1;//衣服类别
		private var WeaponClassLen:int = 1;//武器类别
		private var RideClassLen:int = 1;//坐骑类别
		private var ClothFiveLen:int = 1;//衣服五行
		private var WeaponFiveLen:int = 1;//武器五行
		private var RideFiveLen:int = 1;//坐骑五行
		private var MountLen:int = 1;//是否上坐骑
		private var ClothLen:int = 20;
		private var WeaponLen:int = 20;
		private var RideLen:int = 20;
		private var LifeLen:int = 4;
		private var LifeMaxLen:int = 4;
		private var EvilLen:int = 2;		
		
		public function NetMapMpc()
		{
			msgPool.push(Name);
			msgPool.push(Family);
			msgPool.push(Faction);
			msgPool.push(Party);
			msgPool.push(Title);
			msgPool.push(SaleAd);
			msgPool.push(IndTitle);
			msgPool.push(Halo);
			msgPool.push(X);
			msgPool.push(Y);
			msgPool.push(Dir);
			msgPool.push(State);
			msgPool.push(Action);
			msgPool.push(OnTeam);
			msgPool.push(OnSale);
			msgPool.push(Pk);
			msgPool.push(Sex);
			msgPool.push(Level);
			msgPool.push(Promote);
			msgPool.push(ClothClass);
			msgPool.push(WeaponClass);
			msgPool.push(RideClass);
			msgPool.push(ClothFive);
			msgPool.push(WeaponFive);
			msgPool.push(RideFive);
			msgPool.push(Mount);
			msgPool.push(Cloth);
			msgPool.push(Weapon);
			msgPool.push(Ride);
			msgPool.push(Life);
			msgPool.push(LifeMax);
			msgPool.push(Evil);
			
			
			msgLen.push(NameLen);
			msgLen.push(FamilyLen);
			msgLen.push(FactionLen);
			msgLen.push(PartyLen);
			msgLen.push(TitleLen);
			msgLen.push(SaleAdLen);
			msgLen.push(IndTitleLen);
			msgLen.push(HaloLen);
			msgLen.push(XLen);
			msgLen.push(YLen);
			msgLen.push(DirLen);
			msgLen.push(StateLen);
			msgLen.push(ActionLen);
			msgLen.push(OnTeamLen);
			msgLen.push(OnSaleLen);
			msgLen.push(PkLen);
			msgLen.push(SexLen);
			msgLen.push(LevelLen);
			msgLen.push(PromoteLen);
			msgLen.push(ClothClassLen);
			msgLen.push(WeaponClassLen);
			msgLen.push(RideClassLen);
			msgLen.push(ClothFiveLen);
			msgLen.push(WeaponFiveLen);
			msgLen.push(RideFiveLen);
			msgLen.push(MountLen);
			msgLen.push(ClothLen);
			msgLen.push(WeaponLen);
			msgLen.push(RideLen);
			msgLen.push(LifeLen);
			msgLen.push(LifeMaxLen);
			msgLen.push(EvilLen);
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Family = msgPool[1];
			Faction = msgPool[2];
			Party = msgPool[3];
			Title = msgPool[4];
			SaleAd = msgPool[5];
			IndTitle = msgPool[6];
			Halo = msgPool[7];
			X = msgPool[8];
			Y = msgPool[9];
			Dir = msgPool[10];
			State = msgPool[11];
			Action = msgPool[12];
			OnTeam = msgPool[13];
			OnSale = msgPool[14];
			Pk = msgPool[15];
			Sex = msgPool[16];
			Level = msgPool[17];
			Promote = msgPool[18];
			ClothClass = msgPool[19];
			WeaponClass = msgPool[20];
			RideClass = msgPool[21];
			ClothFive = msgPool[22];
			WeaponFive = msgPool[23];
			RideFive = msgPool[24];
			Mount = msgPool[25];
			Cloth = msgPool[26];
			Weapon = msgPool[27];
			Ride = msgPool[28];
			Life = msgPool[29];
			LifeMax = msgPool[30];
			Evil = msgPool[31];
		}		
	}
}