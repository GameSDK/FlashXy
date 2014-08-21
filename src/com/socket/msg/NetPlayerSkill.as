package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerSkill extends PlayerMsg
	{
		public var Name:String = "";//角色名称
		public var SkillName:String = "";//技能名称
		public var SkillLevel:int = 0;//技能等级
		public var QuickIndex:int = 0;//快捷位置
		public var SkillTimer:int = 0;//间隔时间
		
		private var NameLen:int = 20;//角色名称
		private var SkillNameLen:int = 20;//技能名称
		private var SkillLevelLen:int = 1;//技能等级
		private var QuickIndexLen:int = 1;//快捷位置
		private var SkillTimerLen:int = 4;//间隔时间		
		
		public function NetPlayerSkill()
		{

			msgPool.push(Name);
			msgPool.push(SkillName);
			msgPool.push(SkillLevel);
			msgPool.push(QuickIndex);
			msgPool.push(SkillTimer);
			
			msgLen.push(NameLen);			
			msgLen.push(SkillNameLen);			
			msgLen.push(SkillLevelLen);			
			msgLen.push(QuickIndexLen);			
			msgLen.push(SkillTimerLen);			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			SkillName = msgPool[1];
			SkillLevel = msgPool[2];
			QuickIndex = msgPool[3];
			SkillTimer = msgPool[4];
		}
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = SkillName;
			msgPool[2] = SkillLevel;
			msgPool[3] = QuickIndex;
			msgPool[4] = SkillTimer;
			MakeMsg(MsgDef.NM_PLAYER_SKILL);
		}		
	}
}