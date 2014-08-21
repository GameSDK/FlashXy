package lib.AutoPath.DataStruct
{	
	public class BinHeap
	{
		private var NodeList:Array;
		public function BinHeap():void
		{
			NodeList = [];
		}
		
		public function Init():void
		{
			var i:int = 0;
			var whilelen:int = NodeList.length;
			while(i < whilelen)
			{
				var node:Node = NodeList[i];
				if(node)
				{
					node.Reset();
				}
				i++;
			}
			NodeList.splice(0,whilelen);
			NodeList.push(null);
		}
		
		public function push(node:Node):void
		{
			NodeList.push(node);
			var i:int =	NodeList.length-1;
			var j:int =	i>>1;//j是i上层
			if(j > 0)
			{
				while(i>=1&& j > 0)
				{
					var nodei:Node = NodeList[i];
					var nodej:Node = NodeList[j];
					
					if(nodej.GetF() > nodei.GetF())
					{
						Swap(i,j);
					}
					else if(nodej.GetF() == nodei.GetF())
					{
						if(nodej.GetH() > nodei.GetH())
						{
							Swap(i,j);
						}
						else if(nodej.GetH() == nodei.GetH())
						{
							if(nodej.GetG() > nodei.GetG())
							{
								Swap(i,j);
							}
						}
					}
					i=j;
					j=i>>1;
				}
			}
		}
		
		private function Swap(i:int,j:int):void
		{
			var swap:Node = null;
			swap = NodeList[i];
			NodeList[i] =NodeList[j];
			NodeList[j] = swap;
		}
		
		public function Search(x:int,y:int):int
		{
			var i:int = 1;
			var j:int = NodeList.length-1;
			while(i<=j)
			{
				var nodei:Node = NodeList[i];
				if(x == nodei.x && y == nodei.y)
				{
					//printf("in list\n");
					return	i;
				}
				
				var nodej:Node = NodeList[j];
				if(x == nodej.x && y == nodej.y)
				{
					//printf("in list\n");
					return	j;
				}
				++i;
				--j;
			}
			//printf("not in list\n");
			return -1;
		}
		
		public function GetRoot():Node
		{			
			var node:Node = null;
			if(NodeList.length > 1)
			{
				node = NodeList[1];
			}
			else
				node = NodeList[0];
			return node;
		}
		
		public function Get(idx:int):Node
		{
			return NodeList[idx];
		}
		public function GetSize():int
		{
			return NodeList.length-1;
		}
		public function Empty():Boolean
		{
			if(NodeList.length<=1)
				return true;
			return false;
		}
		
		public function Modify(idx:int,a:Node):int
		{
			NodeList[idx] = a;
			var i:int = idx;
			var j:int =i>>1;
			if(j <= 0)
				return -1;
			while(i>=1)
			{
				if(j <= 0)
					break;
				
				var nodei:Node = NodeList[i];
				var nodej:Node = NodeList[j];
					
				if(nodej.GetF() > nodei.GetF())
				{
					Swap(i,j);
				}
				else if(nodej.GetF() == nodei.GetF())
				{
					if(nodej.GetH() > nodei.GetH())
					{
						Swap(i,j);
					}
					else if(nodej.GetH() == nodei.GetH())
					{
						if(nodej.GetG() > nodei.GetG())
						{
							Swap(i,j);
						}
					}
				}
				i=j;
				j=i>>1;
			}
			var dir:int;
			while(i<=GetSize())
			{
				j = i*2;
				if(j<=GetSize())
				{
					var curnode:Node = NodeList[i];
					var lchild:Node = NodeList[j];
					var rchild:Node = NodeList[j+1];
					dir = CompareNode(lchild,rchild);
					if(dir == 0)//lchild小
					{
						dir = CompareNode(curnode,lchild);
						switch(dir)
						{
						case 0://curnode小
							{
								break;
								//比小的还小，就不比较了
							}break;
						case 1://lchild小
							{
								dir = 1;
							}break;
						}
					}else if(dir == 1)//rchild小
					{
						dir = CompareNode(curnode,rchild);
						switch(dir)
						{
						case 0://curnode小
							{
								break;
							}break;
						case 1://rchild小
							{
								dir = 0;
							}break;
						}
					}else
					{
						return 0;
					}
					
					Swap(i,j+dir);
					i = j + dir;
				}
				else
				{
					break;
				}
			}
			return i;
		}
		
		public function CompareNode(node1:Node,node2:Node):int//返回值：-1:错误；0:node1小；1:node2小
		{
			if(node1 == null || node2 == null )
			{
				return -1;
			}
			if(node1.GetF() > node2.GetF())
			{
				return 1;
			}
			else if(node1.GetF() == node2.GetF())
			{
				if(node1.GetH() > node2.GetH())
				{
					return 1;
				}
				else if(node1.GetH() == node2.GetH())
				{
					if(node1.GetG() > node2.GetG())
					{
						return 1;
					}
				}
			}
			return 0;
		}
		
		public function Delete(a:Node):void
		{
			var idx:int = Search(a.x,a.y);
			if(idx <=0)
				return;
			
			Swap(idx,NodeList.length-1);
			
			NodeList.pop();
			
			var dir:int;
			var i:int =idx;
			var j:int;
			while(i<=GetSize())
			{
				j = i<<1;//j在下层，i在上层,向叶子处沉底
				if(j<=GetSize()&& j+1<=GetSize())
				{
					var curnode:Node = NodeList[i];
					var lchild:Node = NodeList[j];
					var rchild:Node = NodeList[j+1];
					dir = CompareNode(lchild,rchild);
					if(dir == 0)//lchild小
					{
						dir = CompareNode(curnode,lchild);
						switch(dir)
						{
						case 0://curnode小
							{
								break;
								//比小的还小，就不比较了
							}break;
						case 1://lchild小
							{
								dir = 1;
							}break;
						}
					}else if(dir == 1)//rchild小
					{
						dir = CompareNode(curnode,rchild);
						switch(dir)
						{
						case 0://curnode小
							{
								break;
							}break;
						case 1://rchild小
							{
								dir = 0;
							}break;
						}
					}else
					{
						return;
					}
					
					Swap(i,j+dir);
					
					i = j + dir;
				}
				else
				{
					break;
				}
			}
		}
		
		public function DeleteRoot():void
		{
			var a:Node = GetRoot();
			Delete(a);
		}
		
	}
}