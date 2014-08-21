package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetLoginOK extends PlayerMsg
	{
		public var Account:String = "";
		public var	Prevent:int = 0;
		public var	GmLevel:int = 0;		
		public var	ChargePoint:int = 0;
		public var	RemainPoint:int = 0;		
		public var	Socket:int = 0;
		public var	Letter:int = 0;
		
		private var AccountLen:int = 32;
		private var PreventLen:int = 1;
		private var GmLevelLen:int = 1;		
		private var ChargePointLen:int = 4;
		private var RemainPointLen:int = 4;		
		private var SocketLen:int = 4;
		private var Letterlen:int = 4;
	
		public function NetLoginOK()
		{
			msgPool.push(Account);
			msgPool.push(Prevent);
			msgPool.push(GmLevel);				
			msgPool.push(ChargePoint);				
			msgPool.push(RemainPoint);				
			msgPool.push(Socket);				
			msgPool.push(Letter);				
			
			msgLen.push(AccountLen);
			msgLen.push(PreventLen);
			msgLen.push(GmLevelLen);
			msgLen.push(ChargePointLen);
			msgLen.push(RemainPointLen);
			msgLen.push(SocketLen);
			msgLen.push(Letterlen);

		}
		public function RecvMsg():void
		{
			GetMsg();
			Account = msgPool[0];
			Prevent = msgPool[1];
			GmLevel = msgPool[2];	
			ChargePoint = msgPool[3];	
			RemainPoint = msgPool[4];	
			Socket = msgPool[5];	
			Letter = msgPool[6];				
		}		
	}
}