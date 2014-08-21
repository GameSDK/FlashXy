package lib
{
	
	import lib.AutoPath.Astar;
	
	import flash.geom.Point;

	public class MapPath
	{
		public var m_LastBeginX:int = 0;
		public var m_LastBeginY:int = 0;
		
		public var m_LastEndX:int = 0;
		public var m_LastEndY:int = 0;
		
		public var m_Astar:Astar = null;
		
		public function MapPath()
		{
			m_Astar = new Astar(5000,GetMapNode);
		}
		public function CheckPath(beginx:int, beginy:int, endx:int, endy:int):Boolean
		{
			if(m_LastBeginX == beginx)
				if(m_LastBeginY == beginy)
					if(m_LastEndX == endx)
						if(m_LastEndY == endy)
						{
							//trace("相同的起点和终点");
							return true;
						}
			return (GetMapNode(endx,endy) == false);
		}
		public function FindPath(beginx:int, beginy:int, endx:int, endy:int, bCollition:Boolean = true ):Array
		{
			if(CheckPath(beginx, beginy, endx, endy))
				return null;
							
			m_LastBeginX = beginx;
			m_LastBeginY = beginy;
			
			m_LastEndX = endx;
			m_LastEndY = endy;
		
			var path:Array = null;
			if(m_Astar)
			{
				path = m_Astar.FindPath(beginx, beginy, endx, endy, bCollition);
			}			
			
			return path;
		}
		private function GetMapNode(ix:int,iy:int):Boolean
		{
			return (Map.mapObs.GetObst(ix * 64, iy * 32) != MapObs.MAP_OBST);
		}
	}

}