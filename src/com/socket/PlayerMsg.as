package com.socket
{
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	
	import com.socket.SocketClient;	
	
	public class PlayerMsg
	{
		public var msgPool:Array = new Array();
		public var msgLen:Array = new Array();
		private var sendData:ByteArray = new ByteArray();			
		
		public function PlayerMsg()
		{
			sendData.endian = Endian.LITTLE_ENDIAN;			
		}
		// 构件消息包
		public function MakeMsg(msgType:int):void
		{
			if (SocketClient.socket == null)
				return;
			if (SocketClient.socket.connected == false)
				return;
			// 组合消息
			for (var i:int = 0; i < msgPool.length; i++)	
			{
				if (msgPool[i] is int)
				{
					if (msgLen[i] == 1)
						sendData.writeByte(msgPool[i]);
					else if (msgLen[i] == 2)
						sendData.writeShort(msgPool[i]);
					else if (msgLen[i] == 4)
						sendData.writeUnsignedInt(msgPool[i]);
					
				}
				else if (msgPool[i] is String)
				{
					sendData.writeMultiByte(msgPool[i], "GBK");		
					AddStrLen(msgPool[i], msgLen[i]);
				}
			}

			var example:String ="~";		
			//var byteArray:ByteArray = new ByteArray();
			var temp:ByteArray = new ByteArray();
			var code:uint = 0;

			
			//byteArray.endian = Endian.LITTLE_ENDIAN;
			temp.endian = Endian.LITTLE_ENDIAN;				
			
			temp.writeByte(example.charCodeAt(0));//消息标记
			temp.writeUnsignedInt(0);//校验
			temp.writeByte(msgType);//消息类型		
			
			temp.writeShort(sendData.length);//实际消息长度
			temp.writeBytes(sendData);

			code = BufToId(temp, temp.length);
			
			// 重新插入校验码
			temp.position = 1;
			temp.writeUnsignedInt(code);//校验				
			
			SocketClient.socket.writeBytes(temp);
			SocketClient.socket.flush();				
		}
		// 读取消息
		public function GetMsg():void
		{
			for (var i:int = 0; i < msgPool.length; i++)	
			{
				if (msgPool[i] is int)
				{
					if (msgLen[i] == 1)
					{
						msgPool[i] = SocketClient.socket.readUnsignedByte();				
					}
					else if (msgLen[i] == 2)
					{
						msgPool[i] = SocketClient.socket.readUnsignedShort();
					}
					else if (msgLen[i] == 4)
					{
						msgPool[i] = SocketClient.socket.readUnsignedInt();
					}
					else
					{
						trace("未知长度");
					}
					
				}
				else if (msgPool[i] is String)
				{
					msgPool[i] = SocketClient.socket.readMultiByte(msgLen[i], "GBK")	
				}
				else
				{
					trace("未知类型");
				}
			}			
		}
		// 校验码
		public function BufToId(Buf:ByteArray, Len:int):uint
		{
			var Id:uint  = 0;
			for (var i:int = 0; i < Len; i++)
			{
				var code:uint = Buf[i];
				Id = (Id + (i + 1) * Buf[i]);// % 0x8000000b * 0xffffffef;
				//trace(code+","+Id);
			}
			return (Id ^ 0x12345678);
		}		

		// 补充字符串长度
		private function AddStrLen(str:String, len:int):void
		{
			var strBuf:ByteArray = new ByteArray();				
			strBuf.writeMultiByte(str, "GBK");		
			
			for (var i:int = strBuf.length; i < len; i++)
			{
				sendData.writeByte(0);
			}
		}
	}
}