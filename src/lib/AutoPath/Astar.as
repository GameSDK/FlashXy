package lib.AutoPath
{
	import lib.AutoPath.DataStruct.BinHeap;
	import lib.AutoPath.DataStruct.Node;
	
	import flash.geom.Point;
	
	public class Astar
	{

		public static const _up:int 		= 0;
		public static const _left:int 		= 1;
		public static const _down:int 		= 2;
		public static const _right:int 		= 3;
		public static const _upright:int 	= 4;
		public static const _downright:int 	= 5;
		public static const _downleft:int 	= 6;
		public static const _upleft:int 	= 7;
		public static const _other:int 		= 8;
		
		public static const cost2468:int 	= 8;
		public static const cost1379:int 	= 10;

		private var NodePool:Array;
		private var OpenList:BinHeap;
		private var CloseList:BinHeap;
		
		private var m_pCurValue:Node;//当前代价
		private var m_pBegin:Node;
		private var m_pEnd:Node;
		
		private var m_bUsing:Boolean = false;
		
		private var m_GetMapDataFunc:Function = null;
		
		private static function abs(data:int):int
		{
			return (data>=0?data:-1*data);
		}
		
		public function Astar(size:int,mapdata:Function = null):void
		{
			NodePool = [];
			var i:int = 0;
			while(i < size)
			{
				NodePool.push(new Node);
				i++;
			}
			m_GetMapDataFunc = mapdata;
			OpenList = new BinHeap;
			CloseList = new BinHeap;
		}
		
		private function Init():void
		{
			var forlen:int = NodePool.length;
			var i:int = 0;
			while(i<forlen)//Init4000
			{
				var pnode:Node = NodePool[i];
				pnode.Reset();
				i++;
			}
			OpenList.Init();
			CloseList.Init();
		}
		
		public function FindPath(beginx:int, beginy:int, endx:int, endy:int, bCollition:Boolean = true ):Array
		{			
			if(beginx == endx && beginy == endy)
			{
				return null;
			}
		
			if(m_bUsing == true)
				return null;
			m_bUsing = true;
			Init();
		
			m_pBegin = GetFreeNode();
			m_pBegin.Set(beginx,beginy);
			m_pEnd = GetFreeNode();
			m_pEnd.Set(endx,endy);
		
			m_pCurValue = GetFGH(null,beginx,beginy,_other);	//计算当前格的代价
			//OpenList.push(m_pCurValue);				//1，把起始格添加到开启列表。
			while(OpenList.Empty() == false)		//2，重复如下的工作：
			{
				m_pCurValue = OpenList.GetRoot();	//a) 寻找开启列表中F值最低的格子。我们称它为当前格。
				
				if(m_pCurValue == null)
				{
					m_bUsing = false;
					trace("MapCollitiondata error~！");
					return null;
				}
				//PRINT_DEBUG2("root = %d,%d:",m_pCurValue->posx,m_pCurValue->posy);
				//PRINT_DEBUG3("G:%d,H:%d,F:%d\n",m_pCurValue->G,m_pCurValue->H,m_pCurValue->F);
		
				//ShowOpen();
		
				OpenList.Delete(m_pCurValue);		//b) 把它切换到关闭列表。
				if(CloseList.Search(m_pCurValue.x,m_pCurValue.y) <0)
				{
					CloseList.push(m_pCurValue);
				}
		
				//ShowClose();
		
				
				var bordlist:Array = GetBorder(m_pCurValue,bCollition);			//获得当前格周围的8个单元格
				if(bordlist.length > 0)
				{
					var forlen:int = bordlist.length;
					var i:int = 0;
					while(i<forlen)//bordlist.size()最多8
					{
						var node:Node = bordlist[i];
						if(node.x == m_pEnd.x && node.y == m_pEnd.y)
						{
							m_bUsing = false;
							return GeneratPath(node);
						}
						i++;
					}
				}
				/*else
				{
					m_bUsing = false;
					trace("MapCollitiondata error~！");
					return null;
				}*/
			}
			m_bUsing = false;
			
			return null;
		}
		private function GeneratPath(node:Node):Array
		{
			var path:Array = [];
			while(node)
			{
				//trace(node.posx+","+node.y);
				var pos:Point = new Point(node.x,node.y);
				path.push(pos);
				node = node.pNode;
			}
			return path;
		}
		private var pos1:Point = new Point;
		private var pos2:Point = new Point;
		private var pos3:Point = new Point;//正方向：pos1为要探测的单元格；斜方向：pos3为要探测单元格，pos1\pos2为左右2格
		private function GetBorder(pnode:Node, bCollition:Boolean):Array//(当前格，列表（存放周围4格）)
		{
			var bordlist:Array = [];
			var i:int = 0;
			
			while(i<_other)//GetBorder8
			{
				var bordernode:Node = null;
				var bFind:Boolean = false;
				
				switch(i)
				{
				case _up:
					{
						pos1.x = pnode.x;
						pos1.y = pnode.y-1;
						if (bCollition)
						{
							if(GetMapNode(pos1.x,pos1.y))//返回true，该点可移动;返回false,未找到或不可移动
							{
								bordernode = GetFGH(pnode,pos1.x,pos1.y,i);
							}
						} 
						else
						{
							bordernode = GetFGH(pnode,pos1.x,pos1.y,i);
						}
						
						if(m_pEnd.x == pos1.x && m_pEnd.y == pos1.y)
						{
							bFind = true;
							break;
						}
					}break;
				case _left:
					{
						pos1.x = pnode.x-1;
						pos1.y = pnode.y;
						if (bCollition)
						{
							if(GetMapNode(pos1.x,pos1.y))//返回true，存在地图数据或者地图数据为找到
							{
								bordernode = GetFGH(pnode,pos1.x,pos1.y,i);
								break;
							}
						}
						else
						{
							bordernode = GetFGH(pnode,pos1.x,pos1.y,i);
						}
						if(m_pEnd.x == pos1.x && m_pEnd.y == pos1.y)
						{
							bFind = true;
							break;
						}
					}break;
				case _down:
					{
						pos1.x = pnode.x;
						pos1.y = pnode.y+1;
						if (bCollition)
						{
							if(GetMapNode(pos1.x,pos1.y))//返回true，存在地图数据或者地图数据为找到
							{
								bordernode = GetFGH(pnode,pos1.x,pos1.y,i);
								break;
							}
						}
						else
						{
							bordernode = GetFGH(pnode,pos1.x,pos1.y,i);
						}
						if(m_pEnd.x == pos1.x && m_pEnd.y == pos1.y)
						{
							bFind = true;
							break;
						}
					}break;
				case _right:
					{
						pos1.x = pnode.x+1;
						pos1.y = pnode.y;
						if (bCollition)
						{
							if(GetMapNode(pos1.x,pos1.y))//返回true，存在地图数据或者地图数据为找到
							{
								bordernode = GetFGH(pnode,pos1.x,pos1.y,i);
								break;
							}
						}
						else
						{
							bordernode = GetFGH(pnode,pos1.x,pos1.y,i);
						}
						if(m_pEnd.x == pos1.x && m_pEnd.y == pos1.y)
						{
							bFind = true;
							break;
						}
					}break;
				case _upright:
					{
						pos1.x = pnode.x;
						pos1.y = pnode.y-1;
		
						pos2.x = pnode.x+1;
						pos2.y = pnode.y;
		
						pos3.x = pnode.x+1;
						pos3.y = pnode.y-1;
						if (bCollition)
						{
							//if(GetMapNode(pos1.x,pos1.y)
							//	&& GetMapNode(pos2.x,pos2.y))
							//{
								if(GetMapNode(pos3.x,pos3.y))//返回true，存在地图数据或者地图数据为找到
								{
										bordernode = GetFGH(pnode,pos3.x,pos3.y,i);
										break;
								}
							//}
						}
						else
						{
							bordernode = GetFGH(pnode,pos3.x,pos3.y,i);
						}
						if(m_pEnd.x == pos3.x && m_pEnd.y == pos3.y)
						{
							bFind = true;
							break;
						}
					}break;
				case _downright:
					{
						pos1.x = pnode.x;
						pos1.y = pnode.y+1;
						pos2.x = pnode.x+1;
						pos2.y = pnode.y;
						pos3.x = pnode.x+1;
						pos3.y = pnode.y+1;
						if (bCollition)
						{
							//if(GetMapNode(pnode.x,pnode.y+1)
							//	&& GetMapNode(pnode.x+1,pnode.y))
							//{
								if(GetMapNode(pos3.x,pos3.y))//返回true，存在地图数据或者地图数据为找到
								{
									bordernode = GetFGH(pnode,pos3.x,pos3.y,i);
									break;
								}
							//}
						}
						else
						{
							bordernode = GetFGH(pnode,pos3.x,pos3.y,i);
						}
						if(m_pEnd.x == pos3.x && m_pEnd.y == pos3.y)
						{
							bFind = true;
							break;
						}
					}break;
				case _downleft:
					{
						pos1.x = pnode.x;
						pos1.y = pnode.y+1;
						pos2.x = pnode.x-1;
						pos2.y = pnode.y;
						pos3.x = pnode.x-1;
						pos3.y = pnode.y+1;
						if (bCollition)
						{
							//if(GetMapNode(pnode.x,pnode.y+1)
							//	&& GetMapNode(pnode.x-1,pnode.y))
							//{
								if(GetMapNode(pos3.x,pos3.y))//返回true，存在地图数据或者地图数据为找到
								{
										bordernode = GetFGH(pnode,pos3.x,pos3.y,i);
										break;
								}
							//}
						}
						else
						{
							bordernode = GetFGH(pnode,pos3.x,pos3.y,i);
						}
						if(m_pEnd.x == pos3.x && m_pEnd.y == pos3.y)
						{
							bFind = true;
							break;
						}
					}break;
				case _upleft:
					{
						pos1.x = pnode.x;
						pos1.y = pnode.y-1;
						pos2.x = pnode.x-1;
						pos2.y = pnode.y;
						pos3.x = pnode.x-1;
						pos3.y = pnode.y-1;
						if (bCollition)
						{
							//if(GetMapNode(pnode.x,pnode.y-1)
							//	&& GetMapNode(pnode.x-1,pnode.y))
							//{
								if(GetMapNode(pos3.x,pos3.y))//返回true，存在地图数据或者地图数据为找到
								{
									bordernode = GetFGH(pnode,pos3.x,pos3.y,i);
									break;
								}
							//}
						}
						else
						{
							bordernode = GetFGH(pnode,pos3.x,pos3.y,i);
						}
						if(m_pEnd.x == pos3.x && m_pEnd.y == pos3.y)
						{
							bFind = true;
							break;
						}
					}break;
				}
				if(bordernode != null)
				{
					bordlist.push(bordernode);
					//bordernode.pnode = pnode;
					if(bordernode.pNode == null)//设置该格的父格
					{
						bordernode.pNode = pnode;
					}
					else
						//如果它已经在开启列表中，用G值为参考检查新的路径是否更好。更低的G值意味着更好的路径。
						//如果是这样，就把这一格的父节点改成当前格，并且重新计算这一格的G和F值。
						//如果你保持你的开启列表按F值排序，改变之后你可能需要重新对开启列表排序。//插入时已经保持了排序
					{
						if(pnode.GetG() < bordernode.pNode.GetG() )//把G最小的那个作为当前格
						{
							bordernode.pNode = pnode;
							ReCalcFGH(bordernode);
						}
					}
				}
				if (bFind == true)
				{
					break;
				}
				i++;
			}
			return bordlist;
		}
		/**返回true，该点可移动*/
		protected function GetMapNode(ix:int,iy:int):Boolean//返回true，该点可移动;返回false,未找到或不可移动
		{
			if(m_GetMapDataFunc != null)
			{
				return m_GetMapDataFunc(ix,iy);
			}
			return false;
		}
		
		private function GetFreeNode():Node
		{
			var i:int = 0;
			var whilelen:int = NodePool.length;
			while(i < whilelen)
			{
				var node:Node = NodePool[i];
				if(node)
				{
					if(node.GetUsed() == false)
					{
						node.SetUsed(true);
						return node;
					}
				}
				i++;
			}
			return null;
		}
		
		private function GetFGH(parentnode:Node, x:int, y:int, ndir:int):Node
		{
			var pnode:Node = null;
			var bNeadPush:Boolean = false;
			var idx:int = CloseList.Search(x,y);
			if(idx > 0)
				return null;
			
			idx = OpenList.Search(x,y);
			if(idx > 0)
			{
				pnode = OpenList.Get(idx);
			}
			else
			{
				pnode = GetFreeNode();
				if (pnode == null)
				{
					return null;
				}
				pnode.pNode = parentnode;
				bNeadPush = true;
			}
			if (pnode)
			{
				if(parentnode == null)
					ndir = _other;
				pnode.Set(x,y);
		
				switch(ndir)
				{
				case _up:
					{
						pnode.SetG(parentnode.GetG()*cost2468);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost2468);//估价函数
					}break;
				case _left:
					{
						pnode.SetG(parentnode.GetG()*cost2468);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost2468);//估价函数
					}break;
				case _down:
					{
						pnode.SetG(parentnode.GetG()*cost2468);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost2468);//估价函数
					}break;
				case _right:
					{
						pnode.SetG(parentnode.GetG()*cost2468);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost2468);//估价函数
					}break;
				case _upright:
					{
						pnode.SetG(parentnode.GetG()*cost1379);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost1379);//估价函数
					}break;
				case _downright:
					{
						pnode.SetG(parentnode.GetG()*cost1379);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost1379);//估价函数
					}break;
				case _downleft:
					{
						pnode.SetG(parentnode.GetG()*cost1379);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost1379);//估价函数
					}break;
				case _upleft:
					{
						pnode.SetG(parentnode.GetG()*cost1379);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost1379);//估价函数
					}break;
				case _other:
					{
						pnode.SetG(CalcCost(m_pBegin.x,m_pBegin.y,x,y)*cost2468);
						pnode.SetH(CalcCost(m_pEnd.x,m_pEnd.y,x,y)*cost2468);//估价函数
					}break;
				}
				if (bNeadPush)
				{
					OpenList.push(pnode);
				}
			}
			return pnode;
		}
		private function ReCalcFGH(parentnode:Node):void
		{
			if(parentnode == null)
				return;
			if(parentnode.pNode == null)
				return;
			if (parentnode.x == parentnode.pNode.x || parentnode.y == parentnode.pNode.y)
			{
				parentnode.SetG(parentnode.pNode.GetG()*cost2468);
			}else
			{
				parentnode.SetG(parentnode.pNode.GetG()*cost1379);
			}
		}
		
		private function CalcCost(x1:int,y1:int,x2:int,y2:int):int
		{
			var x:int = abs(x1-x2);
			var y:int = abs(y1-y2);
			return x*x+y*y;
		}
	}
}