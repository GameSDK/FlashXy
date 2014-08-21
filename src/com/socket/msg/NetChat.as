package com.socket.msg
{

	import com.socket.PlayerMsg;
	
	public class NetChat extends PlayerMsg
	{
		public var Channel:int = 0;
		public var Name:String = "";
		public var Text:String = "";
		
		private var ChannelLen:int = 2;
		private var NameLen:int = 20;
		private var TextLen:int = 200;
		
		public function NetChat()
		{
			msgPool.push(Channel);
			msgPool.push(Name);
			msgPool.push(Text);				
			
			msgLen.push(ChannelLen);
			msgLen.push(NameLen);
			msgLen.push(TextLen);			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Channel = msgPool[0];
			Name = msgPool[1];
			Text = msgPool[2];
		}
		public function SendMsg():void
		{		
			msgPool[0] = Channel;
			msgPool[1] = Name;
			msgPool[2] = Text;
			
			MakeMsg(MsgDef.NM_CHAT);
		}
	}
}