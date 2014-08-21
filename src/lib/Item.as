package lib
{
	import com.socket.msg.NetDropItem;
	import com.socket.msg.NetPickItem;
	import com.socket.msg.NetPlayerItem;
	import com.socket.msg.NetQuickItem;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class Item extends Obj
	{
		public static var ITEM_OBJ:int=0;//普通（物品）
		public static var ITEM_WEAPON:int=1;//武器（攻击）
		public static var ITEM_CLOTH:int=2;//衣服（防御）
		public static var ITEM_HAT:int=3;//帽子（防御）
		public static var ITEM_SHOES:int=4;//鞋子（防御）
		public static var ITEM_SASH:int=5;//腰带（防御）
		public static var ITEM_GLOVE:int=6;//护腕（防御）
		public static var ITEM_NECK:int=7;//项链（攻击）
		public static var ITEM_ADORN:int=8;//玉佩（攻击）
		public static var ITEM_RING:int=9;//戒指（攻击）
		public static var ITEM_PET:int=10;//宠物（攻击）
		public static var ITEM_MOUNT:int=11;//坐骑（防御）
		public static var ITEM_TASK:int=12;//任务（物品）		
		
		public var m_DispName:String;
		public var m_Where:int;
		public var m_Index:int;
		public var m_Quick:int;
		public var m_Num:int; 
		public var m_Bind:int;
		public var m_Level:int;
		public var m_Class:int;
		public var m_Quality:int; 
		public var m_Star:int; 
		public var m_Five:int;
		public var m_Appe:int; 
		public var m_Wear:int;
		public var m_UserCost:int;
		public var m_AddLife:int;
		public var m_AddMana:int;
		public var m_PlanNum:int;
		public var m_PickUp:int;
		
		private var textName:TextField = new TextField();			
		private var tips:TextField = new TextField();			
		private var square:Sprite = new Sprite();
		private var pick:Sprite = new Sprite();
		private var m_Intro:String;//简介
		
		public function Item()
		{
			super();
			
			//this.width = ItemList.GRID_SIZE;
			//this.height = ItemList.GRID_SIZE;
			this.mouseEnabled = false;
			addChild(textName);
			
			square.graphics.beginFill(0x000000, 0.5);
			square.graphics.drawRect(0, 0, 100, 200);	
			square.visible = false;
			square.mouseEnabled = false;
			square.x = ItemList.GRID_SIZE;
			tips.textColor = 0xffffff;
			tips.width = 100;
			tips.wordWrap = true;
			square.addChild(tips);
			addChild(square);			
			
			pick.graphics.beginFill(0x000000, 0.5);
			pick.graphics.drawRect(0, 0, ItemList.GRID_SIZE, ItemList.GRID_SIZE);	
			pick.visible = false;
			pick.mouseEnabled = false;
			addChild(pick);			

			addEventListener(MouseEvent.MOUSE_OVER, OnMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, OnMouseOut);
			addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);				
			
		}
		// 从服务器获得物品的可变属性
		public function GetNetMsg(Msg:NetPlayerItem):void
		{
			m_DispName=  Msg.Item;
			m_Where = Msg.Where;
			m_Index = Msg.Index;
			m_Quick = Msg.Quick;
			m_Num = Msg.Num;
			m_Bind = Msg.Bind;
			m_Level = Msg.Level;
			m_Class = Msg.Class;
			m_Quality = Msg.Quality;
			m_Star = Msg.Star;
			m_Five = Msg.Five;
			m_Appe = Msg.Appe;
			m_Wear = Msg.Wear;
			m_UserCost = Msg.Cost;
			m_AddLife = Msg.Life;
			m_AddMana = Msg.Mana;
			m_PlanNum = Msg.PlanNum;
			
			SetNum(m_Num);
			Load();
			//GetData(&GpSpc->m_ItemFile);
		}
		//*****************************************************************************
		// 客户端GM修改物品属性
		public function SetNetMsg(Msg:NetPlayerItem):void
		{
			/*GmStrCopy(p->Id, m_Name);
			GmStrCopy(p->Item, m_DispName);
			p->Where = m_Where;
			p->Index = m_Index;
			p->Quick = m_Quick;
			p->Num = m_Num;
			p->Bind = m_Bind;
			p->Level = m_Level;
			p->Class = m_Class;
			p->Quality = m_Quality;
			p->Star = m_Star;
			p->Five = m_Five;
			p->Appe = m_Appe;
			p->Wear = m_Wear;
			p->Cost = m_UserCost;
			p->Life = m_AddLife;
			p->Mana = m_AddMana;
			p->PlanNum = m_PlanNum;
			//GetData(&GpSpc->m_ItemFile);*/
		}	
		public function Load():void
		{
			LoadImg("asset/ui/紫宝石.png");					
			m_Intro = GameDemo.itemData.GetValueForName(m_DispName, "简介") as String;
			
			/*char FileName[80];
			//重设图像
			memset(m_Image, 0, sizeof(m_Image));
			//掉落地上的图象
			IniFile->GetString(m_DispName, "掉落", "\\face\\掉落\\箱子.img", FileName);
			m_Image[0] = GpImgList->Load(FileName);
			//物品栏内的图标
			IniFile->GetString(m_DispName, "图标", "\\face\\掉落\\问号.img", FileName);
			m_Image[1] = GpImgList->Load(FileName);
			//物品颜色
			if (m_Five)
			{
				GmIntToStr(m_Five, FileName);
				SetPalette(0, GpSpc->m_ItemColor.GetStr(m_DispName, FileName, ""));
			}
			else
			{
				SetPalette(0, IniFile->GetStr(m_DispName, "颜色", ""));
			}
			//按照不同类别显示各种颜色光环
			if (m_Class)
			{
				sprintf(FileName, "\\face\\效果\\%03d.img", m_Class);
				m_Image[2] = GpImgList->Load(FileName);
			}
			//物品掉落和放下的音效
			IniFile->GetString(m_DispName, "声音", "\\sound\\物件\\放下.wav", m_WavFile);
			//物品简介
			IniFile->GetString(m_DispName, "简介", "此物品暂时没有简介", m_Intro);
			//物品所需门派
			IniFile->GetString(m_DispName, "门派", "", m_Party);
			//物品脚本
			IniFile->GetString(m_DispName, "脚本", "", m_LuaFile);
			//其他数值属性
			m_Kind = IniFile->GetInt(m_DispName, "类型", ITEM_OBJ);
			m_Sex = IniFile->GetInt(m_DispName, "性别", 0);
			m_Size =IniFile->GetInt(m_DispName, "大小", 1);
			m_SaleCost = IniFile->GetInt(m_DispName, "卖出价格", 0);
			m_WearMax = IniFile->GetInt(m_DispName, "耐久上限", 0);
			m_RepairCost = IniFile->GetInt(m_DispName, "修理费用", 0);
			m_UseTime = IniFile->GetInt(m_DispName, "使用时间", 0);
			m_IntervalTime = IniFile->GetInt(m_DispName, "间隔时间", 0);
			m_Speed = IniFile->GetInt(m_DispName, "增加速度", 0);
			m_AddLifeMax = IniFile->GetInt(m_DispName, "存储生命", 0);
			m_AddManaMax = IniFile->GetInt(m_DispName, "存储法力", 0);
			m_EffectKind = IniFile->GetInt(m_DispName, "效果类型", 0);
			m_EffectValue = IniFile->GetInt(m_DispName, "效果数值", 0);
			m_EffectTime = IniFile->GetInt(m_DispName, "效果时间", 0);
			// 以下是32个附加属性
			m_Life[0] = IniFile->GetInt(m_DispName, "生命", 0);
			m_Mana[0] = IniFile->GetInt(m_DispName, "法力", 0);
			m_Life[1] = IniFile->GetInt(m_DispName, "生命强化", 0);
			m_Mana[1] = IniFile->GetInt(m_DispName, "法力强化", 0);
			m_Life[2] = IniFile->GetInt(m_DispName, "生命回复", 0);
			m_Mana[2] = IniFile->GetInt(m_DispName, "法力回复", 0);
			m_Attack[0] = IniFile->GetInt(m_DispName, "攻击", 0);
			m_Defend[0] = IniFile->GetInt(m_DispName, "防御", 0);
			m_Attack[1] = IniFile->GetInt(m_DispName, "普攻", 0);
			m_Defend[1] = IniFile->GetInt(m_DispName, "普防", 0);
			m_Attack[2] = IniFile->GetInt(m_DispName, "金攻", 0);
			m_Defend[2] = IniFile->GetInt(m_DispName, "金防", 0);
			m_Attack[3] = IniFile->GetInt(m_DispName, "木攻", 0);
			m_Defend[3] = IniFile->GetInt(m_DispName, "木防", 0);
			m_Attack[4] = IniFile->GetInt(m_DispName, "水攻", 0);
			m_Defend[4] = IniFile->GetInt(m_DispName, "水防", 0);
			m_Attack[5] = IniFile->GetInt(m_DispName, "火攻", 0);
			m_Defend[5] = IniFile->GetInt(m_DispName, "火防", 0);
			m_Attack[6] = IniFile->GetInt(m_DispName, "土攻", 0);
			m_Defend[6] = IniFile->GetInt(m_DispName, "土防", 0);
			m_Attack[7] = IniFile->GetInt(m_DispName, "攻击强化", 0);
			m_Defend[7] = IniFile->GetInt(m_DispName, "防御强化", 0);
			m_Accuracy[0] = IniFile->GetInt(m_DispName, "命中", 0);
			m_Dodge[0] = IniFile->GetInt(m_DispName, "闪避", 0);
			m_Accuracy[1] = IniFile->GetInt(m_DispName, "命中提升", 0);
			m_Dodge[1] = IniFile->GetInt(m_DispName, "闪避提升", 0);
			m_Accuracy[2] = IniFile->GetInt(m_DispName, "命中强化", 0);
			m_Dodge[2] = IniFile->GetInt(m_DispName, "闪避强化", 0);
			m_Attr[0] = IniFile->GetInt(m_DispName, "力量", 0);
			m_Attr[1] = IniFile->GetInt(m_DispName, "敏捷", 0);
			m_Attr[2] = IniFile->GetInt(m_DispName, "体质", 0);
			m_Attr[3] = IniFile->GetInt(m_DispName, "精神", 0);
			m_Attr[4] = IniFile->GetInt(m_DispName, "智力", 0);
			m_Attr[5] = IniFile->GetInt(m_DispName, "属性强化", 0);
			m_Hurt[0] = IniFile->GetInt(m_DispName, "增加伤害", 0);
			m_Hurt[1] = IniFile->GetInt(m_DispName, "减少伤害", 0);
			// 防止数量超出上限
			if (m_PlanNum == 0 && m_Num < 1)
				m_Num = 1;
			// 防止绑定超出上限
			if (m_Bind > 1)
				m_Bind = 1;
			// 防止类别超出上限
			if (m_Class > 4)
				m_Class = 4;
			// 防止品质超出上限
			if (m_Quality > 4)
				m_Quality = 4;
			// 防止强化超出上限
			if (m_Star > 15)
				m_Star = 15;
			
			// 普通物品，售出价格由颜色决定
			if (m_Kind > ITEM_OBJ && m_Kind < ITEM_TASK)
			{
				// 计算装备的等级数值，品质,类别,强化,绑定对属性的提升
				if (m_Level + m_Quality + m_Class + m_Star > 0)
				{
					float Level = (float)m_Level - 1;
					float Number = pow(1.1f, m_Quality + m_Class + m_Star);
					#define ITEMADD(s,f) s=(int)((1+f*Level)*s*Number)
					ITEMADD(m_RepairCost, 0.10f);
					ITEMADD(m_WearMax, 0.10f);
					ITEMADD(m_Life[0], 0.22f);
					ITEMADD(m_Mana[0], 0.22f);
					ITEMADD(m_Life[1], 0.002f);
					ITEMADD(m_Mana[1], 0.002f);
					ITEMADD(m_Life[2], 0.002f);
					ITEMADD(m_Mana[2], 0.002f);
					ITEMADD(m_Attack[0], 0.24f);
					ITEMADD(m_Attack[1], 0.20f);
					ITEMADD(m_Attack[2], 0.20f);
					ITEMADD(m_Attack[3], 0.20f);
					ITEMADD(m_Attack[4], 0.20f);
					ITEMADD(m_Attack[5], 0.20f);
					ITEMADD(m_Attack[6], 0.20f);
					ITEMADD(m_Attack[7], 0.002f);
					ITEMADD(m_Defend[0], 0.24f);
					ITEMADD(m_Defend[1], 0.20f);
					ITEMADD(m_Defend[2], 0.20f);
					ITEMADD(m_Defend[3], 0.20f);
					ITEMADD(m_Defend[4], 0.20f);
					ITEMADD(m_Defend[5], 0.20f);
					ITEMADD(m_Defend[6], 0.20f);
					ITEMADD(m_Defend[7], 0.002f);
					ITEMADD(m_Accuracy[0], 0.20f);
					ITEMADD(m_Accuracy[1], 0.20f);
					ITEMADD(m_Accuracy[2], 0.002f);
					ITEMADD(m_Dodge[0], 0.20f);
					ITEMADD(m_Dodge[1], 0.20f);
					ITEMADD(m_Dodge[2], 0.002f);
					ITEMADD(m_Attr[0], 0.10f);
					ITEMADD(m_Attr[1], 0.10f);
					ITEMADD(m_Attr[2], 0.10f);
					ITEMADD(m_Attr[3], 0.10f);
					ITEMADD(m_Attr[4], 0.10f);
					ITEMADD(m_Attr[5], 0.01f);
					ITEMADD(m_Hurt[0], 0.05f);
					ITEMADD(m_Hurt[1], 0.05f);
				}
			}
			// 只受颜色影响
			if (m_Class)
			{
				m_SaleCost += m_SaleCost * m_Class;
				m_EffectValue += m_EffectValue * m_Class;
				m_AddLifeMax += m_AddLifeMax * m_Class;
				m_AddManaMax += m_AddManaMax * m_Class;
				if (m_Speed)
					m_Speed += m_Class;
			}
			m_Width = GRID_SIZE;
			m_Height = GRID_SIZE;
			m_Type = TYPE_ITM;*/
		}
		public function LoadQuick(parent:Sprite):void
		{
			
			var img:Bitmap = new Bitmap();		
			imgBitmap[1] = img;
			parent.addChild(imgBitmap[1]);
		}		
		public function SetNum(num:int):void
		{
			textName.text = num.toString();
			textName.textColor = 0xffffff;
			textName.x = 0;
			textName.y = 18;
			textName.mouseEnabled = false;
		}		
		public function DrawItem(X:int, Y:int):void
		{
			gameImg = ImgList.getInstance().GetRes(imgFile[0]);
			if (gameImg)
			{
				//dirFrm = gameImg.GetFrame() / dirNum;
				//var Frame:int = frame + dir * dirFrm;				
				gameImg.DrawBitMap(X, Y, 0, imgBitmap[0]);
				
				if (m_PickUp == 1)
					pick.visible = true;
				else
					pick.visible = false;
					
				//	gameImg.DrawBitMap(sx - Map.MapX, sy - Map.MapY, 0, imgBitmap[0]);
			}
		}	
		public function DrawQuickItem(X:int, Y:int, img:Bitmap):void
		{
			gameImg = ImgList.getInstance().GetRes(imgFile[0]);
			if (gameImg)
			{
				gameImg.DrawBitMap(X, Y, 0, img);

			}
		}		
		public function DrawItemPos(X:int, Y:int, img:Bitmap):void
		{
			gameImg = ImgList.getInstance().GetRes(imgFile[0]);
			if (gameImg)
			{
				//dirFrm = gameImg.GetFrame() / dirNum;
				//var Frame:int = frame + dir * dirFrm;				
				gameImg.DrawBitMap(X - ItemList.GRID_SIZE / 2, Y - ItemList.GRID_SIZE / 2, 0, img);
			}
			
		}
		
		public function DrawHint(X:int, Y:int):void
		{
			//X += m_X;
			//Y += m_Y;
			//DrawHintPos(X, Y, 12, POS_RIGHT);
			//trace(m_DispName);
			if (this.parent)
			{
				this.parent.addChild(square);	
			}
			tips.htmlText = m_DispName + "\n" + m_Intro;
			square.visible = true;
			square.x = X;
			square.y = Y;

			
		}
		public function HideHint():void
		{
			square.visible = false;;
		}		
		private function OnMouseOver(e:MouseEvent):void
		{
			square.visible = true;			
		}
		private function OnMouseOut(e:MouseEvent):void
		{
			square.visible = false;;			
		}
		private function OnMouseMove(e:MouseEvent):void
		{
			e.stopPropagation();
		}		
		public function PtInItem(X:int, Y:int):Boolean
		{
			return (X >= x && X < x + ItemList.GRID_SIZE && Y >= y && Y < y + ItemList.GRID_SIZE);
		}		
		public function SendPickItem():void
		{
			var msg:NetPickItem = new NetPickItem();
			msg.Name = name;
			msg.Where = m_Where;
			msg.Index = m_Index;
			msg.Num = m_Num;
			msg.SendMsg();			
		}
		public function SendDropItem(Where:int, Index:int):void
		{
			var msg:NetDropItem = new NetDropItem();
			msg.Name = name;
			msg.Where = Where;
			msg.Index = Index;
			msg.SendMsg();	
		}
		public function SendQuickItem(Quick:int):void
		{
			var msg:NetQuickItem = new NetQuickItem();
			msg.Name = name;
			msg.Index = Quick;
			msg.SendMsg();				
		}
		public function CanEquip(Part:int):Boolean
		{
			return true;
		}

		
	}
}