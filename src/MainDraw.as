package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.system.Capabilities;	
	
	//const g_backDraw:MainDraw;
	
	public class MainDraw extends Sprite
	{
		private static var bm:BitmapData;
		private static var backbitmap:Bitmap;
		// 桌面大小
		public static var WindowsWidth:uint = 0;
		public static var WindowsHeight:uint = 0;
		// 画布大小
		public static var CanvasWidth:uint = 0;
		public static var CanvasHeight:uint = 0;
		
		public function MainDraw()
		{
			// 获取屏幕分辨率
			bm = new BitmapData(flash.system.Capabilities.screenResolutionX, 
				flash.system.Capabilities.screenResolutionY, true, 0x0);
			backbitmap = new Bitmap(bm);
			addChild(backbitmap);
			WindowsWidth = bm.width;
			WindowsHeight = bm.height;
			//g_backDraw = this;
		}
		public static function GetDrawBuf():Bitmap
		{
			return backbitmap;
		}
		public static function DrawBuf():void
		{
		}
	}
}
