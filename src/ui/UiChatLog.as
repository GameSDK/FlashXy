package ui
{
	import com.bit101.components.InputText;
	import com.bit101.components.Label;
	import com.bit101.components.TextArea;
	import com.socket.PlayerMsg;
	import com.socket.msg.NetChat;
	import com.socket.msg.NetP2pChat;
	import com.socket.msg.NetSysChat;
	import com.socket.msg.NetWorldChat;
	
	import flash.events.Event;
	
	public class UiChatLog extends UiNode
	{
		public static var CH_WORLD:int=0;//世界频道
		public static var CH_PARTY:int=1;//门派频道
		public static var CH_MAP:int=2;//地图频道
		public static var CH_NEAR:int=3;//区域频道
		public static var CH_TEAM:int=4;//队伍频道
		public static var CH_FAMILY:int=5;//家族频道
		public static var CH_FACTION:int=6;//帮会频道
		public static var CH_PRIVATE:int=7;//私聊频道
		public static var CH_SYSTEM:int=8;//系统频道
		public static var CH_WHOOP:int=90; //呐喊频道
		public static var CH_GM:int=10;//管理频道
		public static var CH_TV:int=11;//电视频道
		public static var CH_CHSYS:int=12;//聊天栏中的系统频道
		
		private var chatText:InputText;	
		private var chatList:TextArea;
		private var chatLabel:Label;
		
		private var chatChannel:int;

		private var channelName:Array = ["世界", "门派","地图","区域","队伍","家族","帮会","私聊","系统"];
		public function UiChatLog()
		{
			super();
			chatChannel = CH_NEAR;
			xmlConfig.loadXML("asset/ui/ChatLog.xml");				
		}
		public function OnEnter(e:Event):void
		{
			SendChatText();
		}
		public function SelectChannel(Id:int):void
		{
			chatChannel = Id;
			UpdateChat();
		}
		public function UpdateChat():void	
		{
			chatLabel = xmlConfig.getCompById("Title") as Label;
			if (chatLabel)
			{
				chatLabel.text = channelName[chatChannel];
			}
			
		}
		public function SendChatText():void
		{
			chatText = xmlConfig.getCompById("input") as InputText;
			
			if (chatChannel == CH_WORLD)
			{
				var worMsg:NetWorldChat = new NetWorldChat();
				//Msg.New(NM_WORLD_CHAT);
				//TmNetWorldChat* p = (TmNetWorldChat*)Msg.m_Data;
				worMsg.Name =  GameDemo.player.name;
				worMsg.Party =  "";
				worMsg.Text = chatText.text;
				//chatBox->GetText(p->Text, sizeof(p->Text));
				worMsg.SendMsg();
			}
			else if (chatChannel == CH_PRIVATE)
			{
				var p2pMsg:NetP2pChat = new NetP2pChat();
				
				//Msg.New(NM_P2P_CHAT);
				//TmNetP2pChat* p = (TmNetP2pChat*)Msg.m_Data;
				//GmStrCopy(p->From, GpSpc->m_Name);
				//GmStrLCopy(p->To, pB+1, pE-pB);
				//GmStrCopy(p->Text, pE+1);
				//ChatText(m_ChatChannel, p->From, p->To, p->Text);
				p2pMsg.SendMsg();
			}
			else if (chatChannel == CH_SYSTEM)
			{
				var sysMsg:NetSysChat = new NetSysChat();				
				//Msg.New(NM_SYS_CHAT);
				//TmNetSysChat* p = (TmNetSysChat*)Msg.m_Data;
				sysMsg.Text = chatText.text;
				//chatBox->GetText(p->Text, sizeof(p->Text));
				//ChatText(m_ChatChannel, "", "", p->Text);
				// 分析客户端命令
				//if (ParseCommand(p->Text))
				//{
				//	chatBox->Clear();
				//	return;
				//}
				sysMsg.SendMsg();
			}
			else
			{
				var msg:NetChat = new NetChat();				
				//Msg.New(NM_CHAT);
				//TmNetChat* p = (TmNetChat*)Msg.m_Data;
				msg.Channel = chatChannel;
				msg.Name = GameDemo.player.name;
				msg.Text = chatText.text;
				msg.SendMsg();
				//chatBox->GetText(p->Text, sizeof(p->Text));
			}

			//Msg.SendToServer(GpGame);
			
		}
		//---------------------------------------------------------------------------
		public function  RecvChat(msg:NetChat):void
		{
			//TmNetChat* p = (TmNetChat*)Msg->m_Data;
			ChatText(msg.Channel, msg.Name, "", msg.Text);
		}
		//---------------------------------------------------------------------------
		public function  RecvWorldChat(msg:NetWorldChat):void
		{
			//TmNetWorldChat* p = (TmNetWorldChat*)Msg->m_Data;
			ChatText(CH_WORLD, msg.Name, msg.Party, msg.Text);
		}
		//---------------------------------------------------------------------------
		public function  RecvP2PChat(msg:NetP2pChat):void
		{
			//TmNetP2pChat* p = (TmNetP2pChat*)Msg->m_Data;
			ChatText(CH_PRIVATE, msg.From, msg.To, msg.Text);
		}		
		//---------------------------------------------------------------------------
		public function  RecvSysChat(msg:NetSysChat):void
		{
			//TmNetSysChat* p = (TmNetSysChat*)Msg->m_Data;
			ChatText(CH_SYSTEM, "", "", msg.Text);
		}
		//---------------------------------------------------------------------------
		public function  ChatText(Channel:int, From:String, To:String, text:String):void
		{
			chatList = xmlConfig.getCompById("chatlist") as TextArea;
			if (chatList)
			{
				chatList.text = chatList.text + 
					"<FONT COLOR=\"#ffffff\">" + text + "</FONT>\n";
				//chatList.setMax();
			}
			/*static char* szChannel[] = {"世界","门派","地图","附近","组队","家族","帮会","密语","系统"};
			char Buf[200];
			char Emote[200];
			switch (Channel)
			{
				case CH_TV: //游戏公告
					AddTvMsg(Text, 10);
					return;
				case CH_GM: //GM公告
					AddGmMsg(Text);
					return;
				case CH_SYSTEM: //系统提示
					GpSystemLog->AddLog(Text);
					return;
			}
			// 检查屏蔽
			if (GpFriend->m_BlockList.FindName(From))
				return;
			// 最大行数
			if (m_ChatList.m_ItemCount >= 1000)
			{
				GmFree(m_ChatList.RemoveTail());
				m_ChatList.m_ItemCount--;
			}
			// 表情替换
			GmStrLCopy(Emote, Text, sizeof(Emote));
			if (Emote[0] == '/')
			{
				GetEmote(From, Emote);
				if (Emote[0] == 0)
					return;
				if (Channel == CH_WORLD)
					sprintf(Buf, "【%s】%s", To, Emote);
				else
					sprintf(Buf, "【%s】%s", szChannel[Channel], Emote);
			}
			// 头顶表情
			if (Emote[0] == '@')
			{
				strcpy(Emote, Emote + 1);
				if (strcmp(GpSpc->m_Name, From) == 0)
				{
					GpSpc->FreeEffect();
					GpSpc->AddEffect(Emote, GpSpc->m_X, GpSpc->m_Y);
				}
				else
				{
					KmMpc* Mpc = (KmMpc*)GpMap->m_MpcList.FindName(From);
					if (Mpc)
					{
						Mpc->FreeEffect();
						Mpc->AddEffect(Emote, GpSpc->m_X, GpSpc->m_Y);
					}
				}
				return;
			}
			else
			{
				if (Channel == CH_WORLD)
					sprintf(Buf, "【%s】%s：%s", To, From, Emote);
				else if (Channel == CH_PRIVATE && strcmp(From, GpSpc->m_Name) == 0)
					sprintf(Buf, "【%s】你对%s说：%s", szChannel[Channel], To, Emote);
				else
					sprintf(Buf, "【%s】%s：%s", szChannel[Channel], From, Emote);
			}
			// 加入聊天记录
			m_ChatList.AddLine(From, Buf, Channel);
			UpdateChat();
			// 私聊不在头顶显示
			if (Channel >= CH_PRIVATE)
				return;
			// 特殊聊天内容不显示
			if (GpRichText->FindRichText(Emote))
				return;
			// 人物头顶显示
			if (strcmp(GpSpc->m_Name, From) == 0)
			{
				GpSpc->RecvChat(Emote, 20);
			}
			else
			{
				KmMpc* Mpc = (KmMpc*)GpMap->m_MpcList.FindName(From);
				if (Mpc)
					Mpc->RecvChat(Emote, 20);
			}*/
		}		
		
	}
}