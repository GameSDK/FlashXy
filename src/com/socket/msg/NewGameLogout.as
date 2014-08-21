package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NewGameLogout extends PlayerMsg
	{
		public var Account:String = "";
		public var Server:String = "";
		public var Name:String = "";
		public var Party:String = "";
		public var ClientIp:String = "";
		public var Level:int = 0;
		public var Sex:int = 0;
		public var Silver:int = 0;
		public var Gold:int = 0;

		private var AccountLen:int = 32;
		private var ServerLen:int = 20;
		private var NameLen:int = 20;
		private var PartyLen:int = 20;
		private var ClientIpLen:int = 20;
		private var LevelLen:int = 1;
		private var SexLen:int = 1;
		private var SilverLen:int = 4;
		private var GoldLen:int = 4;
		
		public function NewGameLogout()
		{
			msgPool.push(Account);
			msgPool.push(Server);
			msgPool.push(Name);				
			msgPool.push(Party);				
			msgPool.push(ClientIp);				
			msgPool.push(Level);				
			msgPool.push(Sex);				
			msgPool.push(Silver);				
			msgPool.push(Gold);				
			
			msgLen.push(AccountLen);
			msgLen.push(ServerLen);
			msgLen.push(NameLen);
			msgLen.push(PartyLen);
			msgLen.push(ClientIpLen);
			msgLen.push(LevelLen);
			msgLen.push(SexLen);
			msgLen.push(SilverLen);
			msgLen.push(GoldLen);
		}
		public function SendMsg():void
		{
			msgPool[0] = Account;
			msgPool[1] = Server;
			msgPool[2] = Name;	
			msgPool[3] = Party
			msgPool[4] = ClientIp;
			msgPool[5] = Level;				
			msgPool[6] = Sex;				
			msgPool[7] = Silver;				
			msgPool[7] = Gold;				
	
			MakeMsg(MsgDef.NM_GAME_LOGOUT);
		}		

	}
}