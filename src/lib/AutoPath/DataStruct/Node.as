package lib.AutoPath.DataStruct
{
	import flash.geom.Point;
	
	public class Node extends Point
	{
		public function Node():void
		{
			Reset();
		}
		
		public function Reset():void
		{
			F = G = H = x = y = 0;
			pNode = null;
			bUsed = false;
		}
		
		public function SetUsed(used:Boolean):void
		{
			bUsed = used;
		}
		
		public function GetUsed():Boolean
		{
			return bUsed;
		}
		
		public function Refresh():void
		{
			F = G+H;
		}
		
		public function GetF():int
		{
			return F;
		}
		
		public function SetG(g:int):void
		{
			G = g;
			Refresh();
		}
		
		public function SetH(h:int):void
		{
			H = h;
			Refresh();
		}
		
		public function GetG():int
		{
			return G;
		}
		
		public function GetH():int
		{
			return H;
		}
		
		public function Set(posx:int,posy:int):void
		{
			x = posx;
			y = posy;
		}
		
		
		private var F:int;//F 是从起点经过该点到终点的总路程
		private var G:int;//G 为起点到该点的“已走路程”
		private var H:int;//H 为该点到终点的“预计路程”。
		
		public var pNode:Node;
		
		private var bUsed:Boolean;
	}
}
