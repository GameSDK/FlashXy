package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetSpcRun extends PlayerMsg
	{
		public var Name:String = "";
		public var DesX:int = 0;
		public var DesY:int = 0;
		public var SrcX:int = 0;
		public var SrcY:int = 0;
		public var Speed:int = 0;
		
		private var NameLen:int = 20;
		private var DesXLen:int = 2;
		private var DesYLen:int = 2;
		private var SrcXLen:int = 2;
		private var SrcYLen:int = 2;
		private var SpeedLen:int = 1;		
		
		public function NetSpcRun()
		{
			msgPool.push(Name);
			msgPool.push(DesX);
			msgPool.push(DesY);
			msgPool.push(SrcX);
			msgPool.push(SrcY);
			msgPool.push(Speed);
			
			msgLen.push(NameLen);
			msgLen.push(DesXLen);
			msgLen.push(DesYLen);
			msgLen.push(SrcXLen);
			msgLen.push(SrcYLen);
			msgLen.push(SpeedLen);

		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			DesX = msgPool[1];
			DesY = msgPool[2];
			SrcX = msgPool[3];
			SrcY = msgPool[4];
			Speed = msgPool[5];
		}	
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = DesX;
			msgPool[2] = DesY;
			msgPool[3] = SrcX;
			msgPool[4] = SrcY;
			msgPool[5] = Speed;
			MakeMsg(MsgDef.NM_SPC_RUN);
		}			
	}
}