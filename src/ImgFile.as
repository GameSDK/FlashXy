package
{
	//import MainDraw.*;
	//import ResourcePool.*;
	
	import com.core.printf;
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.*;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	
	//import xmltest.*;
	
	public class ImgFile extends Sprite
	{
		private var loadurl:URLLoader = new URLLoader();
		private var loadimg:Loader = new Loader();
		//private var ImgTex:BitmapData = null;
		public var imgBitmap:Bitmap = new Bitmap();
		public var Width:int;
		public var Height:int;
		public var CenterX:int;
		public var CenterY:int;
		private var Frames:int;
		private var Colors:int;
		private var FileName:String;
		private var Canload:Boolean = true;
		private var LoadFrame:int = 0;
		private var FrameNum:int = 0;
		private var ImgLen:Array = new Array();
		private var ImgBuf:Array = new Array();// 帧缓冲
		private var ImgIndex:Array = new Array();// 帧索引		
		private var OffsetX:Array = new Array();
		private var OffsetY:Array = new Array();
		private var LoadNum:int = 0;
		private var isPNGFile:Boolean = false;		
		
		public var addBitMap:Boolean = false;
		public var isLoad:Boolean = false	// load 结束
		public var beginLoad:Boolean = false;	//load 开始
		
		
		public var resPool:ResourcePool=new ResourcePool();		
	
		public function ImgFile()
		{
			//var ImgTex:BitmapData = new BitmapData(100, 100, true, 0xff);
			//ImgTex.draw(imgBitmap);			
			addChild(imgBitmap);		
		}
		public function Load(file:String):void
		{
			resPool.clear();
			if (imgBitmap.bitmapData != null)
				imgBitmap.bitmapData.dispose();
			
			FileName = file;
			LoadFrame = 0;
			isLoad = false;
			isPNGFile = false;
			beginLoad = true;
			loadurl.dataFormat = "binary";
			loadurl.load(new URLRequest(file));
			loadurl.addEventListener(Event.COMPLETE,onLoadxml);
			
			loadimg.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadimg);
			
		}
		public function Draw(X:int, Y:int, Frame:int):void
		{
			//var url:String = printf("%s_%d",FileName, Frame);		
			var url:String = FileName + "_" + Frame;		
			var bd:BitmapData = resPool.getResource(url);
			if (bd != null)
			{
				//if (MainDraw.GetDrawBuf())// && LoadNum == Frames)
				//	MainDraw.GetDrawBuf().bitmapData.copyPixels(bd ,new Rectangle(0, 0, bd.width, bd.height),
				//		new Point(X - (CenterX - OffsetX[Frame]), 
				//				Y - (CenterY - OffsetY[Frame])), null, null, true);

				imgBitmap.bitmapData = bd;
				imgBitmap.x = X - (CenterX - OffsetX[Frame]);
				imgBitmap.y = Y - (CenterY - OffsetY[Frame]);

			}		
			else if (Canload == true && isPNGFile == true)
			{
				
				//url = printf("%s_%d",FileName, 0);			
				url = FileName + "_" + Frame;					
				bd = resPool.getResource(url);
				if (bd != null)				
				{
					imgBitmap.bitmapData = bd.clone();
					imgBitmap.x = X - (CenterX - OffsetX[0]);
					imgBitmap.y = Y - (CenterY - OffsetY[0]);					
				}
				
				//if (ImgBuf[Frame] != null)
				//{
					//LoadFrame = Frame;
					//loadimg.loadBytes(ImgBuf[LoadFrame]);

					//loadimg.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadimg);
				//	Canload = false;
				//}
			}
		}
		/** 绘制到引用的Bitmap中*/
		public function DrawBitMap(X:int, Y:int, Frame:int, img:Bitmap):Boolean
		{
			var url:String = FileName + "_" + Frame;		
			var bd:BitmapData = resPool.getResource(url);
			if (bd != null)
			{
				img.bitmapData = bd;
				img.x = X - (CenterX - OffsetX[Frame]);
				img.y = Y - (CenterY - OffsetY[Frame]);
				return true;
				
			}	
			img.bitmapData = null;
			return false;
		}
					
		private function onLoadxml(event:Event):void
		{
			var head:ByteArray = new ByteArray();
			var vertex:ByteArray = new ByteArray();
			//var imgframe:ByteArray = new ByteArray();
			var buf:ByteArray = loadurl.data;
			var Offset:ByteArray = new ByteArray();
			
			
			// 低字位在前
			buf.endian=Endian.LITTLE_ENDIAN;
			Offset.endian = Endian.LITTLE_ENDIAN;
			//buf.position  = 0;
			buf.readBytes(head, 0, 4);
			//trace (head);
			if (head.toString().indexOf("DDI") != -1)
			{
				isPNGFile = true;
			}
			else if (head.toString().indexOf("SPR") == -1 &&
				head.toString().indexOf("IMG") == -1)
			{
				loadimg.loadBytes(loadurl.data as ByteArray);
				loadimg.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadimg);
				Frames = 1;
				OffsetX[0] = 0;
				OffsetY[0] = 0;
				Canload = false;				
				return;
			}
			//buf.position = 0;

			Width   = buf.readShort();
			Height  = buf.readShort();
			CenterX = buf.readShort();
			CenterY = buf.readShort();
			Frames  = buf.readShort();
			Colors  = buf.readShort();
			buf.readBytes(vertex, 0, 16);
			buf.readBytes(Offset, 0, Frames * 8);
			
			//var Offset:uint = buf.readUnsignedInt();
			//var Length:uint = buf.readUnsignedInt();
			//var Length:uint = 0;
			var FrameWidth:uint = 0;
			var FrameHeight:uint = 0;
			//var OffsetX:uint = 0;
			//var OffsetY:uint = 0;

			for (var i:int = 0; i < Frames; i++)
			{	
				Offset.position += 4;
				ImgLen[i] = Offset.readUnsignedInt();	
				
				FrameWidth   = buf.readShort();
				FrameHeight  = buf.readShort();
				OffsetX[i]   = buf.readShort();
				OffsetY[i]   = buf.readShort();
				var PNGimg:ByteArray = new ByteArray();		
				buf.readBytes(PNGimg, 0, ImgLen[i] - 8);	

				ImgBuf[i] = PNGimg;
				//ImgBuf.push(PNGimg);
				//ImgIndex.push(FrameNum++);
				//trace (FrameWidth +","+FrameHeight);

			}
			
			LoadFrame = 0;
			loadimg.loadBytes(ImgBuf[LoadFrame]);			
						
		}	
		private function onLoadimg(event:Event):void
		{

			var img:Bitmap = loadimg.content as Bitmap;
			//ImgTex = new BitmapData(MainDraw.CanvasWidth, MainDraw.CanvasHeight, true, 0x0);
			//ImgTex.draw(img);
			//ImgTex = img.bitmapData;
			//addChild(img);	
			if (!isPNGFile)
			{
				Width = img.width;
				Height = img.height;				
			}
			//if (addBitMap)
			//{
				//if (MainDraw.CanvasWidth > 0 && MainDraw.CanvasHeight > 0)
				//{
				//	this.scaleX = MainDraw.CanvasWidth / img.width;
				//	this.scaleY = MainDraw.CanvasHeight / img.height;
				//}
			//}

			loadimg.removeEventListener(Event.COMPLETE,onLoadimg);			
			var bd:BitmapData = img.bitmapData;
			// 读第一帧时
			if (LoadFrame == 0)
				imgBitmap.bitmapData = bd;
			//var sw:Number = MainDraw.CanvasWidth / img.width;
			//var sh:Number = MainDraw.CanvasHeight / img.height;
			
			//ImgTex.draw( img , new Matrix(sw,0,0,sh,0,0) );
			
			var out:String = FileName + "_" + LoadFrame;
			resPool.addResource(out,bd);		
			//trace(out);
			Canload = true;
			LoadNum++;	
			
			LoadFrame++;			
			if (LoadFrame < Frames)
			{
				loadimg.loadBytes(ImgBuf[LoadFrame]);
				loadimg.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadimg);
								
			}
			else
			{
				isLoad = true;
				dispatchEvent(new Event(Event.COMPLETE));					
			}
		}		
		public function GetFrame():int
		{
			return Frames;
		}
		public function AddBitMap():void
		{
			if (imgBitmap)
				addChild(imgBitmap);
	
		}
		public function GetAlpha(X:int, Y:int, Frame:int, img:Bitmap):uint
		{
			var alphaValue:uint = 0;
			if (img && img.bitmapData)
			{
				alphaValue = img.bitmapData.getPixel32(
				X + CenterX - OffsetX[Frame], 
				Y + CenterY - OffsetY[Frame]) >> 24 & 0xFF;
			}
			return alphaValue;
		}
	}
}