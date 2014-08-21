package ui
{
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class UiSmallMap extends UiNode
	{
		private var gameimg:ImgFile = new ImgFile();
		private var point:ImgFile = new ImgFile();
		private var m_X:int = 0;
		private var m_Y:int = 0;
		private var m_Width:int = 0;
		private var m_Height:int = 0;
		private var m_MapX:int = 0;// 窗口原点的地图坐标
		private var m_MapY:int = 0;// 窗口原点的地图坐标
		private var m_nBitmapW:int = 0;// 图片文件的宽度（象素为单位）
		private var m_nBitmapH:int = 0;// 图片文件的高度（象素为单位）
		private var m_nSmallMapW:int = 160;// 小地图的宽度
		private var m_nSmallMapH:int = 120;// 小地图的高度
		private var m_State:int = 0;
		private var m_SearchPointVisible:Boolean = false;
		private var m_FindX:int = -1;
		private var m_FindY:int = -1;
		
		
		public function UiSmallMap()
		{
			super();
			addChild(gameimg);				
			addChild(point);				
			point.Load("asset/ui/圆点.png");			
		}
		
		public function Load(file:String):void
		{
			
			var mapFile:String = TtgLib.ChangeFileExt(file, "jpg");
			
			gameimg.Load(mapFile);			
			gameimg.addEventListener(Event.COMPLETE, onLoad);			

			
		}
		// 移动小地图跟随主角
		public function LocateSpc():void
		{
			var Width:int = Map.Width;
			var Height:int = Map.Height;
			if (Width && Height)
				Goto(GameDemo.player.sx * m_nBitmapW / Width - m_nSmallMapW / 2,
					GameDemo.player.sy * m_nBitmapH / Height - m_nSmallMapH / 2);
		}		
		// 鼠标右键移动小地图
		public function  Move(nX:int, nY:int):void
		{
			nX += m_MapX;
			nY += m_MapY;
			Goto(nX, nY);
		}
		// 鼠标右键移动小地图
		public function  Goto(nX:int, nY:int):void
		{
			if (!gameimg.isLoad)
				return;
			m_MapX = nX;
			m_MapY = nY;
			if (m_MapX > m_nBitmapW - m_nSmallMapW)
				m_MapX = m_nBitmapW - m_nSmallMapW;// 结果可能为负值
			if (m_MapX < 0)
				m_MapX = 0;
			if (m_MapY > m_nBitmapH - m_nSmallMapH)
				m_MapY = m_nBitmapH - m_nSmallMapH;// 结果可能为负值
			if (m_MapY < 0)
				m_MapY = 0;
		}
		public function Draw():void
		{
			DrawMap();
			DrawPosition();
			LocateSpc();			
		}
		public function DrawMap():void
		{
			var H:int = m_nSmallMapH + m_MapY;
			if (H > m_nBitmapH)
				H = m_nBitmapH;
			
			var Rect:Rectangle = new Rectangle();
			
			Rect.left = m_MapX;// + GpCanvas->m_nWidth - m_nSmallMapW;
			Rect.top = m_MapY;// + m_Y;
			Rect.right = m_nBitmapW;
			Rect.bottom = H;
			
			gameimg.imgBitmap.scrollRect = Rect;
			
		}
		public function DrawPosition():void
		{
			// 绘制主角位置
			DrawPoint(GameDemo.player.sx, GameDemo.player.sy, 0);
			
		}
		// 绘制角色小圆点
		public function DrawPoint(X:int, Y:int, Color:int):void
		{
			var Width:int = Map.Width;
			var Height:int = Map.Height;
			var Frame:int = Color;
			if (Width && Height)
			{
				X = X * m_nBitmapW / Width;
				Y = Y * m_nBitmapH / Height;
				if (X > m_MapX && Y > m_MapY && X < m_MapX + m_nSmallMapW && Y < m_MapY + m_nSmallMapH)
					point.Draw(-m_MapX + X + MainDraw.CanvasWidth - m_nSmallMapW - 2, 
						-m_MapY + Y + m_Y - 2, Frame);
					//m_Point.DrawAlpha(-m_MapX + X + GpCanvas->m_nWidth - m_nSmallMapW - 2, -m_MapY + Y + m_Y - 2, Frame, 0);
			}
		}
		
		private function onLoad(event:Event):void
		{
			m_nBitmapW = gameimg.Width;
			m_nBitmapH = gameimg.Height;
			Resize();
		}		
		override public function Resize():void
		{
			gameimg.x = MainDraw.CanvasWidth - m_nSmallMapW;
			gameimg.y = m_Y;
			
		}		
	}
}