package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerItem extends PlayerMsg
	{
		public var	Name:String = "";//角色名称
		public var	Id:String = "";//物品ID
		public var	Item:String = "";//物品名称
		public var	Where:int = 0;//物品位置
		public var	Index:int = 0;//物品编号
		public var	Quick:int = 0;//物品快捷
		public var	Num:int = 0;//物品数量
		public var	Bind:int = 0;//物品绑定
		public var	Level:int = 0;//物品等级
		public var	Class:int = 0;//物品颜色
		public var	Quality:int = 0;//物品品质
		public var	Star:int = 0;//物品强化
		public var	Five:int = 0;//五行属性
		public var	Appe:int = 0;//物品属性
		public var	Wear:int = 0;//物品耐久
		public var	Cost:int = 0;//物品摆摊标价
		public var	Life:int = 0;//物品存储生命
		public var	Mana:int = 0;//物品存储法力
		public var	PlanNum:int = 0;//计划收购数量

		private var NameLen:int = 20;//角色名称
		private var IdLen:int = 20;//物品ID
		private var ItemLen:int = 20;//物品名称
		private var WhereLen:int = 1;//物品位置
		private var IndexLen:int = 1;//物品编号
		private var QuickLen:int = 1;//物品快捷
		private var NumLen:int = 1;//物品数量
		private var BindLen:int = 1;//物品绑定
		private var LevelLen:int = 1;//物品等级
		private var ClassLen:int = 1;//物品颜色
		private var QualityLen:int = 1;//物品品质
		private var StarLen:int = 1;//物品强化
		private var FiveLen:int = 1;//五行属性
		private var AppeLen:int = 4;//物品属性
		private var WearLen:int = 4;//物品耐久
		private var CostLen:int = 4;//物品摆摊标价
		private var LifeLen:int = 4;//物品存储生命
		private var ManaLen:int = 4;//物品存储法力
		private var PlanNumLen:int = 1;//计划收购数量		
		public function NetPlayerItem()
		{
			msgPool.push(Name);
			msgPool.push(Id);//物品ID
			msgPool.push(Item);//物品名称
			msgPool.push(Where);//物品位置
			msgPool.push(Index);//物品编号
			msgPool.push(Quick);//物品快捷
			msgPool.push(Num);//物品数量
			msgPool.push(Bind);//物品绑定
			msgPool.push(Level);//物品等级
			msgPool.push(Class);//物品颜色
			msgPool.push(Quality);//物品品质
			msgPool.push(Star);//物品强化
			msgPool.push(Five);//五行属性
			msgPool.push(Appe);//物品属性
			msgPool.push(Wear);//物品耐久
			msgPool.push(Cost);//物品摆摊标价
			msgPool.push(Life);//物品存储生命
			msgPool.push(Mana);//物品存储法力
			msgPool.push(PlanNum);//计划收购数量
			
			msgLen.push(NameLen);
			msgLen.push(IdLen);//物品ID
			msgLen.push(ItemLen);//物品名称
			msgLen.push(WhereLen);//物品位置
			msgLen.push(IndexLen);//物品编号
			msgLen.push(QuickLen);//物品快捷
			msgLen.push(NumLen);//物品数量
			msgLen.push(BindLen);//物品绑定
			msgLen.push(LevelLen);//物品等级
			msgLen.push(ClassLen);//物品颜色
			msgLen.push(QualityLen);//物品品质
			msgLen.push(StarLen);//物品强化
			msgLen.push(FiveLen);//五行属性
			msgLen.push(AppeLen);//物品属性
			msgLen.push(WearLen);//物品耐久
			msgLen.push(CostLen);//物品摆摊标价
			msgLen.push(LifeLen);//物品存储生命
			msgLen.push(ManaLen);//物品存储法力
			msgLen.push(PlanNumLen);//计划收购数量			

		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Id = msgPool[1];
			Item = msgPool[2];
			Where = msgPool[3];
			Index = msgPool[4];
			Quick = msgPool[5];
			Num = msgPool[6];
			Bind = msgPool[7];
			Level = msgPool[8];
			Class = msgPool[9];
			Quality = msgPool[10];
			Star = msgPool[11];
			Five = msgPool[12];
			Appe = msgPool[13];
			Wear = msgPool[14];
			Cost = msgPool[15];
			Life = msgPool[16];
			Mana = msgPool[17];
			PlanNum = msgPool[18];		
		}
	}
}