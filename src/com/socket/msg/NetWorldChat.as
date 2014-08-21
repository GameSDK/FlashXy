package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetWorldChat extends PlayerMsg
	{
		public var Name:String = "";
		public var Party:String = "";
		public var Text:String = "";

		private var NameLen:int = 20;
		private var PartyLen:int = 20;
		private var TextLen:int = 200;
		
		public function NetWorldChat()
		{
			msgPool.push(Name);				
			msgPool.push(Party);				
			msgPool.push(Text);				
			
			msgLen.push(NameLen);
			msgLen.push(PartyLen);
			msgLen.push(TextLen);
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Party = msgPool[1];
			Text = msgPool[2];
		}
		public function SendMsg():void
		{		
			msgPool[0] = Name;
			msgPool[1] = Party;
			msgPool[2] = Text;
			
			MakeMsg(MsgDef.NM_WORLD_CHAT);
		}			
	}
}