package 
{
	//import ResourcePool.*;
	
	import com.core.IniFile;
	import com.core.printf;
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.*;
	
	import lib.MapPath;
	
	public class Map// extends Sprite
	{
		public static var MapX:int = 0;
		public static var MapY:int = 0;
		public static var Width:int;
		public static var Height:int;
		private var OldX:int = -1;
		private var OldY:int = -1;
		private var TileWidth:int;
		private var TileHeight:int;
		private var TileSize:int = 512;
		//private var TileHeight:int = 512;
		private var Canload:Boolean = true;
		public var loadurl:URLLoader = new URLLoader();
		public var loadjpg:Loader = new Loader();
		
		private var mapFile:String;
		private var iniMap:Boolean = true;
		private var loadIni:IniFile = new IniFile();//以 INI 格式载入地图配置
		
		//private var bm:BitmapData = new BitmapData(1024, 600, false, 0);
		//private var backbitmap:Bitmap = new Bitmap(bm);
		
		public static var resPool:ResourcePool = new ResourcePool();
		public static var mapObs:MapObs = new MapObs();
		public static var path:MapPath = new MapPath();
		
		public function Map()
		{
			//trace("ok");
			//addChild(backbitmap);		
		}
		public function Load(file:String):void
		{
			
			
			mapFile = TtgLib.ChangeFileExt(file, "xml");
			
			if (iniMap)
			{
				loadIni.Load(mapFile);
				loadIni.addEventListener(Event.COMPLETE, onLoadIni);
				
			}
			else
			{
				loadurl.load(new URLRequest(mapFile));
				loadurl.addEventListener(Event.COMPLETE,onLoadxml);
			}
			// 打开障碍
			mapObs.Load(file);
		}
		public function MoveTo(X:int, Y:int):void
		{
			MapX = X;
			MapY = Y;
			
			if (MapX > Width - MainDraw.CanvasWidth)
				MapX = Width - MainDraw.CanvasWidth;// 结果可能为负值
			if (MapX < 0)
				MapX = 0;
			if (MapY > Height - MainDraw.CanvasHeight)
				MapY = Height - MainDraw.CanvasHeight;// 结果可能为负值
			if (MapY < 0)
				MapY = 0;	
		}
		private function onLoadxml(event:Event):void
		{
			
			var xml:XML=XML(loadurl.data);
			Width = xml.Width;
			Height = xml.Height;
			//trace(xml.pic[0].url[0]);
			TileWidth = int(xml.Width) / TileSize + (int(xml.Width) % TileSize == 0 ? 0 :1);
			TileHeight = int(xml.Height) / TileSize + (int(xml.Height) % TileSize == 0 ? 0 :1);
			//trace(Width)
			//trace(Height)
		}	
		private function onLoadIni(event:Event):void
		{
			Width = loadIni.GetValue("Init", "Width");
			Height = loadIni.GetValue("Init", "Height");

			TileWidth = int(Width) / TileSize + (int(Width) % TileSize == 0 ? 0 :1);
			TileHeight = int(Height) / TileSize + (int(Height) % TileSize == 0 ? 0 :1);
			
			mapObs.Init(Width, Height);
			//GameDemo.log.text=	Width +","	+Height	;
		}
		public function Draw():void
		{
			var url:String;
			var loadNum:int = 0;
			var loadMax:int = 0;
			var mapPath:String = TtgLib.GetFilePath(mapFile);
			if (OldX != MapX || OldY != MapY)
			{
				for (var i:int = 0; i < MainDraw.CanvasHeight / TileSize + 1; i++)
				{
					for (var j:int = 0; j < MainDraw.CanvasWidth / TileSize + 1; j++)
					{
						var tilex:int = j + MapX / TileSize;
						var tiley:int = i + MapY / TileSize;
						if (tilex < 0 || tiley < 0 || tilex >= TileWidth || tiley >= TileHeight)
							return;
						loadMax++;
						var tile:int = (tiley) * TileWidth + (tilex); 
						url = printf("%s\\地表\\%04d.jpg", mapPath, tile);
						url = url.replace(/\\/g,"/"); //全局\,替换为/
						//GameDemo.log.text=	url	;	
						//trace (url);
						var bd:BitmapData = resPool.getResource(url);
						if (bd != null)
						{
							if (MainDraw.GetDrawBuf())
								MainDraw.GetDrawBuf().bitmapData.copyPixels(bd ,new Rectangle(0, 0, bd.width, bd.height), 
								new Point(tilex * TileSize - MapX, tiley * TileSize - MapY));
							loadNum++;
						}
						else if (Canload == true)
						{
							loadjpg.load(new URLRequest(url));
							loadjpg.contentLoaderInfo.addEventListener(Event.COMPLETE,Loadjpg);
							Canload = false;
						}
					}
				}
				if (loadNum == loadMax)
				{
					OldX = MapX;
					OldY = MapY;
				}
			}
		}
		private function Loadjpg(event:Event):void
		{
			var img:Bitmap = loadjpg.content as Bitmap;
			//var bd:BitmapData = new BitmapData(img.width, img.height, false);
			//bd.draw(img);
			var bd:BitmapData = img.bitmapData;
			//trace (loadjpg.contentLoaderInfo.url);
			//trace (loadjpg.contentLoaderInfo.loaderURL);
			var temp:String = loadjpg.contentLoaderInfo.url;
			var of:int = temp.search("asset");
			var out:String = temp.substr(of);
			out = out.replace(/\\/g,"/"); //全局\,替换为/
			resPool.addResource(out, bd);
			//GameDemo.log.text=	out	;	
			//trace (out);
			Canload = true;
		}	
	}
}
