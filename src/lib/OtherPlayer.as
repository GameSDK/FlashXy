package lib
{
	import com.socket.msg.NetMapMpc;
	import com.socket.msg.NetSpcEquip;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class OtherPlayer extends Npc
	{
		protected var loadurl:URLLoader = new URLLoader();		
		protected var xml:XML = null;
		
		public function OtherPlayer()
		{
			super();
			type = TYPE_OPL;			
			var img:Bitmap = new Bitmap();		
			imgBitmap[1] = img;
			addChild(imgBitmap[1]);		
			LoadOrder("asset/npc/跑步.xml");
		}
		public function RecvMapMpc(msg:NetMapMpc):void
		{
			//LoadImg("asset/npc/站立.png");				
			name = msg.Name;
			dir = msg.Dir;
			sx = msg.X;
			sy = msg.Y;
			state = msg.State;
			this.SetName(msg.Name);	
			ChangeState();
		}
		public function RecvSpcEquip(msg:NetSpcEquip):void
		{
			//Cloth = msg.Cloth;
			//Weapon = msg.Weapon;
			//Ride = msg.Ride;
			
			//m_ClothClass = msg.ClothClass;
			//m_ClothFive = msg.ClothFive;
			//m_WeaponClass = msg.WeaponClass;
			//m_WeaponFive = msg.WeaponFive;
			//m_RideClass = msg.RideClass;
			//m_RideFive = msg.RideFive;
			//m_Mount = msg.Mount;

			//UpdateImage();
		}
		
		//public function SetName(str:String):void
		//{
		//	dispName = str;
		//	textName.htmlText = dispName;
		//	textName.textColor = 0xffffff;
		//	textName.x = sx - Map.MapX;
		//	textName.y = sy - Map.MapY;
		//	textName.mouseEnabled = false;
		//	addChild(textName);
		//}		
		public function LoadOrder(file:String):void
		{
			loadurl.load(new URLRequest(file));
			loadurl.addEventListener(Event.COMPLETE,Loadxml);
		}		
		private function Loadxml(event:Event):void
		{
			xml = XML(loadurl.data);
			//trace(xml.Dir[0].Frame[0]);
		}		
		public override function Draw():void
		{
			if (xml == null)
				return;
			for (var i:int = 0; i < 2; i++)
			{
				var or:String = xml.Dir[dir].Frame[frame];
				var index:int = or.charCodeAt(i) - 48;
				setChildIndex(imgBitmap[i], index);
				
				if (imgFile[i])
				{
					gameImg = ImgList.getInstance().GetRes(imgFile[i]);
					if (gameImg)
					{
						dirFrm = gameImg.GetFrame() / dirNum;
						var Frame:int = frame + dir * dirFrm;	
						
						gameImg.DrawBitMap(sx - Map.MapX, sy - Map.MapY, Frame, imgBitmap[i]);
						//	gameImg.DrawBitMap(sx - Map.MapX, sy - Map.MapY, 0, imgBitmap[i]);
						
					}
				}
			}
		}		
		
	}
}