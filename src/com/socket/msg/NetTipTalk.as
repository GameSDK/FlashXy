package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetTipTalk extends PlayerMsg
	{
		public var Tips:String = "";// 消息提示
		public var Talk:String = "";// 对话脚本
		public var Param:String = "";// 任务参数

		private var TipsLen:int = 200;// 消息提示
		private var TalkLen:int = 20;// 对话脚本
		private var ParamLen:int = 20;// 任务参数
		
		public function NetTipTalk()
		{
			msgPool.push(Tips);
			msgPool.push(Talk);
			msgPool.push(Param);
			
			msgLen.push(TipsLen);			
			msgLen.push(TalkLen);			
			msgLen.push(ParamLen);			
		}
		public function RecvMsg():void
		{
			GetMsg();
			Tips = msgPool[0];
			Talk = msgPool[1];
			Param = msgPool[2];
		}		
	}
}