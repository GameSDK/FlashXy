package com.socket.msg
{
	import com.socket.PlayerMsg;
	
	public class NetSpcEquip extends PlayerMsg
	{
		public var Name:String = "";//名字
		public var Cloth:String = "";//衣服
		public var Weapon:String = "";//武器
		public var Ride:String = "";//坐骑
		public var ClothClass:int = 0;//衣服类别
		public var WeaponClass:int = 0;//武器类别
		public var RideClass:int = 0;//坐骑类别
		public var ClothFive:int = 0;//衣服五行
		public var WeaponFive:int = 0;//武器五行
		public var RideFive:int = 0;//坐骑五行
		public var Mount:int = 0;//是否上坐骑
		
		private var NameLen:int = 20;//名字
		private var ClothLen:int = 20;//衣服
		private var WeaponLen:int = 20;//武器
		private var RideLen:int = 20;//坐骑
		private var ClothClassLen:int = 1;//衣服类别
		private var WeaponClassLen:int = 1;//武器类别
		private var RideClassLen:int = 1;//坐骑类别
		private var ClothFiveLen:int = 1;//衣服五行
		private var WeaponFiveLen:int = 1;//武器五行
		private var RideFiveLen:int = 1;//坐骑五行
		private var MountLen:int = 1;//是否上坐骑		
		
		public function NetSpcEquip()
		{

			msgPool.push(Name);
			msgPool.push(Cloth);
			msgPool.push(Weapon);
			msgPool.push(Ride);
			msgPool.push(ClothClass);
			msgPool.push(WeaponClass);
			msgPool.push(RideClass);
			msgPool.push(ClothFive);
			msgPool.push(WeaponFive);
			msgPool.push(RideFive);
			msgPool.push(Mount);
			
			msgLen.push(NameLen);			
			msgLen.push(ClothLen);			
			msgLen.push(WeaponLen);			
			msgLen.push(RideLen);
			msgLen.push(ClothClassLen);			
			msgLen.push(WeaponClassLen);			
			msgLen.push(RideClassLen);			
			msgLen.push(ClothFiveLen);			
			msgLen.push(WeaponFiveLen);			
			msgLen.push(RideFiveLen);			
			msgLen.push(MountLen);			

		}
		public function RecvMsg():void
		{
			GetMsg();
			Name = msgPool[0];
			Cloth = msgPool[1];
			Weapon = msgPool[2];
			Ride = msgPool[3];
			ClothClass = msgPool[4];
			WeaponClass = msgPool[5];
			RideClass = msgPool[6];
			ClothFive = msgPool[7];
			WeaponFive = msgPool[8];
			RideFive = msgPool[9];
			Mount = msgPool[10];
		}		
	}
}