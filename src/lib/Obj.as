package lib
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class Obj extends Sprite
	{
		public var TYPE_OBJ:int = 0;// 物件
		public var TYPE_ITEM:int = 1;// 物品
		public var TYPE_NPC1:int = 2// 对话NPC
		public var TYPE_NPC2:int = 3// 被动NPC
		public var TYPE_NPC3:int = 4// 主动NPC		
		public var TYPE_PET:int = 5;// 宠物
		public var TYPE_OPL:int = 6;// 玩家
		public var TYPE_PL:int = 7;// 主角
		public var TYPE_BOX:int = 8;// 宝箱
		public var TYPE_DIG:int = 9;// 采矿
		public var TYPE_GET:int = 10;// 采集
		public var TYPE_MAP:int = 11;// 地图切换
		
		public var sx:int = 0;
		public var sy:int = 0;
		public var sz:int = 0;
		public var oldX:int = 0;
		public var oldY:int = 0;
		public var type:int = 0;//类型
		public var frame:int = 0;// 当前帧数
		public var dir:int = 0;// 当前方向
		public var dirNum:int = 1;// 总方向数
		public var dirFrm:int = 1;// 方向帧数
		public var timer:int = 0;// 定时器
		public var interval:int = 2;// 帧间隔		
		public var kind:int;
		
		//protected var fileName:String = "";
		protected var imgFile:Array = new Array();
		protected var imgBitmap:Array = new Array();
		protected var gameImg:ImgFile = null;//new ImgFile();
		
		//protected var imgBitmap:Bitmap = new Bitmap();		
		
		public function Obj()
		{
			super();
			type = TYPE_OBJ;
			var img:Bitmap = new Bitmap();		
			imgBitmap[0] = img;
			addChild(imgBitmap[0]);
		}
		public function Free():void
		{
			if (this.parent)
			{
				this.parent.removeChild(this);
			}			
			for (var i:int = 0; i < 4 ;i++)
			{
				if (imgBitmap[i] != null)
				{
					if (imgBitmap[i].bitmapData != null)
					{
						//imgBitmap[i].bitmapData.dispose();
						//imgBitmap[i].bitmapData = null;
					}
						
						
				}
				
			}
			//while (this.numChildren > 0)
			//{
			//	var img:DisplayObject = this.getChildAt(0);
			//	if (img != null && img is Bitmap && img.bitmapData != null)
			//		img.bitmapData.dispose();
			//	this.removeChildAt(0);			
			//}
		}
		public function Init():void
		{
			
		}
		public function LoadImg(file:String):void
		{
			//fileName = file;
			imgFile[0] = file;
			ImgList.getInstance().LoadRes(file);
			//gameImg.Load(file);		
			//if (resPool.getResource(fileName) == null)
			//	resPool.addResource(fileName, gameImg);
		}
		public function NextFrame():Boolean
		{
			if (timer++ > interval)
			{
				timer = 0;
				frame++;
				if (frame >= dirFrm)
					frame = 0;
				return true;
			}
			return false;
		}		
		public function Draw():void
		{
			gameImg = ImgList.getInstance().GetRes(imgFile[0]);
			if (gameImg)
			{
				dirFrm = gameImg.GetFrame() / dirNum;
				var Frame:int = frame + dir * dirFrm;				
				gameImg.DrawBitMap(sx - Map.MapX, sy - Map.MapY, Frame, imgBitmap[0]);
				//	gameImg.DrawBitMap(sx - Map.MapX, sy - Map.MapY, 0, imgBitmap[0]);
			}
		}
		public function InsertObj(spr:Sprite):void
		{
			var find:Boolean = false;
			if (this.parent)
			{
				//trace("原始"+this.parent.getChildIndex(this));
				this.parent.removeChild(this);
			}
			for (var j:int = 0; j< spr.numChildren; j++)
			{
				var nObj:Obj = spr.getChildAt(j) as Obj;		
				if (sy < nObj.sy && this != nObj)
				{
					spr.addChildAt(this, j);
					//trace(j);
					find = true;
					break;
				}
			}

			if (!find)
				spr.addChild(this);			
		}
		public function PetInImg(X:int, Y:int):Boolean
		{
			if (gameImg)
			{
				var Frame:int = frame + dir * dirFrm;					
				var alpha:uint = gameImg.GetAlpha(X - sx, Y - sy, Frame, imgBitmap[0]);
				if (alpha > 0)
					return true;
			}
			return false;
		}
	}
}