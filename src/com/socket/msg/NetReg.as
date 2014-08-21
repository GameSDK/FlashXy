package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetReg extends PlayerMsg
	{
		public var Account:String = "";
		public var Password:String = "";
		public var Password2:String = "";
		public var Name:String = "";
		public var Card:String = "";
		
		private var AccountLen:int = 32;
		private var PasswordLen:int = 33;
		private var Password2Len:int = 33;
		private var NameLen:int = 20;
		private var CardLen:int = 20;		
		
		public function NetReg()
		{
			msgPool.push(Account);
			msgPool.push(Password);
			msgPool.push(Password2);
			msgPool.push(Name);
			msgPool.push(Card);
			
			msgLen.push(AccountLen);
			msgLen.push(PasswordLen);
			msgLen.push(Password2Len);
			msgLen.push(NameLen);
			msgLen.push(CardLen);
		}
		public function SendMsg():void
		{
			msgPool[0] = Account;
			msgPool[1] = Password;
			msgPool[2] = Password2;	
			msgPool[3] = Name;
			msgPool[4] = Card;
		
			MakeMsg(MsgDef.NM_REG);
		}		
	}
}