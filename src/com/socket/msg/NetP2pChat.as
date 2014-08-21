package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetP2pChat extends PlayerMsg
	{
		public var From:String = "";
		public var To:String = "";
		public var Text:String = "";

		private var FromLen:int = 20;
		private var ToLen:int = 20;
		private var TextLen:int = 200;
		
		public function NetP2pChat()
		{
			msgPool.push(From);				
			msgPool.push(To);				
			msgPool.push(Text);				
			
			msgLen.push(FromLen);
			msgLen.push(ToLen);
			msgLen.push(TextLen);
		}
		public function RecvMsg():void
		{
			GetMsg();
			From = msgPool[0];
			To = msgPool[1];
			Text = msgPool[2];
		}
		public function SendMsg():void
		{		
			msgPool[0] = FromLen;
			msgPool[1] = ToLen;
			msgPool[2] = TextLen;
			
			MakeMsg(MsgDef.NM_P2P_CHAT);
		}			
	}
}