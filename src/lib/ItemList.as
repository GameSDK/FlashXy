package lib
{
	import com.socket.msg.NetPlayerItem;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class ItemList extends ResourcePool
	{
		public static var WHERE_MAP:int=0;//地图0
		public static var	WHERE_EQUIP:int=1;//装备12
		public static var WHERE_CARRY:int=2;//包裹49
		public static var WHERE_STORE:int=3;//仓库56
		public static var WHERE_TRADE:int=4;//交易21
		public static var WHERE_SALE:int=5;//摆摊56
		public static var	WHERE_COMB:int=6;//合成6
		public static var	WHERE_CARRY2:int=7;//包裹49
		public static var	WHERE_CARRY3:int=8;//包裹49
		public static var WHERE_CARRY4:int=9;//包裹49
		public static var WHERE_STORE2:int=10;//仓库56
		public static var WHERE_STORE3:int=11;//仓库56
		public static var	WHERE_STORE4:int=12;//仓库56
		public static var WHERE_BOX:int=13;//宝箱56
		public static var WHERE_TEMP:int=14;//暂存56
		
		
		public static var ITEM_NUM:int = 72;// 格子最大数量
		private static var  MAX_ITEM_WHERE:int=		16;//包裹数最大值
		private var  MAX_USE_WHERE	:int=	12;//快捷栏最大值
		public static var  GRID_SIZE	:int=	36;//物品格子大小
		
		public static var G_ItemRect:Array = new Array(MAX_ITEM_WHERE);
		public var DrawList:Array = new Array(MAX_ITEM_WHERE);
		public var QuickDrawList:Sprite = new Sprite();		
		
		public function ItemList()
		{
			super();
			for (var i:int = 0; i < MAX_ITEM_WHERE; i++)
			{
				G_ItemRect[i] = new Array(ITEM_NUM);
				//DrawList[i] = new Array(ITEM_NUM);		
				
				//for(var j:int = 0; j < ITEM_NUM; j++)
				//{
					var spr:Sprite  = new Sprite ();
						
					DrawList[i] = spr;
				//}
			}
		}
		//*****************************************************************************
		public function Init(Where:int, X:int, Y:int, W:int, H:int, Row:int, Col:int):void
		{
			var Num:int = 0;

			
			for (var m_Y:int = 0; m_Y < Row; m_Y++)
			{
				for (var m_X:int = 0; m_X < Col; m_X++)
				{
					var Rect:Rectangle = new Rectangle();
					
					Rect.left = X + m_X * W;
					Rect.top = Y + m_Y * H;
					Rect.right = X + m_X * W + GRID_SIZE;
					Rect.bottom = Y + m_Y * H + GRID_SIZE;
					
					G_ItemRect[Where][Num] = Rect;
					Num++;
				}
			}
		}
		// 设置物品格子坐标
		public function InitSetRect(Where:int, Index:int, X:int, Y:int, W:int, H:int):void
		{
			var Rect:Rectangle = new Rectangle();			
			
			Rect.left = X;
			Rect.top = Y;
			Rect.right = X + GRID_SIZE;
			Rect.bottom = Y + GRID_SIZE;
			
			G_ItemRect[Where][Index] = Rect;			
		}

		public function AddItem(Msg:NetPlayerItem):Item
		{
			var item:Item = getResource(Msg.Id) as Item;			
			if (item == null)
			{
				item = new Item();
				item.name = Msg.Id;
				addResource(item.name, item);				
			}
			item.GetNetMsg(Msg);
			item.x = G_ItemRect[Msg.Where][Msg.Index].left;
			item.y = G_ItemRect[Msg.Where][Msg.Index].top;
			
			DrawList[Msg.Where].addChild(item);
			if (item.m_Quick > 0)
			{
				item.LoadQuick(QuickDrawList);
			}			
			return item;
		}		
		public function Draw(x:int, y:int, where:int):void
		{
			for (var key:String in pool)
			{
				var item:Item = getResource(key) as Item;
				if (item && item.m_Where == where)
				{
					item.DrawItem(x, y);
				}
			}			
		}		
		public function GetItem(X:int, Y:int, Where:int):Item
		{
			for (var key:String in pool)
			{
				var item:Item = getResource(key) as Item;
				if (item && item.m_Where == Where)
				{
					if (item.PtInItem(X, Y))
						return item;
				}
			}	
			return null;
		}	
		public function GetItemIndex(X:int, Y:int, Where:int):int
		{
			for (var i:int = 0; i < ITEM_NUM; i++)
			{
				// 查找完所有设定位置
				if (G_ItemRect[Where][i] == null)
					return -1;
				if (G_ItemRect[Where][i].contains (X, Y)) 
					return i;
			}
			return -1;
		}
		public function GetItemByIndex(Where:int, Index:int):Item
		{
			if (Index < 0 || Index >= ITEM_NUM)
				return null;
			return GetItem(G_ItemRect[Where][Index].left, G_ItemRect[Where][Index].top, Where);
		}
		
		public function SwapItemForXY(item:Item, X:int, Y:int, Where:int):Boolean
		{
			var i:int = GetItemIndex(X, Y, Where);
			if (i < 0)
				return false;
			var OldItem:Item = GetItem(X, Y, Where);
			if (OldItem != null)
			{
				// 交换物品位置
				if (item)
				{
					// 要放下自己。
					if (item.name == OldItem.name)
					{
						OldItem.m_PickUp = 0;
						return false;
					}
					// 从装备拿下来时，要判断是否可以交换
					if (item.m_Where == WHERE_EQUIP &&
						(item.kind != OldItem.kind ||
							!OldItem.CanEquip(item.m_Index)))
					{
						// 放回原地
						item.m_PickUp = 0;
						return false;
					}
				}
					// 申请拿起物品
				else
				{
					OldItem.SendPickItem();
				}
				//OldItem->PlayPickSound();
			}
			// 放下物品
			if (item)
			{
				//Item->PlayDropSound();
				item.SendDropItem(Where, i);
			}
			return true;
		}
		//*****************************************************************************
		public function SwapItemForIndex(item:Item, Index:int, Where:int):Boolean
		{
			if (Index < 0)
				return false;
			var OldItem:Item = GetItemByIndex(Where, Index);
			if (OldItem)
			{
				// 交换物品位置
				if (item)
				{
					// 要放下自己。
					if (item.name == OldItem.name)
					{
						OldItem.m_PickUp = 0;
						return false;
					}
					// 从装备拿下来时，要判断是否可以交换
					if (item.m_Where == WHERE_EQUIP &&
						(item.kind != OldItem.kind ||
							!OldItem.CanEquip(item.m_Index)))
					{
						// 放回原地
						item.m_PickUp = 0;
						return false;
					}
				}
					// 申请拿起物品
				else
				{
					OldItem.SendPickItem();
				}
				//OldItem.PlayPickSound();
			}
			// 放下物品
			if (item)
			{
				//Item->PlayDropSound();
				item.SendDropItem(Where, Index);
			}
			return true;
		}
		public function FindItem(name:String):Item
		{
			return getResource(name) as Item;
		}
		//*****************************************************************************
		public function GetQuickItem(Index:int):Item
		{
			var item:Item = null;
			for (var key:String in pool)
			{
				item = getResource(key) as Item;
				if (item.m_Quick == Index)
					return item;
			}
			return null;
		}	
		public function OnTimer():void
		{
			
		}
	}
}