package lib
{
	import com.socket.msg.NetPlayerData;
	import com.socket.msg.NetPlayerMain;
	import com.socket.msg.NetSpcMagic;
	import com.socket.msg.NetSpcPos;
	import com.socket.msg.NetSpcRun;
	
	import flash.display.BitmapData;

	public class Player extends OtherPlayer
	{
		public var itemList:ItemList = new ItemList();
		public var skillList:SkillList = new SkillList();
		public var mapName:String;
	
		
		//public var m_MagicLevel:MagicList = new MagicList();
		
		public function Player()
		{
			super();
			type = TYPE_PL;
			
			//this.rotationY = 30;
			
		}
		override public function Init():void
		{
			// 装备栏位置
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 0, 126, 108, 37, 37);//武器
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 2, 168, 108, 37, 37);//帽子
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 1, 126, 149, 37, 37);//衣服
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 4, 126, 190, 37, 37);//腰带
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 5, 294, 148, 37, 37);//护腕
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 3, 126, 231, 37, 37);//鞋子
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 6, 252, 108, 37, 37);//项链
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 8, 294, 191, 37, 37);//戒指1
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 9, 294, 232, 37, 37);//戒指2
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 7, 294, 108, 37, 37);//玉佩
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 10, 294, 272, 37, 37);//宠物
			itemList.InitSetRect(ItemList.WHERE_EQUIP, 11, 126, 272, 37, 37);//坐骑
			
			
			itemList.Init(ItemList.WHERE_CARRY, 30, 66, 37, 37, 7, 7);//包裹
			itemList.Init(ItemList.WHERE_TRADE, 31, 236, 37, 37, 3, 7);//交易
			itemList.Init(ItemList.WHERE_STORE, 30, 72, 37, 37, 8, 7);//仓库
			itemList.Init(ItemList.WHERE_SALE, 32, 70, 37, 37, 8, 7);//摆摊
			itemList.Init(ItemList.WHERE_CARRY2, 30, 66, 37, 37, 7, 7);//包裹2
			itemList.Init(ItemList.WHERE_CARRY3, 30, 66, 37, 37, 7, 7);//包裹3
			itemList.Init(ItemList.WHERE_CARRY4, 30, 66, 37, 37, 7, 7);//包裹4
			itemList.Init(ItemList.WHERE_STORE2, 30, 72, 37, 37, 8, 7);//仓库2
			itemList.Init(ItemList.WHERE_STORE3, 30, 72, 37, 37, 8, 7);//仓库3
			itemList.Init(ItemList.WHERE_STORE4, 30, 72, 37, 37, 8, 7);//仓库4			

			skillList.Init(30, 88, 55, 38, 7, 5, 36);
		
		}
		public function RecvMsgMain(playerDatan:NetPlayerMain):void
		{		
			name = playerDatan.Name;
			//dispName =  playerDatan.Name;
			this.SetName(playerDatan.Name);			
		}
		/*private function SetName():void
		{
			
			textName.htmlText = dispName;
			textName.textColor = 0xffffff;
			textName.x = sx - Map.MapX;
			textName.y = sy - Map.MapY;
			textName.mouseEnabled = false;
			addChild(textName);
		}	*/	
		public function RecvMsgData(playerDatan:NetPlayerData):void
		{
			sx = playerDatan.MapX;
			sy = playerDatan.MapY;
			ChangeState();
		}
		public function SendSpcPos():void
		{
			var msg:NetSpcPos = new NetSpcPos();
			//msg.Name = "1";
			msg.X = sx;
			msg.Y = sy;
			msg.SendMsg();
		}
		public function SendSpcRun(X:int, Y:int):void
		{
			var msg:NetSpcRun = new NetSpcRun();
			msg.Name = name;
			msg.SrcX = sx;
			msg.SrcY = sy;
			msg.DesX = X;
			msg.DesY = Y;
			msg.Speed = speed;		
			msg.SendMsg();
		}
		//*****************************************************************************
		public function SendSpcMagic(obj:Npc, MagicName:String, X:int, Y:int):void
		{
			var msg:NetSpcMagic = new NetSpcMagic();		
			msg.Name = name;
			msg.MagicName = MagicName;
			if (obj != null)
			{
				if (obj.type == TYPE_PET)
					msg.ObjName = obj.m_Owner;
				else
					msg.ObjName = obj.name;
				msg.Type = obj.type;
			}
			else
			{
				msg.ObjName = "";
				msg.Type = 0;
			}
			msg.SrcX = sx;
			msg.SrcY = sy;
			msg.DesX = X;
			msg.DesY = Y;
			msg.SendMsg();
		}		
		public override function OnTimer():void
		{
			super.OnTimer();
		}
	}
}