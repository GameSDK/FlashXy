package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetPlayerTask extends PlayerMsg
	{
		public var Name:String = "";//角色名称
		public var Task:String = "";//任务名称
		public var Value:int = 0;//任务数值
		
		private var NameLen:int = 20;//角色名称
		private var TaskLen:int = 20;//任务名称
		private var ValueLen:int = 4;//任务数值
		
		public function NetPlayerTask()
		{
			msgPool.push(Name);
			msgPool.push(Task);
			msgPool.push(Value);
			
			msgLen.push(NameLen);
			msgLen.push(TaskLen);
			msgLen.push(ValueLen);
		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Task = msgPool[1];
			Value = msgPool[2];
		}			
	}
}