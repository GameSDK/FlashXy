package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetGameLogin extends PlayerMsg
	{
		public var Name:String = "";
		public var Account:String = "";
		public var Identity:String = "";
		public var Version:String = "";
		public var InGame:int = 0;
		
		private var NameLen:int = 20;
		private var AccountLen:int = 32;
		private var IdentityLen:int = 20;
		private var VersionLen:int = 20;
		private var InGameLen:int = 1;
	
		public function NetGameLogin()
		{
			msgPool.push(Name);
			msgPool.push(Account);
			msgPool.push(Identity);
			msgPool.push(Version);
			msgPool.push(InGame);
			
			msgLen.push(NameLen);
			msgLen.push(AccountLen);
			msgLen.push(IdentityLen);
			msgLen.push(VersionLen);
			msgLen.push(InGameLen);
		}
		public function SendMsg():void
		{
			msgPool[0] = Name;
			msgPool[1] = Account;
			msgPool[2] = Identity;
			msgPool[3] = Version;
			msgPool[4] = InGame;
			
			MakeMsg(MsgDef.NM_GAME_LOGIN);
		}
	}
}