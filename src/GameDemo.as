package
{
	import com.bit101.components.FPSMeter;
	import com.bit101.components.Label;
	import com.core.TabFile;
	import com.socket.SocketClient;
	import com.socket.msg.*;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.filters.GlowFilter;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.ui.ContextMenu;
	import flash.utils.Timer;
	
	import lib.Item;
	import lib.ItemList;
	import lib.MagicList;
	import lib.Npc;
	import lib.NpcList;
	import lib.Obj;
	import lib.OtherPlayer;
	import lib.Player;
	import lib.PlayerList;
	import lib.Skill;
	
	import lua.LuaCore;
	
	import ui.*;
	
	[SWF(frameRate="30",backgroundColor="#000000")]		
	public class GameDemo extends Sprite
	{
		public static var uiGameStart:UiGameStart = new UiGameStart();
		public static var uiCharSelect:UiCharSelect = new UiCharSelect();
		public static var uiCharCreate:UiCharCreate = new UiCharCreate();
		public static var uiCreatAcc:UiCreateAccount = new UiCreateAccount();
		public static var uiMain:UiMain = new UiMain();		
		public static var uiMenu:UiMenu = new UiMenu();	
		public static var uiDialog:UiDialog = new UiDialog();
		public static var uiSmallMap:UiSmallMap = new UiSmallMap();
		public static var uiPack:UiPack = new UiPack();
		public static var uiSkill:UiSkill = new UiSkill();
		public static var uiTaskLog:UiTaskLog =  new UiTaskLog();
		public static var uiChatLog:UiChatLog = new UiChatLog();
		
		public static var gameLayer:int = 0;
		public static var log:Label;		
		public static var testGame:Boolean = false;
		public static var canDraw:Boolean = true;
		private var m_UseSkill:int;//当前使用技能
		
		public static var playerName:String;
		public static var playerAccount:String;
		public static var playerLine:int = 0;
		public static var playerIdentity:String = "";
		public static var fileVersion:String = "";
		/**点选的物品名*/
		public static var pickItemName:String = null;
		/**点选的技能名*/
		public static var pickSkillName:String = null;
		
		/**物件层*/
		public static var DrawList:Sprite = new Sprite;	
		/**Ui层*/
		public static var UiList:Sprite = new Sprite;		
		// 角色
		public static var player:Player = new Player();
		public static var npcList:NpcList = new NpcList();
		public static var playerList:PlayerList = new PlayerList();
		public static var magicList:MagicList = new MagicList();
		
		public static var pickItem:Bitmap = new Bitmap();		
		
		public static var npcData:TabFile = new TabFile();
		public static var mapData:TabFile = new TabFile();
		public static var itemData:TabFile = new TabFile();
		public static var skillData:TabFile = new TabFile();
		public static var effectData:TabFile = new TabFile();
		
		
		private static var gamemap:Map = new Map();
		private var gameimg:ImgFile = new ImgFile();		
		private var backdraw:MainDraw = new MainDraw();			
		private var client:SocketClient = new SocketClient();
		private var timer:Timer = new Timer(30);	
		private var loadurl:URLLoader = new URLLoader();	
		private var SelObj:String = "";
		public static var timerNum:int = 0;

		private var fps:FPSMeter;
		
		private static var luaFile:LuaCore;
		
		//private var _moustX:int;
		//private var _mouseY:int;

		private var myMenu:ContextMenu = new ContextMenu();
	
		public function GameDemo()
		{
			stage.scaleMode="noScale"; 
			stage.align ="TL";
			
			trace("游戏开始..")
		
			// 地图层
			addChild(backdraw);			
		
			//角色层
			addChild(DrawList);
			DrawList.addChild(player);

			//SortObj();
			//Ui层
			addChild(UiList);			
			UiList.addChild(uiGameStart);
			UiList.addChild(uiCharSelect);
			UiList.addChild(uiCharCreate);
			UiList.addChild(uiCreatAcc);
			UiList.addChild(uiChatLog);
			UiList.addChild(uiDialog);
			UiList.addChild(uiMain);
			UiList.addChild(uiMenu);	
			UiList.addChild(uiSmallMap);
			UiList.addChild(uiPack);
			UiList.addChild(uiSkill);
			UiList.addChild(uiTaskLog);
			
			uiGameStart.Show();
			//TestGame();
			addChild(pickItem);

			// 消息层
			addChild(client);			
			
			log = new Label(this,10,60,"测试");
			fps = new FPSMeter(this,10,80);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, OnKeyDown);	
			stage.addEventListener(KeyboardEvent.KEY_UP, OnKeyUp);	
			
			stage.addEventListener(Event.RESIZE,stageResize); //当图片加载完后添加侦听
						
			addEventListener(Event.ADDED_TO_STAGE, init);			
			addEventListener(Event.ENTER_FRAME, DrawBuff);
			addEventListener(Event.CLOSE, OnClose);			

			timer.addEventListener(TimerEvent.TIMER, OnTimer);
			timer.start();			
			loadurl.load(new URLRequest("Config.xml"));
			loadurl.addEventListener(Event.COMPLETE,Loadxml);
			
			npcData.Load("asset/data/NpcList.ini");
			mapData.Load("asset/data/MapList.ini");
			itemData.Load("asset/data/ItemList.ini");
			skillData.Load("asset/data/SkillList.ini");
			effectData.Load("asset/data/Effect.ini");
			
			try
			{
				ExternalInterface.addCallback("callFlash", SendLogout);
			}
			catch (e:Error)
			{
				trace (e); // ArgumentError: Error #2024: An object may not be added as a child of itself.
			}

			
		}
	
		private function init(event:Event):void
		{
	
			// 此处不执行,窗口坐标有可能不能正确设置
			stageResize(null);
			myMenu.hideBuiltInItems();
			this.contextMenu = myMenu;		
			
			player.Init();
			InitUi();
			
			pickItem.visible = false;
			
			luaFile = new LuaCore();			

		}	
		private function OnClose(e:Event):void
		{
			trace("end..");
		}
		private function Loadxml(event:Event):void
		{
			
			var xml:XML=XML(loadurl.data);
			fileVersion = xml.Version;
			
			client.Connect(xml.Ip, xml.Port);					
		}		
		
		protected function stageResize(event:Event):void
		{
			
			MainDraw.CanvasWidth = stage.stageWidth;
			MainDraw.CanvasHeight = stage.stageHeight;		
			ResizeUi();
		}
		// 时间控制
		private function OnTimer(e:Event):void
		{
			timerNum+=30;
			
			player.itemList.OnTimer();
			player.skillList.OnTimer();
		}
		private function onUpdata():void
		{
			npcList.OnTimer();		
			magicList.OnTimer();
			playerList.OnTimer();
			player.OnTimer();
			
			gamemap.MoveTo(player.sx - MainDraw.CanvasWidth / 2, 
				player.sy - MainDraw.CanvasHeight / 2);
			uiSmallMap.Draw();
			npcList.UpdateName();	
			playerList.UpdateName();	
			player.UpdateName();				
			
			if (pickItemName == null && pickSkillName == null)
				pickItem.visible = false;
		}
		private function DrawPickItem(X:int, Y:int):void
		{
			if (pickItemName == null)
				return;
			
			var item:Item = GameDemo.player.itemList.FindItem(pickItemName);
			if (item)
			{
				pickItem.visible = true;
				item.DrawItemPos(X, Y, pickItem);
			}
		}
		private function DrawPickSkill(X:int, Y:int):void
		{
			if (pickSkillName == null)
				return;
			
			var skill:Skill = GameDemo.player.skillList.FindSkill(pickSkillName);
			if (skill)
			{
				pickItem.visible = true;
				skill.DrawSkillPos(X, Y, pickItem);
			}
		}		
		private function DrawBuff(event:Event):void
		{
			if (gameLayer == 1 && canDraw == true)
			{
				onUpdata();
				
				gamemap.Draw();
				npcList.Draw();
				magicList.Draw();
				playerList.Draw();
				player.Draw();
				
				DrawPickItem(mouseX, mouseY);
				DrawPickSkill(mouseX, mouseY);
			}

		}
		private function OnMouseDown(event:MouseEvent):void
		{
			if (event.buttonDown)
			{
				var X:Number = event.localX + Map.MapX;
				var Y:Number = event.localY + Map.MapY;
				if (gameLayer == 1)
				{
					if (uiPack.GetPickItem())
					{
						uiPack.DropPickItem();
						return;
					}
					// 放下收购物品
					//if (GpSaleItem->GetPickBuyItem())
					//{
					//	GpGame->ShowMessage("确定取消收购此物品？", OnSaleItemDeleteBuyItemOk);
					//	return;
					//}
					// 放下技能
					if (uiSkill.GetPickSkill())
					{
						uiSkill.DropPickSkill();
						return;
					}
					if (SelObj.length > 0)
					{
						var npc:Npc = GameDemo.npcList.getResource(SelObj) as Npc;
						if (npc)
						{
							player.npcName = npc.name;
							if (testGame)
								player.DoRun(npc.sx, npc.sy);
							else
								player.SendSpcRun(npc.sx, npc.sy);	
								
						}

					}
					else
					{
						player.npcName = "";
						if (testGame)						
							player.DoRun(X, Y);
						else
							player.SendSpcRun(X, Y);
							
					}
					// 强制攻击测试
					if (event.ctrlKey)
					{
						player.DoAttack(X, Y);
					}
				}
			}
		}		
		private function OnMouseMove(event:MouseEvent):void
		{
			if (gameLayer == 1)
			{
				var X:Number = event.localX + Map.MapX;
				var Y:Number = event.localY + Map.MapY;		
				var npc:Npc;
				
				//_moustX = event.localX;
				//_moustY = event.localY;
					
				// 取消 NPC 选择
				if (SelObj.length > 0)
				{
					npc = GameDemo.npcList.getResource(SelObj) as Npc;	
					if (npc)
					{
						npc.filters = null;
					}
					SelObj = "";
				}
				var filter:GlowFilter;
				//选择 NPC
				npc = npcList.GetObj(X, Y);
				if (npc)
				{
					SelObj = npc.name;
					filter = new GlowFilter(0xff0000);							
					npc.filters = [filter];
				}
				// 选择主角
				//player.filters = null;
				//if (player.PetInImg(X, Y))
				//{
				//	filter = new GlowFilter(0x0000ff);							
				//	player.filters = [filter];					
				//}
				// 记录鼠标位置
			}			
		}
		private function OnKeyDown(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				//case "0":
				case "1".charCodeAt(0):
				case "2".charCodeAt(0):
				case "3".charCodeAt(0):
				case "4".charCodeAt(0):
				case "5".charCodeAt(0):
				case "6".charCodeAt(0):
				case "7".charCodeAt(0):
				case "8".charCodeAt(0):
				case "9".charCodeAt(0):
					if (e.altKey)
						uiChatLog.SelectChannel(e.keyCode - "1".charCodeAt(0));
					else
						UseQuick(e.keyCode - "1".charCodeAt(0));
					break;
				case 65:
					for (var i:int = 0; i < DrawList.numChildren; i++)
						DrawList.removeChildAt(0);
					break;
			}
		}
		private function OnKeyUp(e:KeyboardEvent):void
		{
			
		}		
		private function InitUi():void
		{
			for (var i:int = 0; i< UiList.numChildren; i++)
			{		
				var pObj:UiNode = UiList.getChildAt(i) as UiNode;
				if (pObj)
				{
					pObj.Init();
				}
			}	
		}		
		private function ResizeUi():void
		{
			for (var i:int = 0; i< UiList.numChildren; i++)
			{		
				var pObj:UiNode = UiList.getChildAt(i) as UiNode;
				if (pObj)
				{
					pObj.Resize();
				}
			}	
		}
		public static function HideUi():void
		{
			for (var i:int = 0; i< UiList.numChildren; i++)
			{		
				var pObj:UiNode = UiList.getChildAt(i) as UiNode;
				if (pObj)
				{
					pObj.Hide(null);
				}
			}	
		}		
		public static function RecvSpcLeaveMap(msg:NetSpcLeaveMap):void
		{
			var op:OtherPlayer = playerList.getResource(msg.Name) as OtherPlayer;
			if (op)
			{
				//DeleteSpcObj(op);
				//op->Delete();		
				op.Free();
				playerList.removeResource(msg.Name);
			}			
		}
		public static function LeaveMap():void
		{
			canDraw = false;
		}
		public static function LoadMap(map:String):void
		{
			npcList.Free();
			playerList.Free();
			
			var mapFile:String = mapData.GetValueForName(map, "地图") as String;
			
			gamemap.Load(mapFile);			
			uiSmallMap.Load(mapFile);	
			
			for (var i:int = 0; i < DrawList.numChildren; i++)
				DrawList.removeChildAt(0);
			DrawList.addChild(player);		
			canDraw = true;
		}
		public static function EnterGame():void
		{
			HideUi();
			gameLayer = 1;	
			uiMain.visible = true;
			uiMenu.visible = true;	
			uiSmallMap.visible = true;
			uiChatLog.visible = true;
			
			uiTaskLog.Update();			

		}
		public static function TestGame():void
		{
			LoadMap("城镇001");
			HideUi();
			gameLayer = 1;	
			uiMain.visible = true;
			uiMenu.visible = true;					
			uiSmallMap.visible = true;
			uiChatLog.visible = true;
			
			testGame = true;		
			
			for (var i:int = 1; i< 100; i++)			
				npcList.AddObj("雪貂",DrawList);	
			
			var npc:Npc = new Npc();
			npc.LoadImg("asset/npc/站立.png");
			npc.sx = 786;
			npc.sy = 811;
			npc.dir = 7;
			npc.type = npc.TYPE_NPC1;
			npc.Load("小虎");
			//npc.talkFile = "asset\data\对话\城镇\小虎.lua";
			//npc.SetName("我是NPC");
			npcList.AddNpc(npc, DrawList);			
			
			player.DoStand();
			player.sx = 739;
			player.sy = 550;
		}		
		public static function RecvPlayerMain(msg:NetPlayerMain):void
		{
			player.RecvMsgMain(msg);
		}
		
		public static function RecvPlayerData(msg:NetPlayerData):void
		{
			player.RecvMsgData(msg);
		}
		public static function RecvPlayerItem(msg:NetPlayerItem):void
		{
			player.itemList.AddItem(msg);
			// 检查任务
			//if (m_EnterGame)
			//{
			//	GpTaskTrack->Update();
			//	GpTaskLog->UpdateIntro();
			//}			
		}
		public static function RecvPlayerSkill(msg:NetPlayerSkill):void
		{
			player.skillList.AddSkill(msg);
		}
		public static function RecvMapNpc(msg:NetMapNpc):void
		{
			var npc:Npc = npcList.getResource(msg.Name) as Npc;
			if (npc)
			{
				npc.RecvMapNpc(msg);
				//npc->SetAlpha(0);
			}
			else
			{
				npc = new Npc();
				npc.Load(msg.DispName);
				npc.RecvMapNpc(msg);
				npcList.AddNpc(npc, DrawList);
			}
			
		}
		public static function RecvNpcRun(msg:NetNpcRun):void
		{
			var npc:Npc = npcList.getResource(msg.Name) as Npc;
			if (npc)
			{
				npc.speed = msg.Speed;
				npc.DoRun(msg.X, msg.Y);				
			}			
			else
			{
				//GpSpc->SendRunTask("更新怪物", p->Name);
			}
		}
		public static function RecvNpcDie(msg:NetNpcDie):void
		{
			var npc:Npc = npcList.getResource(msg.Name) as Npc;
			if (npc)
			{
				//if (npc.m_life)
				//	npc.AddHurtEffect("伤害0", npc.m_Life);
				//Npc->m_Life = 0;
				npc.SetLife(0);
				//if (npc.m_Body == 0)
				//	npc.SetAlpha(2);
				npc.DoDie();
				//DeleteSpcObj(Npc);
			}			
			else
			{
				//GpSpc->SendRunTask("更新怪物", p->Name);
			}
		}		
		public static function RecvMapMpc(msg:NetMapMpc):void
		{
			var op:OtherPlayer = playerList.getResource(msg.Name) as OtherPlayer;
			if (op)
			{
				op.RecvMapMpc(msg);
			}
			else
			{
				op = new OtherPlayer();
				op.RecvMapMpc(msg);
				playerList.AddPlayer(op, DrawList);
			}
		}		
		public static function RecvSpcPos(msg:NetSpcPos):void
		{
			if (msg.Name == player.name)
			{
				player.SetPos(msg.X, msg.Y);
				player.DoStand();
			}
			else
			{
				var op:OtherPlayer = playerList.getResource(msg.Name) as OtherPlayer;
				if (op)
				{
					op.SetPos(msg.X, msg.Y);
					op.DoStand();
				}
			}			
		}
		public static function RecvSpcRun(msg:NetSpcRun):void
		{
			if (msg.Name == player.name)
			{
				player.speed = msg.Speed;
				player.DoRun(msg.DesX, msg.DesY);
			}
			else
			{
				var op:OtherPlayer = playerList.getResource(msg.Name) as OtherPlayer;
				if (op)
				{
					op.speed = msg.Speed;
					op.DoRun(msg.DesX, msg.DesY);
				}
			}			
		}		
		public static function RecvEnterMap(msg:NetSpcEnterMap):void
		{
			if (player.mapName != msg.MapName)
			{
				player.mapName = msg.MapName;
				LoadMap(msg.MapName);
			}
			else
			{
				//m_Map.m_NpcList.Free();
				//m_Map.m_MpcList.Free();
				//m_Map.m_ItemList.Free();
				//m_Map.m_MagicList.Free();
				//m_Map.m_MapObst.ClearNpcObst();
			}
			//GpSpc->LeaveMap();
			// 防止在切换地图的情况下出错
			player.sx = msg.X;
			player.sy = msg.Y;
			player.dir = msg.Dir;
			//m_MapX = GpSpc->m_X;
			//m_MapY = GpSpc->m_Y;
			
			// 测试是否还在进行跨地图寻路
			//if (strcmp(GpSpc->m_NpcTarget, "") != 0)
			//{
			//	GotoNpc(GpSpc->m_NpcTarget, false);
			//}
			
		}
		public static function RecvPlayerTask(msg:NetPlayerTask):void
		{
			uiTaskLog.taskLog.SetValue("Task", msg.Task, msg.Value);
			if (gameLayer == 1)
			{
				//GpTaskTrack->Update();

				uiTaskLog.Update();
			}
			
		}
		public static function RecvPickItem(msg:NetPickItem):void
		{
			var item:Item = player.itemList.getResource(msg.Name) as Item;
			if (item)
			{
				item.m_PickUp = 1;
				pickItemName = item.name;
			}
			
		}		
		public static function RecvDropItem(msg:NetDropItem):void
		{
			var item:Item = player.itemList.getResource(msg.Name) as Item;
			if (item)			
			{
				item.m_PickUp = 0;
				item.m_Where = msg.Where;
				item.m_Index = msg.Index;
				item.x = ItemList.G_ItemRect[msg.Where][msg.Index].left;
				item.y = ItemList.G_ItemRect[msg.Where][msg.Index].top;
				//item.m_Width = G_ItemRect[p->Where][p->Index].right -
				//	G_ItemRect[p->Where][p->Index].left;
				//item.m_Height = G_ItemRect[p->Where][p->Index].bottom -
				//	G_ItemRect[p->Where][p->Index].top;
			}
			
		}		
		public static function RecvDelItem(msg:NetDelItem):void
		{
			var item:Item = player.itemList.getResource(msg.Name) as Item;
			if (item)
			{
				player.itemList.removeResource(item.name);
			}			
		}	
		/**角色装备信息*/
		public static function RecvSpcEquip(msg:NetSpcEquip):void
		{
			if (msg.Name == player.name)
			{
				player.RecvSpcEquip(msg);
			}
			else
			{
				var op:OtherPlayer = playerList.getResource(msg.Name) as OtherPlayer;
				if (op)
				{
					op.RecvSpcEquip(msg);
				}
			}			
			
		}
		public static function RecvSpcMagic(msg:NetSpcMagic):void
		{
			if (msg.Name == player.name)
			{
				//不再隐身
				//if (GpSpc->m_EffectTime[SE_HIDE] > 0)
				//	GpSpc->m_EffectTime[SE_HIDE] = 2;
				player.m_MagicName = msg.MagicName;
				player.m_MagicLevel = msg.MagicLevel;
				//GpStatus->ShowProgress(p->MagicName, 1);
				var skill:Skill = player.skillList.FindSkill(msg.MagicName);
				if (skill)
				{
					skill.m_Timer = skill.interval;
					skill.m_CoolSpeed = skill.m_Timer * 30;
					player.DoMagic(msg.DesX, msg.DesY, skill.m_Action);
				}
				return;
			}
			var op:OtherPlayer = playerList.getResource(msg.Name) as OtherPlayer;
			if (op)
			{
				// 不再隐身
				//if (Mpc->m_EffectTime[SE_HIDE] > 0)
				//	Mpc->m_EffectTime[SE_HIDE] = 2;
				op.m_MagicName = msg.MagicName;
				op.m_MagicLevel = msg.MagicLevel;
				//int Action = GpSpc->m_SkillFile.GetInt(p->MagicName, "施法动作", 1);
				op.SetPos(msg.SrcX, msg.SrcY);
				op.DoMagic(msg.DesX, msg.DesY, 0);//Action);
			}
			else
			{
				//GpSpc->SendRunTask("更新玩家", p->Name);
			}
		}		
		//---------------------------------------------------------------------------
		private function UseQuick(i:int):void
		{
			//KmUiImage *currSkill = (KmUiImage*)GpStatus->FindChild("选中技能");
			if (i > 15)
				return;
			//currSkill->m_X = GpStatus->m_Rect[i].left;
			//currSkill->m_Y = GpStatus->m_Rect[i].top - 1;
			//i += GpStatus->GetPage(0) * 10;
			var skill:Skill = player.skillList.GetQuickSkill(i + 1);
			
			if (skill)
			{
				m_UseSkill = i + 1;
				UseQuickSkill(skill);
			}
			else
			{
				var item:Item = player.itemList.GetQuickItem(i + 1);
				if (item)
					uiPack.UseItem(item);
			}
		}
		//---------------------------------------------------------------------------
		private function UseQuickSkill(skill:Skill):Boolean
		{
			// 生活动作
			//if (GpSpc->StopLiveAction())
			//	return FALSE;
			// 正在摆摊
			//if (GpSpc->m_OnSale)
			//	return FALSE;
			// 跳跃死亡时不能使用技能
			//if (GpSpc->m_State == NPC_JUMP || GpSpc->m_State == NPC_DIE)
			//	return FALSE;
			// 选择对象
			//if (m_SelObjName[0])
			//	GmStrCopy(GpSpc->m_NpcName, m_SelObjName);
			// 自动施法
			//if (player.m_NpcName)
			//{
			//	KmNpc* Npc = GpMap->GetNpc(GpSpc->m_NpcName);
			//	if (Npc)
			//	{
			///		return SpcUseSkill(Skill, Npc->m_X, Npc->m_Y);
			//	}
			//}
			player.m_DestX = this.mouseX + Map.MapX;
			player.m_DestY = this.mouseY + Map.MapY;
			return SpcUseSkill(skill, player.m_DestX, player.m_DestY);
		}	
		//---------------------------------------------------------------------------
		private function SpcUseSkill(skill:Skill, X:int, Y:int):Boolean
		{
			if (skill == null)
				return false;
			// 没有学习
			if (skill.m_Active == 0)
				return false;
			// 没有等级
			if (skill.m_Level <= 0)
				return false;
			// 正在施法或跳跃
			//if (GpSpc.m_State == NPC_MAGIC || GpSpc.m_State == NPC_JUMP)
			//	return false;
			// 坐骑状态
			//if (GpSpc->m_Mount > 0)
			//{
			//	GpSystemLog->AddLog("坐骑上不能使用技能");
			//	return FALSE;
			//}
			// 被眩晕
			//if (GpSpc->m_EffectTime[SE_FAINT])
			//{
			//	GpSystemLog->AddLog("眩晕状态下不能使用技能");
			//	return FALSE;
			//}
			// 被封魔
			//if (GpSpc->m_EffectTime[SE_FM])
			//{
			//	GpSystemLog->AddLog("封魔状态下不能使用技能");
			//	return FALSE;
			//}
			// 法力不够
			//if (GpSpc->m_Mana < Skill->m_ManaCost)
			//{
			//	GpSystemLog->AddLog("<CL=255,255,0>法力不足</CL>，无法使用技能");
			////	return FALSE;
			//}
			// 施法间隔不够
			if (skill.m_Timer > 0 || skill.m_CoolSpeed > 0)
			{
				//GpSystemLog->AddLog("技能冷却时间还没结束");
				return false;
			}
			// 位置阻挡
			//if ((skill.m_Kind == SKILL_ATTACK) && GpSpc->ObstInLine(X, Y, MAP_OBST))
			//{
			//	GpSystemLog->AddLog("攻击目标被障碍阻挡");
			//	return FALSE;
			//}
			// 有目标的攻击法术
			//if (Skill->m_ObjKind == OBJ_KIND_SINGLE && GpSpc->m_NpcName[0] == 0)
			//{
			////	GpSystemLog->AddLog("技能需要施法目标");
			//	return FALSE;
			//}
			// 复活类技能
			//if (GpSpc->m_NpcName[0] && Skill->m_EffectKind == SE_REVIVE)
			//{
			//	KmNpc* Npc = GpMap->GetNpc(GpSpc->m_NpcName);
			//	if (Npc && Npc->m_State != NPC_DIE)
			//	{
			//		GpSystemLog->AddLog("目标不需要复活");
			//		return FALSE;
			//	}
			//}
			// 技能施法距离
			if (!skill.CheckDist(X, Y))
			{
				//GpSystemLog->AddLog("距离太远，无法使用技能");
				return false;
			}
			// 技能等级
			player.m_MagicLevel = skill.m_Level;
			// 发出技能
			var npc:Npc = npcList.getResource(player.npcName) as Npc;
			
			player.SendSpcMagic(npc, skill.name, X, Y);
			return true;
		}		
		public static function TalkToNPC(file:String):void
		{
			if (file != "")
				LoadLua(file);
		}
		public static function LoadLua(file:String):void
		{
			luaFile.loadLua(file);	
		}
		/** 对物件排序 */
		private function SortObj():void
		{
			var find:Boolean = false;
			if (DrawList.numChildren < 2)
				return;
			for (var i:int = 1; i< DrawList.numChildren; i++)
			{
				var pObj:Obj = DrawList.getChildAt(i) as Obj;
				find = false;
				for (var j:int = 0; j< DrawList.numChildren; j++)
				{
					var nObj:Obj = DrawList.getChildAt(j) as Obj;		
					if (pObj.sy < nObj.sy)
					{
						DrawList.setChildIndex(pObj, j);
						find = true;
						break;
					}
				}
				if (!find)
					DrawList.setChildIndex(pObj, DrawList.numChildren - 1);

			}
		}
		public function SendLogout():void
		{
			
			var msg:NewGameLogout = new NewGameLogout();
			msg.SendMsg();
			trace("游戏退出");
		}		
	}
	
}