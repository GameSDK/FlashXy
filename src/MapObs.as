package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Endian;		
	
	public class MapObs
	{

		public 	var TileW:int = 64;// 格子宽度
		public 	var TileH:int = 32;// 格子高度
		public 	var Width:int = 0;// 宽度格子数
		public 	var Height:int = 0;// 高度格子数
		
		public 	static var MAP_OBST:int =	65535;
		public 	static var LOW_OBST:int =	65534;
		public 	static var NPC_OBST:int =	65533;
		public 	static var ITM_OBST:int =	65532;
		
		public var buf:ByteArray = new ByteArray(); 		
		public var loadurl:URLLoader = new URLLoader();
		private var Obst:Array = new Array();
		
		public function MapObs()
		{
			//buf.endian = Endian.LITTLE_ENDIAN;			
		}
		public function Init(W:int, H:int):void
		{
			Width = W / TileW;
			Height = H / TileH;
		}
		
		public function Load(file:String):void
		{
			buf.clear();
			Obst.length = 0;

			var mapFile:String = TtgLib.ChangeFileExt(file, "gif");
			
			loadurl.dataFormat = URLLoaderDataFormat.BINARY;
			loadurl.load(new URLRequest(mapFile));
			loadurl.addEventListener(Event.COMPLETE, onLoad);
			
		}		
		private function onLoad(e:Event):void
		{
			buf = loadurl.data as ByteArray;
			buf.endian = Endian.LITTLE_ENDIAN;					
			for (var i:int = 0; i < Width * Height; i++)
			{
				Obst.push(buf.readUnsignedShort());
			}			

		}	
		public function GetObst(nX:int, nY:int):uint
		{
			nX /= TileW;
			nY /= TileH;
			if (nX >= 0 && nX < Width && nY >= 0 && nY < Height)
			{
				return Obst[nX + nY * Width];
			}
			return MAP_OBST;
		}		
	}
}