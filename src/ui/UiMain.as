package ui
{
	import com.bit101.components.Component;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;	
	import lib.Item;
	import lib.ItemList;
	import lib.Obj;
	import lib.Skill;
	
	public class UiMain extends UiNode
	{

		//int				m_OnlineTime;//在线时间
		//int				m_QuickNum;
		//int				m_Move;
		//RECT			m_Rect[30];
		//KmItem			m_Item;//聊天栏物品提示
		
		public var m_Rect:Array = new Array(20);
		private var m_QuickNum:int = 0;
		public var DrawList:Array = new Array(20);

		
		public function UiMain()
		{
			super();
			xmlConfig.loadXML("asset/ui/Main.xml");			
			xmlConfig.addEventListener(Event.COMPLETE, onLoadComplete);
			
			InitQuick(1, 15, 37, 38, 1, 5);
			//InitQuickLR();
			InitQuick(194, 15, 37, 38, 1, 7);
			
			this.addEventListener(Event.ENTER_FRAME, onDraw);				
			
		}
		public function onLoadComplete(event:Event):void
		{
			var win:Component = xmlConfig.getCompById("main") as Component;
			if (win)
			{
				//win.addChild(GameDemo.player.skillList.QuickDrawList);
				//win.addChild(GameDemo.player.itemList.DrawList[ItemList.WHERE_CARRY]);				
				for (var i:int = 0; i < m_QuickNum; i++)
				{
					win.addChild(DrawList[i]);
				}
			}			
			
		}			
		public function OnClick(e:Event):void
		{
			if (e.currentTarget.name == "pack")
				GameDemo.uiPack.Show();
			else if (e.currentTarget.name == "tasklog")
				GameDemo.uiTaskLog.Show();
			else if (e.currentTarget.name == "skill")
				GameDemo.uiSkill.Show();
		}
		
		override public function Resize():void
		{
			
			if (MainDraw.CanvasWidth > 0 && MainDraw.CanvasHeight > 0)
			{
				var win:Component = xmlConfig.getCompById("main");
				if (win)
					win.DoAlign();
				
			}
		}		
		public function InitQuick(X:int, Y:int, W:int, H:int, Row:int, Col:int):void
		{
			
			for (var m_Y:int = 0; m_Y < Row; m_Y++)
			{
				for (var m_X:int = 0; m_X < Col; m_X++)
				{
					var Rect:Rectangle = new Rectangle();
					
					Rect.left = X + m_X * W;
					Rect.top = Y + m_Y * H;
					Rect.right = X + m_X * W + ItemList.GRID_SIZE;
					Rect.bottom = Y + m_Y * H + ItemList.GRID_SIZE;
					
					m_Rect[m_QuickNum] = Rect;
					
					var spr:Bitmap = new Bitmap();
					DrawList[m_QuickNum] = spr;
					
					m_QuickNum++;
					
				}
			}
		}	
		private function onDraw(e:Event):void
		{
			var win:Component = xmlConfig.getCompById("main");
			if (win)
			{
				DrawSkill();
				DrawItem();
				//GameDemo.player.skillList.Draw(win.x, win.y, 0);
			}
		}		
		//---------------------------------------------------------------------------
		private function DrawSkill():void
		{
			//KmSkill* Skill = (KmSkill*)GpSpc->m_SkillList.GetHead();
			//while (Skill)
			//{
			//	if (Skill->m_Quick && (Skill->m_Quick - 1) / Width == 0)
			//		Skill->DrawQuick(X + m_Rect[Skill->m_Quick - 1].left+1,
			//			Y + m_Rect[Skill->m_Quick - 1].top);
			//	Skill = (KmSkill*)Skill->GetNext();
			//}
			
			for (var key:String in GameDemo.player.skillList.pool)
			{
				var skill:Skill = GameDemo.player.skillList.getResource(key) as Skill;
				if (skill && skill.m_Quick > 0)
				{
					skill.DrawQuickSkill(m_Rect[skill.m_Quick - 1].left, 
						m_Rect[skill.m_Quick - 1].top, DrawList[skill.m_Quick - 1]);
				}
			}				
		}
		//---------------------------------------------------------------------------
		private function DrawItem():void
		{
			//KmItem* Item = (KmItem*)GpSpc->m_ItemList.GetHead();
			//while (Item)
			//{
			//	if (Item->m_Quick && (Item->m_Quick - 1) / Width == 0)
			//		Item->DrawQuick(X + m_Rect[Item->m_Quick - 1].left+1,
			//			Y + m_Rect[Item->m_Quick - 1].top);
			//	Item = (KmItem*)Item->GetNext();
			//}
			for (var key:String in GameDemo.player.itemList.pool)
			{
				var item:Item = GameDemo.player.itemList.getResource(key) as Item;
				if (item && item.m_Quick > 0)
				{
					item.DrawQuickItem(m_Rect[item.m_Quick - 1].left, 
						m_Rect[item.m_Quick - 1].top, DrawList[item.m_Quick - 1]);
				}
			}			
		}		
		//---------------------------------------------------------------------------
		private function GetQuickIndex(X:int, Y:int):int
		{
			for (var i:int = 0; i < m_QuickNum; i++)
			{
				if (m_Rect[i].contains(X, Y))
					return i;
			}
			return -1;
		}		
		//---------------------------------------------------------------------------
		override public function OnMouseDown(e:MouseEvent):void
		{	
			e.stopPropagation();				
			//KmUiImage *currSkill = (KmUiImage*)FindChild("选中技能");
			var X:int = e.localX;
			var Y:int = e.localY;			
			var i:int = GetQuickIndex(X, Y);
			if (i < 0)
				return ;

			//var skill:Skill;
		
			// 鼠标左键
			if (e.buttonDown)
			{
				var PickNode:Obj;
				var IsItem:Boolean;
				var item:Item = GameDemo.uiPack.GetPickItem();
				if (item)
				{
					if (item.kind != Item.ITEM_OBJ && item.kind != Item.ITEM_TASK)
						return ;
					PickNode = item;
					IsItem = true;
				}
				else
				{
					PickNode = GameDemo.uiSkill.GetPickSkill();
					IsItem = false;
				}
				var Re:int;
				var Node:Obj = SwapQuick(PickNode, Re, i + 1, IsItem);
				if (Node == null)
				{
					GameDemo.uiPack.SetPickItem(null);
					GameDemo.uiSkill.SetPickSkill(null);
					DrawList[i].bitmapData = null;
				}
				else if (Node is Item)
				{
					GameDemo.uiPack.SetPickItem(Node as Item);
					GameDemo.uiPack.m_FreePick = true;
				}
				else if (Node is Skill)
				{
					GameDemo.uiSkill.SetPickSkill(Node as Skill);
					GameDemo.uiSkill.m_FreePick = true;
				}
			}
			//else
			//{
			//	UseQuickItem(i + 1);
			//	currSkill->m_X = m_Rect[i].left;
			//	currSkill->m_Y = m_Rect[i].top - 1;
			//	Skill = GpSpc->m_SkillList.GetQuickSkill(i + 1);
			//	if (Skill)
			//		GpGame->m_UseSkill = i + 1;
			//}
		}
		
		//---------------------------------------------------------------------------
		private function SwapQuick(Node:Obj, Re:int, Quick:int, IsItem:Boolean):Obj
		{
			var oldskill:Skill = GameDemo.player.skillList.GetQuickSkill(Quick);
			var olditem:Item = GameDemo.player.itemList.GetQuickItem(Quick);
			var skill:Skill;
			var item:Item;
			var OldQuick:int;        
			Re = 0;
			if (Node)
			{
				if (IsItem)
				{
					item = Node as Item;
					OldQuick = item.m_Quick;
				}
				else
				{
					skill = Node as Skill;
					OldQuick = skill.m_Quick;
				}
			}
			// 原来位置为技能
			if (oldskill)
			{
				if (Node)
				{
					// 放下自己
					if (oldskill == Node)
					{
						oldskill.m_Picked = false;
						return null;
					}
				
					oldskill.m_Picked = false;
					oldskill.m_Quick = OldQuick;
					oldskill.SendSpcSkill();
				}
				else
				{
					oldskill.m_Picked = true;;
				}
			}
				// 原来位置为物品
			else if (olditem)
			{
				if (Node)
				{
					// 放下自己
					if (olditem == Node)
					{
						olditem.m_PickUp = 0;
						return null;
					}
					
					olditem.m_Quick = OldQuick;
					olditem.m_PickUp = 0;
					olditem.SendQuickItem(OldQuick);
				}
				else
				{
					olditem.m_PickUp = 1;;
				}
			}
			// 放下新物品
			if (Node)
			{
				if (OldQuick > 0)
					DrawList[OldQuick - 1].bitmapData = null;						
				if (IsItem)
				{
					item = Node as Item;
					item.m_Quick = Quick;
					item.m_PickUp = 0;
					item.SendQuickItem(Quick);
				}
				else
				{
					skill = Node as Skill;
					skill.m_Quick = Quick;
					skill.m_Picked = false;
					skill.SendSpcSkill();
				}
			}
			if (Node)
			{
				return null;
			}
			if (olditem)
			{
				Re = 1;
				return olditem;
			}
			else if (oldskill)
			{
				Re = 2;
				return oldskill;
			}
			return null;
		}		
	}
}