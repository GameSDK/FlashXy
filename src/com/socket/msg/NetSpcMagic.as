package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetSpcMagic extends PlayerMsg
	{
		
		public var Name:String = "";
		public var MagicName:String = "";//技能名称
		public var MagicLevel:int = 0;//技能等级
		public var ObjName:String = "";// 目标名称
		public var Type:int = 0;// 目标类型
		public var DesX:int = 0;
		public var DesY:int = 0;
		public var SrcX:int = 0;
		public var SrcY:int = 0;
		
		private var NameLen:int = 20;
		private var MagicNameLen:int = 20;//技能名称
		private var MagicLevelLen:int = 1;//技能等级
		private var ObjNameLen:int = 20;// 目标名称
		private var TypeLen:int = 1;// 目标类型
		private var DesXLen:int = 2;
		private var DesYLen:int = 2;
		private var SrcXLen:int = 2;
		private var SrcYLen:int = 2;		
		
		public function NetSpcMagic()
		{
			msgPool.push(Name);
			msgPool.push(MagicName);
			msgPool.push(MagicLevel);
			msgPool.push(ObjName);
			msgPool.push(Type);
			msgPool.push(DesX);
			msgPool.push(DesY);
			msgPool.push(SrcX);
			msgPool.push(SrcY);
			
			msgLen.push(NameLen);
			msgLen.push(MagicNameLen);
			msgLen.push(MagicLevelLen);
			msgLen.push(ObjNameLen);
			msgLen.push(TypeLen);
			msgLen.push(DesXLen);
			msgLen.push(DesYLen);
			msgLen.push(SrcXLen);
			msgLen.push(SrcYLen);			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			MagicName = msgPool[1];
			MagicLevel = msgPool[2];
			ObjName = msgPool[3];
			Type = msgPool[4];
			DesX = msgPool[5];
			DesY = msgPool[6];
			SrcX = msgPool[7];
			SrcY = msgPool[8];			
		}	
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = MagicName;
			msgPool[2] = MagicLevel;
			msgPool[3] = ObjName;
			msgPool[4] = Type;
			msgPool[5] = DesX;
			msgPool[6] = DesY;
			msgPool[7] = SrcX;
			msgPool[8] = SrcY;			
			MakeMsg(MsgDef.NM_SPC_MAGIC);
		}		
	}
}