package lib
{
	import flash.display.Sprite;
	
	public class NpcList extends ObjList
	{

		
		public function NpcList()
		{
			super();
		}
		
		override public function OnTimer():void
		{
			for (var key:String in pool)
			{
				getResource(key).OnTimer();
			}			
		}		
		public function UpdateName():void
		{
			for (var key:String in pool)
			{
				getResource(key).UpdateName();
			}			
		}
		public function AddNpc(npc:Npc, spr:Sprite):void
		{
			npc.InsertObj(spr);			
			addResource(npc.name, npc);		
		}			
		override public function AddObj(str:String, spr:Sprite):void
		{
			var obj:Npc = new Npc();
			obj.Load("雪貂");
			//obj.LoadImg(str);
			obj.sx = 1000 + Math.random() * 900;
			obj.sy = 900 + Math.random() * 500;
			obj.dir = randRange(0, 7);
			obj.type = obj.TYPE_NPC2;
			obj.InsertObj(spr);
			obj.ChangeState();
			//spr.addChild(obj);
			addResource(obj.name, obj);
			
		}
		override public function GetObj(X:int, Y:int):*
		{
		
			for (var key:String in pool)
			{
				var obj:Npc = getResource(key);
				if (obj.state != obj.NPC_DIE  && 
					obj.PetInImg(X, Y))
				{
					return obj;*
				}
			}	
			return null;
		}		

	}
}