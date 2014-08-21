package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetSpcEnterMap extends PlayerMsg
	{
		public var MapName:String = "";
		public var X:int=0;
		public var Y:int=0;
		public var Dir:int=0;

		private var MapNameLen:int = 80;
		private var XLen:int = 2;
		private var YLen:int = 2;
		private var DirLen:int = 1;

		public function NetSpcEnterMap()
		{
			msgPool.push(MapName);
			msgPool.push(X);
			msgPool.push(Y);
			msgPool.push(Dir);

			msgLen.push(MapNameLen);
			msgLen.push(XLen);
			msgLen.push(YLen);
			msgLen.push(DirLen);
			
		}
		
		public function RecvMsg():void
		{
			GetMsg();
			MapName = msgPool[0];
			X = msgPool[1];
			Y = msgPool[2];
			Dir = msgPool[3];
		}		
	}
}