package com.socket.msg
{

	import com.socket.PlayerMsg;
	
	public class NetLogin extends PlayerMsg
	{
		public var Account:String = "";
		public var	Password:String = "";
		public var	Address:String = "";
		public var	Server:String = "";
		public var	Prevent:int = 0;
		public var	Socket:int = 0;
		public var	Letter:int = 0;
		public var	CheckLetter:int = 0;	
		
		private var AccountLen:int = 32;
		private var PasswordLen:int = 33;
		private var AddressLen:int  = 20;
		private var ServerLen:int = 20;
		private var PreventLen:int = 1;
		private var SocketLen:int = 4;
		private var Letterlen:int = 4;
		private var CheckLetterlen:int = 1;
		
		public function NetLogin()
		{
			msgPool.push(Account);
			msgPool.push(Password);
			msgPool.push(Address);				
			msgPool.push(Server);				
			msgPool.push(Prevent);				
			msgPool.push(Socket);				
			msgPool.push(Letter);				
			msgPool.push(CheckLetter);				
			
			msgLen.push(AccountLen);
			msgLen.push(PasswordLen);
			msgLen.push(AddressLen);
			msgLen.push(ServerLen);
			msgLen.push(PreventLen);
			msgLen.push(SocketLen);
			msgLen.push(Letterlen);
			msgLen.push(CheckLetterlen);

		}
		public function SendMsg():void
		{
			msgPool[0] = Account;
			msgPool[1] = Password;
			msgPool[2] = Address;	
			msgPool[3] = Server;
			msgPool[4] = Prevent;
			msgPool[5] = Socket;				
			msgPool[6] = Letter;				
			msgPool[7] = CheckLetter;				
			
			MakeMsg(MsgDef.NM_LOGIN);
		}		
		public function RecvMsg():void
		{
			
		}		
	}
}