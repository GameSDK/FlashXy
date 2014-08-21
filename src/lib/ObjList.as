package lib
{
	import flash.display.Sprite;

	public class ObjList extends ResourcePool
	{
		private var singleton : ObjList = null;	
		
		public function ObjList()
		{
			super();			
		}
		
		public function getInstance() : ObjList 
		{    
			if ( singleton == null )            
				singleton = new ObjList(  );    
			return singleton;    
		}	
		public function Free():void
		{
			for (var key:String in pool)
			{
				getResource(key).Free();
			}	
			this.clear();
		}
		public function Init():void
		{
			
		}
		public function OnTimer():void
		{
			for (var key:String in pool)
			{
				var obj:Obj = getResource(key);
				obj.NextFrame();
			}			
		}
		public function Draw():void
		{
			for (var key:String in pool)
			{
				getResource(key).Draw();
			}			
		}
		public function AddObj(str:String,spr:Sprite):void
		{
			var obj:Obj = new Obj();
			obj.LoadImg(str);
			obj.sx = 1000 + Math.random() * 800;
			obj.sy = 900 + Math.random() * 400;
			obj.dir = randRange(0, 7);
			obj.dirNum = 8;
			obj.dirFrm = 10;	
			obj.InsertObj(spr);
			//spr.addChild(obj);
			addResource(obj.name, obj);
			
		}
		public function GetObj(X:int, Y:int):*
		{
			for (var key:String in pool)
			{
				var obj:Obj = getResource(key);
				//if (Math.abs(obj.sx - X) < 20 && Math.abs(obj.sy - Y) < 20)
				if (obj.PetInImg(X, Y))
					return obj;
			}	
			return null;
		}		
		protected function randRange(min:Number, max:Number):Number
		{
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}
	}
}