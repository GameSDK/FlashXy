package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetSpcPos extends PlayerMsg
	{
		public var Name:String = "";
		public var X:int = 0;
		public var Y:int = 0;
		
		private var NameLen:int = 20;
		private var XLen:int = 2;
		private var YLen:int = 2;
		
		public function NetSpcPos()
		{
			msgPool.push(Name);
			msgPool.push(X);
			msgPool.push(Y);
			
			msgLen.push(NameLen);
			msgLen.push(XLen);
			msgLen.push(YLen);

		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			X = msgPool[1];
			Y = msgPool[2];
		}	
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = X;
			msgPool[2] = Y;
			MakeMsg(MsgDef.NM_SPC_POS);
		}		
	}
}