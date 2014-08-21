package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetSysChat extends PlayerMsg
	{
		public var Text:String = "";

		private var TextLen:int = 200;

		public function NetSysChat()
		{
			msgPool.push(Text);				
			
			msgLen.push(TextLen);
		}
		public function RecvMsg():void
		{
			GetMsg();
			Text = msgPool[0];
		}
		public function SendMsg():void
		{		
			msgPool[0] = Text;
			
			MakeMsg(MsgDef.NM_SYS_CHAT);
		}		
	}
}