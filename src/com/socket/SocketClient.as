
package com.socket
{
	import com.bit101.components.Label;
	import com.bit101.components.Window;
	import com.socket.msg.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.ui.Keyboard;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import ui.UiGameStart;
	
	public class SocketClient extends Sprite
	{
		
		public  static var socket:Socket = null;
		//private var role:Class;
		//private var msgLenMax    :int;            //收到的消息最大长度
		//private var msgLen        :int;            //消息长度
		private var headLen        :int;           //消息头长度
		//private var isReadHead    :Boolean;        //是否已经读了消息头
		//private var bytes        :ByteArray;       //所读数据的缓冲数据，读出的数据放在这里
		
		//private var userName		:String;
		//private var speed			:int;
		
		private var showMessage:Window;
		private var message:Label;
		private var enterGame:Boolean = false;
		private var waitMsg:Boolean = false;
		
		private var msgType:int = 0;//当前处理消息类型 
		private var msgLen:int = 0;// 当前处理消息长度
		
		public function SocketClient()
		{
			//userMap = new Object();
			socket = new Socket();
			socket.endian = Endian.LITTLE_ENDIAN;			
			//监听socket事件
			socket.addEventListener(Event.CONNECT,onConnected);
			socket.addEventListener(Event.CLOSE,onClosed);
			socket.addEventListener(IOErrorEvent.IO_ERROR,ioError);
			socket.addEventListener(ProgressEvent.SOCKET_DATA,onData);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityError);
			
			
			
			//isReadHead = true;
			headLen = 1;        //2个字节
			//msgLenMax = 4028;
			//speed = 5;
			//bytes = new ByteArray();

			
			addEventListener(Event.ADDED_TO_STAGE,addStageEvent);
		}
		public function Connect(ip:String, port:int):void
		{
			try
			{
				if (socket.connected)
					socket.close();
				socket.connect(ip, port);
				GameDemo.log.text = ip+","+port;
				trace(GameDemo.log.text);
				
			}
			catch(e:Error)
			{
				GameDemo.log.text = "连接错误";
				//GameDemo.gameStart.Hide(null);	
			}			
		}
		private function addStageEvent(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,addStageEvent);
			//stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownEvent);
			
			showMessage = new Window(this, 600,200,"错误");
			showMessage.setSize(200,100);
			showMessage.visible = false;
			showMessage.hasCloseButton = true;
			showMessage.addEventListener(Event.CLOSE, onMessageClose);
			
			message = new Label(showMessage,0,0,"");
			
		}
		private function onMessageClose(e:Event):void
		{
			showMessage.visible = false;
		}
		private function keyDownEvent(event:KeyboardEvent):void
		{

		}
		private function onConnected(evt:Event):void
		{
			trace("连接服务器成功");
			GameDemo.log.text = "连接服务器成功";
			if (enterGame)
			{
				SendGameLogin();
			}
		} 
		private function ioError(event:IOErrorEvent):void
		{
			trace("连接socket服务器错误");
			//GameDemo.gameStart.Hide(null);
			//GameDemo.gameLayer = 1;			
		}
		private function onClosed(evt:Event):void
		{
			trace("关闭连接");
		}
		private function securityError(event:SecurityErrorEvent):void
		{
			//GameDemo.log.text = event.text;	
			trace(event.text)
			//GameDemo.gameStart.Hide(null);			
			//GameDemo.gameLayer = 1;
		}
		
		private function onData(evt:ProgressEvent):void
		{
			//一有收到数据的事件，就通过这个函数进行检验
			parseNetData();
		}
		/**
		 * 解析网络数据流
		 */
		private function parseNetData():void
		{
			var head:String;
			if (waitMsg)
			{
				if (socket.bytesAvailable >= msgLen)
				{
					// 处理消息
					RecvMsg(msgType);				
					waitMsg = false;
					trace("处理中断消息:",msgType, msgLen);
					//return;
				}
			}
			if(socket.bytesAvailable < headLen)
				return;			
			// 寻找封包头
			head = String.fromCharCode(socket.readByte());
			
			while (head != "~" && socket.bytesAvailable > 0)
			{
				head = String.fromCharCode(socket.readByte());
			}

			//trace(head);
			if (head == "~")
			{
				var buf:ByteArray = new ByteArray();
				buf.endian = Endian.LITTLE_ENDIAN;
				// 校验标记
				var code:uint = socket.readUnsignedInt();
				// 消息类型
				msgType = socket.readUnsignedByte();
				// 消息长度
				msgLen = socket.readShort();
				// 消息不全继续等待
				if (socket.bytesAvailable < msgLen)
				{
					waitMsg = true;
					return;
				}
				
				// 处理消息
				RecvMsg(msgType);
				
			}
			if(socket.bytesAvailable >= headLen)
			{
				parseNetData();
			}			
			//如果需要读信息头
/*			if(isReadHead)
			{
				if(socket.bytesAvailable >= headLen)
				{
					//读出指示后面的数据有多大
					msgLen = socket.readShort();
					isReadHead = false;
				}
			}
			//如果已经读了信息头,则看能不能收到满足条件的字节数
			if(!isReadHead && msgLen <= msgLenMax)
			{
				//如果为0,表示收到异常消息
				if(msgLen == 0)
				{
					//一般消息长度为0的话，表示与服务器出了错，或者即将被断开等，通知客户端，进行特别处理
					
					return ;
				}
				//数据流里的数据满足条件，开始读数据
				if(socket.bytesAvailable >= msgLen)
				{
					//指针回归
					bytes.position = 0;
					//取出指定长度的网络字节
					socket.readBytes(bytes, 0, msgLen);
					parseProtocol();
					isReadHead = true;
				}
			}
			//如果数据流里还满足读取数据条件，继续读取数据
			if(socket.bytesAvailable >= headLen)
			{
				parseNetData();
			}*/
		}
		
		private function RecvMsg(msgType:int):void
		{
			switch(msgType)
			{
				case MsgDef.NM_REG_OK:
					RecvRegOk();
					break;
				case MsgDef.NM_REG_FAIL:
					RecvRegFail();
					break;
				case MsgDef.NM_CHAT:
					RecvChat();
					break;
				case MsgDef.NM_LOGIN_FAIL:
					RecvLoginFail();
					break;
				case MsgDef.NM_LOGIN_OK:
					RecvLoginOK();
					break;
				case MsgDef.NM_PLAYER_INFO:
					RecvPlayerInfo();
					break;				
				case MsgDef.NM_LINE_INFO:
					RecvLineInfo();
					break;
				case MsgDef.NM_PLAYER_GET_FAIL:
					RecvPlayerGetFail();
					break;
				case MsgDef.NM_PLAYER_GET_OK:
					RecvPlayerGetOK();
					break;
				case MsgDef.NM_PLAYER_NEW_OK:
					RecvPlayerNewOk();
					break;
				case MsgDef.NM_PLAYER_MAIN:
					RecvPlayerMain();
					break;
				case MsgDef.NM_PLAYER_DATA:
					RecvPlayerData();
					break;
				case MsgDef.NM_PLAYER_ITEM:
					RecvPlayerItem();
					break;
				case MsgDef.NM_PLAYER_SKILL:
					RecvPlayerSkill();
					break;
				case MsgDef.NM_MAP_NPC:
					RecvMapNpc();
					break;
				case MsgDef.NM_NPC_RUN:
					RecvNpcRun();
					break;
				case MsgDef.NM_NPC_DIE:
					RecvNpcDie();
					break;
				case MsgDef.NM_MAP_MPC:
					RecvMapMpc();
					break;
				case MsgDef.NM_SPC_POS:
					RecvSpcPos();
					break;
				case MsgDef.NM_SPC_RUN:
					RecvSpcRun();
					break;
				case MsgDef.NM_SPC_MAGIC:
					RecvSpcMagic();
					break;
				case MsgDef.NM_SPC_ENTER_MAP:
					RecvEnterMap();
					break;
				case MsgDef.NM_SPC_LEAVE_MAP:
					RecvLeaveMap();
					break;
				case MsgDef.NM_SPC_EQUIP:
					RecvSpcEquip();
					break;
				case MsgDef.NM_PLAYER_TASK:
					RecvPlayerTask();
					break;
				case MsgDef.NM_COMMAND:
					RecvCommand();
					break;
				case MsgDef.NM_PICK_ITEM:
					RecvPickItem();
					break;
				case MsgDef.NM_DROP_ITEM:
					RecvDropItem();
					break;
				case MsgDef.NM_DEL_ITEM:
					RecvDelItem();
					break;
				case MsgDef.NM_TIP_TALK:
					RecvTipTalk();
					break;
				default:
					trace("未处理消息:" + msgType);
					break;
			}
		}
		/**注册错误*/
		private function RecvRegFail():void
		{
			var reg_fail:NetRegFail = new NetRegFail();
			reg_fail.RecvMsg();
			message.text = reg_fail.Error;
			showMessage.visible = true;
			trace(reg_fail.Error);			
		}	
		/**注册成功*/
		private function RecvRegOk():void
		{
			var reg_ok:NetRegOK = new NetRegOK();
			reg_ok.RecvMsg();
			message.text = reg_ok.OkMsg;
			showMessage.visible = true;
			trace(reg_ok.OkMsg);			
		}		
		/**接收聊天信息*/
		private function RecvChat():void
		{
			var netChat:NetChat = new NetChat();
			netChat.RecvMsg();
			GameDemo.uiChatLog.RecvChat(netChat);
			
			//trace("Name is:" + netChat.Name);					
			//trace("Text is:" + netChat.Text);				
		}
		private function RecvLoginFail():void
		{
			var login_fail:NetLoginFail = new NetLoginFail();
			login_fail.RecvMsg();
			message.text = login_fail.Error;
			showMessage.visible = true;
			trace(login_fail.Error);			
		}
		/**进入角色选择*/
		private function RecvLoginOK():void
		{
			var loginOK:NetLoginOK = new NetLoginOK();
			loginOK.RecvMsg();
			GameDemo.uiGameStart.Hide(null);

			showMessage.visible = false;		
			GameDemo.uiCharSelect.Show();
			GameDemo.playerAccount = loginOK.Account;
			trace(loginOK.Account+"登录成功");
			
		}
		/**接受角色数据*/
		private function RecvPlayerInfo():void
		{
			var playerInfo:NetPlayerInfo = new NetPlayerInfo();
			playerInfo.RecvMsg();
			GameDemo.uiCharSelect.GetPlayerInfo(playerInfo);
			//trace(playerInfo.Name);
		}
		
		private function RecvLineInfo():void
		{
			var lineInfo:NetLineInfo = new NetLineInfo();
			lineInfo.RecvMsg();
			GameDemo.playerLine = lineInfo.Line;
			trace("可用线路:",lineInfo.Line);
		}		
		private function RecvPlayerGetFail():void
		{
			var playerGetFail:NetPlayerGetFail = new NetPlayerGetFail();
			playerGetFail.RecvMsg();
			message.text = playerGetFail.Error;
			showMessage.visible = true;			
		}
		/**连接游戏服务器*/
		private function RecvPlayerGetOK():void
		{
			var playerGetOK:NetPlayerGetOK = new NetPlayerGetOK();
			playerGetOK.RecvMsg();

			Connect(playerGetOK.Host, playerGetOK.Port);
			//GameDemo.uiCharSelect.Hide(null);
			GameDemo.playerIdentity = playerGetOK.Identity;			
			GameDemo.playerName = playerGetOK.Name;

			enterGame = true;
			trace("进入游戏");
		}
		/**申请进入游戏服务器*/
		private function SendGameLogin():void
		{
			var gameLogin:NetGameLogin = new NetGameLogin();
			gameLogin.Name = GameDemo.playerName;
			gameLogin.Account = GameDemo.playerAccount;
			gameLogin.Identity = GameDemo.playerIdentity;
			gameLogin.Version = GameDemo.fileVersion;
			gameLogin.InGame = GameDemo.gameLayer;
			gameLogin.SendMsg();
		}
		private function RecvPlayerNewOk():void
		{
			GameDemo.uiCharCreate.Hide(null);
			GameDemo.uiCharSelect.Free();
			GameDemo.uiCharSelect.Show();
		}
		private function RecvPlayerMain():void
		{
			var playerMain:NetPlayerMain = new NetPlayerMain();
			playerMain.RecvMsg();
			GameDemo.RecvPlayerMain(playerMain);
			
		}
		private function RecvPlayerData():void
		{
			var playerData:NetPlayerData = new NetPlayerData();
			playerData.RecvMsg();		
			GameDemo.RecvPlayerData(playerData);
		}	
		/**物品*/
		private function RecvPlayerItem():void
		{
			var msg:NetPlayerItem = new NetPlayerItem();
			msg.RecvMsg();
			GameDemo.RecvPlayerItem(msg);			
		}
		/**接收技能*/
		private function RecvPlayerSkill():void
		{
			var msg:NetPlayerSkill = new NetPlayerSkill();
			msg.RecvMsg();
			GameDemo.RecvPlayerSkill(msg);			
		}
		/**接收NPC*/
		private function RecvMapNpc():void
		{
			var msg:NetMapNpc = new NetMapNpc();
			msg.RecvMsg();
			GameDemo.RecvMapNpc(msg);
		}
		/**npc移动*/
		private function RecvNpcRun():void
		{
			var msg:NetNpcRun = new NetNpcRun();
			msg.RecvMsg();
			GameDemo.RecvNpcRun(msg);
		}
		/**npc死亡*/
		private function RecvNpcDie():void
		{
			var msg:NetNpcDie = new NetNpcDie();
			msg.RecvMsg();
			GameDemo.RecvNpcDie(msg);			
		}
		/**玩家移动*/
		private function RecvSpcPos():void
		{
			var msg:NetSpcPos = new NetSpcPos();
			msg.RecvMsg();
			GameDemo.RecvSpcPos(msg);
		}
		/**玩家移动*/
		private function RecvSpcRun():void
		{
			var msg:NetSpcRun = new NetSpcRun();
			msg.RecvMsg();
			GameDemo.RecvSpcRun(msg);
		}		
		/**玩家魔法*/
		private function RecvSpcMagic():void
		{
			var msg:NetSpcMagic = new NetSpcMagic();
			msg.RecvMsg();
			GameDemo.RecvSpcMagic(msg);
		}
		/**接收玩家*/
		private function RecvMapMpc():void
		{
			var player:NetMapMpc = new NetMapMpc();
			player.RecvMsg();
			GameDemo.RecvMapMpc(player);
		}
		/**玩家离开地图*/
		private function RecvLeaveMap():void
		{
			var msg:NetSpcLeaveMap = new NetSpcLeaveMap();
			msg.RecvMsg();
			GameDemo.RecvSpcLeaveMap(msg);			
		}
		/**进入地图*/
		private function RecvEnterMap():void
		{
			var msg:NetSpcEnterMap = new NetSpcEnterMap();
			msg.RecvMsg();
			GameDemo.RecvEnterMap(msg);
		}
		/**角色任务*/
		private function RecvPlayerTask():void
		{
			var msg:NetPlayerTask = new NetPlayerTask();
			msg.RecvMsg();
			GameDemo.RecvPlayerTask(msg);
		}
		/**处理命令*/
		private function RecvCommand():void
		{
			var command:NetCommand = new NetCommand();
			command.RecvMsg();
			switch (command.Command)
			{
				case "进入游戏":
					GameDemo.EnterGame();				
					break;
				default:
					trace("未处理命令:" + command.Command);
					break;
				
			}
		}
		/**拿起物品*/
		private function RecvPickItem():void
		{
			var msg:NetPickItem = new NetPickItem();
			msg.RecvMsg();
			GameDemo.RecvPickItem(msg);
		}
		/**放下物品*/
		private function RecvDropItem():void
		{
			var msg:NetDropItem = new NetDropItem();
			msg.RecvMsg();
			GameDemo.RecvDropItem(msg);
		}
		/**删除物品*/
		private function RecvDelItem():void
		{
			var msg:NetDelItem = new NetDelItem();
			msg.RecvMsg();
			GameDemo.RecvDelItem(msg);
		}	
		/**改变角色装备*/
		private function RecvSpcEquip():void
		{
			var msg:NetSpcEquip = new NetSpcEquip();
			msg.RecvMsg();
			GameDemo.RecvSpcEquip(msg);
		}
		private function RecvTipTalk():void
		{
			var msg:NetTipTalk = new NetTipTalk();
			msg.RecvMsg();
			trace(msg.Tips);
		}
	}
}