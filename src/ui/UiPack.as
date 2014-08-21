package ui
{
	import com.bit101.components.BaseWindow;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import lib.Item;
	import lib.ItemList;
	
	public class UiPack extends UiNode
	{
		private var HintItem:Item = null;
		public var m_FreePick:Boolean;
		private var m_ItemIndex:int;
		public function UiPack()
		{
			super();
			xmlConfig.loadXML("asset/ui/Pack.xml");		
			xmlConfig.addEventListener(Event.COMPLETE, onLoadComplete);
			
			this.addEventListener(Event.ENTER_FRAME, onDraw);			
		
		}
		public function onLoadComplete(event:Event):void
		{
			//for(var j:int = 0; j < ItemList.ITEM_NUM; j++)
			//{
			var win:BaseWindow = xmlConfig.getCompById("pack") as BaseWindow;
			if (win)
			{
				win.addChild(GameDemo.player.itemList.DrawList[ItemList.WHERE_CARRY]);
			}			
			
		}		
		private function onDraw(e:Event):void
		{
			var win:BaseWindow = xmlConfig.getCompById("pack") as BaseWindow;
			if (win)
			{
				GameDemo.player.itemList.Draw(0, 0, ItemList.WHERE_CARRY);
			}
		}
		override public function OnMouseMove(e:MouseEvent):void
		{
			if (HintItem)
			{
				HintItem.HideHint();
			}
			HintItem = GameDemo.player.itemList.GetItem(e.localX, e.localY, ItemList.WHERE_CARRY);
			if (HintItem)
				HintItem.DrawHint(e.localX, e.localY);
		}	
		override public function OnMouseDown(e:MouseEvent):void
		{
			var item:Item;
			var PickItem:Item = GameDemo.player.itemList.FindItem(GameDemo.pickItemName);
			var X:int = e.localX;
			var Y:int = e.localY;
			
			e.stopPropagation();			
			// 鼠标左键
			if (e.buttonDown)
			{
				// 物品栏部分
				//if (page->m_PageIdx == 1)
					m_ItemIndex = GameDemo.player.itemList.GetItemIndex(X, Y, ItemList.WHERE_CARRY);
				//else if (page->m_PageIdx == 2)
				//	m_ItemIndex = GpSpc->m_ItemList.GetItemIndex(X, Y, WHERE_CARRY2);
				//else if (page->m_PageIdx == 3)
				//	m_ItemIndex = GpSpc->m_ItemList.GetItemIndex(X, Y, WHERE_CARRY3);
				//else if (page->m_PageIdx == 4)
				//	m_ItemIndex = GpSpc->m_ItemList.GetItemIndex(X, Y, WHERE_CARRY4);
				
				if (m_ItemIndex >= 0)
				{
					//if (page->m_PageIdx == 1)
					item = GameDemo.player.itemList.GetItem(X, Y, ItemList.WHERE_CARRY);
					//else if (page->m_PageIdx == 2)
					//	Item = GpSpc->m_ItemList.GetItem(X, Y, WHERE_CARRY2);
					//else if (page->m_PageIdx == 3)
					//	Item = GpSpc->m_ItemList.GetItem(X, Y, WHERE_CARRY3);
					//else if (page->m_PageIdx == 4)
					//	Item = GpSpc->m_ItemList.GetItem(X, Y, WHERE_CARRY4);
					
					// 修理装备
					/*if (GpGame->m_nCursor == csRepair)
					{
						Repair(Item);
						return;
					}
					if (GpGame->m_nCursor == csSale)
					{
						if (Item)
						{
							if (!Item->m_SaleCost)
							{
								GpGame->ShowMessage("此物品不能出售");
								return;
							}
							if (Item->m_Class)
							{
								//m_SaleItem = Item;
								strcpy(m_SaleItemName, Item->m_Name);
								GpGame->ShowMessage("确定要出售这件物品吗？", OnEquipSaleItem);
								return;
							}
							GpShop->SaleItem(Item);
						}
						return;
					}*/
					if (item && PickItem == null)
					{
						// 分割物品
						if (e.ctrlKey)
						{
							//SplitItem(Item);
							return;
						}
						// 取得物品名称
						if (e.shiftKey)
						{
							//ChatItem(Item);
							return;
						}
					}
					// 合并物品
					if (PickItem && item)
					{
						/*if (strcmp(PickItem->m_DispName, Item->m_DispName) == 0 &&
							(Item->m_Kind == ITEM_OBJ || Item->m_Kind == ITEM_TASK) &&
							Item->m_Bind != PickItem->m_Bind &&
							Item->m_Num + PickItem->m_Num <= 100)
						{
							strcpy(m_ItemName, PickItem->m_Name);
							strcpy(m_Password, Item->m_Name);
							GpGame->ShowMessage("是否将已绑定和未绑定的物品合并？<BR><CL=255,0,0>合并后将全部绑定</CL>。", OnEquipMergeItem);
							return;
						}*/
					}
					// 拆分 拿起 放下物品
					//if (page->m_PageIdx == 1)
						OperateItem(X, Y, ItemList.WHERE_CARRY);
					//else if (page->m_PageIdx == 2 && (GpSpc->m_CarryAppe >= 1 || !PickItem))
					//	OperateItem(X, Y, WHERE_CARRY2);
					//else if (page->m_PageIdx == 3 && (GpSpc->m_CarryAppe >= 2 || !PickItem))
					//	OperateItem(X, Y, WHERE_CARRY3);
					//else if (page->m_PageIdx == 4 && (GpSpc->m_CarryAppe >= 3 || !PickItem))
					//	OperateItem(X, Y, WHERE_CARRY4);
					//else
					//	GpMessageTip->ShowTip("扩展背包需要使用扩容宝石激活才能使用。");
					return;
				}
			}

		}
		private function OperateItem(X:int, Y:int, Where:int):Boolean
		{
			var PickItem:Item = GameDemo.player.itemList.FindItem(GameDemo.pickItemName);
			GameDemo.player.itemList.SwapItemForXY(PickItem, X, Y, Where);
			m_FreePick = false;
			GameDemo.pickItemName = null;
			return true;
		}
		//---------------------------------------------------------------------------
		public function GetPickItem():Item
		{
			return GameDemo.player.itemList.FindItem(GameDemo.pickItemName);
		}
		//---------------------------------------------------------------------------
		public function SetPickItem(item:Item):void
		{
			if (item)
				GameDemo.pickItemName = item.name;
			else
				GameDemo.pickItemName = null;
		}		
		//---------------------------------------------------------------------------
		// 扔下拿起的物品
		public function DropPickItem():void
		{
			var PickItem:Item = GetPickItem();
			if (PickItem)
			{
				if (m_FreePick)
				{
					GameDemo.uiMain.DrawList[PickItem.m_Quick - 1].bitmapData = null;
					
					PickItem.m_Quick = 0;
					PickItem.m_PickUp = 0;
					PickItem.SendQuickItem(0);
					GameDemo.pickItemName = null;
					return;
				}
				//if (m_Locked)
				//{
				//	GpMessageTip->ShowTip("物品装备已经加锁，无法丢弃。", NULL);
				//	return;
				//}
				//strcpy(m_ItemName, PickItem->m_Name);
				//GpGame->ShowMessage("确定要丢弃这件物品吗？", OnEquipThrowItem);
			}
		}	
		//---------------------------------------------------------------------------
		public function UseItem(item:Item):void
		{
			// 最少间隔1秒
			/*static KmTimer Timer;
			if (!Timer.Passed(1000))
				return;
			// 开宝箱时不能使用物品
			if (GpBox->m_Visible)
				return;
			// 死亡后不能使用
			if (GpSpc->m_State == NPC_DIE)
			{
				GpMessageTip->ShowTip("死亡以后不能使用物品", NULL);
				return;
			}
			// 门派需求
			if (Item->m_Party[0] && strcmp(GpSpc->m_Party, Item->m_Party))
			{
				GpMessageTip->ShowTip("物品门派需求不对无法使用。", NULL);
				return;
			}
			// 性别需求
			if (Item->m_Sex && Item->m_Sex != GpSpc->m_Sex + 1)
			{
				GpMessageTip->ShowTip("物品性别需求不对无法使用。", NULL);
				return;
			}
			// 等级需求
			if (Item->m_Level > GpSpc->m_Level)
			{
				GpMessageTip->ShowTip("物品等级需求不对无法使用。", NULL);
				return;
			}
			// 开始使用物品
			if (Item->m_LuaFile[0])
			{
				// 播放使用物品音效
				Item->PlayDropSound();
				// 使用准备时间延迟
				GpStatus->ShowProgress(Item->m_DispName, Item->m_UseTime>0?Item->m_UseTime:1);
				// 发送使用消息
				GpSpc->SendUseItem(Item);
			}*/
		}		
	}
}