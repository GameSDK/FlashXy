package lib.AutoPath
{
	public class Astar1
	{
		public function Astar1()
		{
		}
	}
}


package
{
	public class node {
		public var h:int;
		//定义行
		public var l:int;
		//定义列
		public var Father_node:node;
		//定义父节点
		public var Goal_node:node;
		//定义目标节点
		public var Start_node:node;
		//定义开始节点
		public var Father_int:int;
		//定义父节点的G值
		public function node(h:int,l:int,Father_node:node,Goal_node:node,Start_node:node) {
			this.h=h;
			//接受行
			this.l=l;
			//接受列
			this.Father_node=Father_node;
			//接受父类节点
			this.Goal_node=Goal_node;
			//接受目标节点
			this.Start_node=this.Father_node;
			//接受开启节点
			if (Father_node==null) {
				this.Father_node=this;
			}
			//如果没有则等于自己
			if (Goal_node==null) {
				this.Goal_node=this;
			}
			//如果没有则等于自己
			if (Start_node==null) {
				this.Start_node=this;
			}
			//如果没有，则等于自己(用于起点和重点)
			if (Start_node!=null) {
				Father_int=Start_node.getG();
			}
			//获得父类节点的代价
		}
		public function getH():int {
			return Math.abs(h - Goal_node.h) * 10 + Math.abs(l - Goal_node.l) * 10;
			//返回目标到当前的直线代价
		}
		public function getG():int {
			if (Math.abs(h - Start_node.h) == 1&& Math.abs(l - Start_node.l) == 1) {
				return 14+Father_int;
				//返回父节点的带价值和当前节点到开始节点值等于一路走过来的带价值
			} else {
				return Math.abs(h - Start_node.h) * 10 + Math.abs(l - Start_node.l) * 10 + Father_int;
				//同上
			}
		}
		//返回从开始节点到当前节点的移动代价
		public function getF():int {
			return getH() + getG();
		}
		//返回H+G的总值
		public function equals(me:Object):Boolean {
			if (me is node) {
				if (me.h == h && me.l == l) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		}
		//判断是否和参数里的行列相等
		public function getPath():Array {
			if (Father_node== this) {
				var ccc:Array=new Array();
				ccc=[[h, l]];
				return ccc;
			} else {
				var aa:Array = Father_node.getPath();
				var answer:Array=aa.slice(0,aa.length);
				answer[aa.length] =[h, l];
				return answer;
			}
			//递归逐个访问父亲节点的父节点的坐标，存放新的数组里
		}
	}
}





//探路器:

package
{
	public class Find {
		private var h:int;
		private var l:int;
		private var fruit:Array;
		//路径数组
		private var Start_listing:Array;
		//开启列表
		private var Stop_listing:Array;
		//关闭列表
		public var Goal_node:node;
		//目标节点
		public var Start_node:node;
		//开始节点
		public var Current_node:node;
		//当前节点
		public var Fairly_node:node;
		//比较节点
		public var About_node:node;
		//零时节点
		private var shanchu:Array;
		static public var kaishi:Boolean
		public function AIdo(h:int,l:int,hh:int,ll:int,map:Array):Array {
			shanchu=new Array();
			//初始化删除列表
			Start_listing=new Array;
			//开启列表
			Stop_listing=new Array;
			//关闭列表
			Goal_node=new node(hh,ll,null,null,null);
			//目标节点
			Start_node=new node(h,l,null,Goal_node,null);
			//开始节点
			aido(map);
			//开始寻路
			return fruit;
			//返回寻路后的结果数组
		}
		public function aido(map:Array) {
			if (shanchu.length!=0) {
				for (var t:int=0; t     shanchu[t]=null;
					trace("删除了")
					}
		}
		//如果删除列表不为空,则删除里面所有元素,等待系统回收
		shanchu=new Array();
		//初始化删除列表
		Start_listing=new Array;
		//开启列表
		Stop_listing=new Array;
		//关闭列表
		Start_listing.push(Start_node);
		//把当前节点放入开启列表
		shanchu.push(Start_node);
		//把当前节点放入删除列表
		do {
			Current_node=Start_listing[0];
			//获取开启列表的第一个元素
			for (var i:int=1; i     if (Start_listing[i].getF()      Current_node=Start_listing[i];
				}
	}
	//比较数组里的元素，如果数组里的元素的F值比当前的小，则把当前的替换成数组里的
	if (Current_node.equals(Goal_node)) {
		//trace("找到路了");
		fruit=Current_node.getPath();
		kaishi=true
		break
	}
	//是否找到路径
	Stop_listing.push(Current_node);
	//添加当前节点到关闭列表
	Start_listing.splice(Start_listing.indexOf(Current_node),1);
	//删除开始列表把当前节点从
	for (var j:int=-1; j<2; j++) {
		for (var k:int=-1; k<2; k++) {
			//遍历当前节点周围的位置
			if (Current_node.h+j==0&&Current_node.l+k==0) {
				continue;
			}
			if (Current_node.h+j>=map.length||Current_node.h-j<0) {
				continue;
			}
			if (Current_node.l+k>=map[0].length||Current_node.l-k<0) {
				continue;
			}
			//判断是否遍历到了自己，是否超出了边界,如果是，则返回出去，重新遍历
			if (bianyuan(Current_node.h+j,Current_node.l+k,Current_node.h,Current_node.l,map)&&detection_fraise(Current_node.h+j,Current_node.l+k,map)&&detection_border(Current_node.h+j,Current_node.l+k,map)&&detection_listing(Current_node.h+j,Current_node.l+k,Stop_listing)==null) {
				//如果周边的节点不在关闭列表里,是不是障碍物，斜角的周边是否有障碍物
				About_node=detection_listing(Current_node.h+j,Current_node.l+k,Start_listing);
				//判断周边的节点,传递行，列，开启列表
				//如果当前对象在开启列表里，则函数会返回空，如果不在，则会创建新的节点
				if (About_node==null) {
					//如果为空则不用多说了，像病毒一样扩散开来
					About_node=new node(Current_node.h+j,Current_node.l+k,Current_node,Goal_node,Current_node);
					//初始化节点,传递行，列，父节点(当前的节点),目标节点(上面当鼠标点击时6了一个),开始节点(游戏运行时6了一个)
					Start_listing.push(About_node);
					shanchu.push(About_node);
					//如果周边的节点为空,则在周边扩散节点,将扩散的节点放入开启列表，以备下次检测需要,也放入删除列表，待找到路径后删除删除列表里所有的节点,等待系统回收
				} else {
					var oldG:int=About_node.getG();
					//保存零时变量为开启列表里的G值
					var Father:node=About_node.Father_node;
					//保存开启列表里的父节点
					About_node.Father_node=Current_node;
					//替换开启列表里的父节点为当前节点
					if (About_node.getG() >= oldG) {
						//trace("被替换了")
						//比较被替换父节点的开启列表里的节点的值是否大于最开始的G值
						About_node.Father_node=Father;
						//如果大于则,被替换的开启列表里的节点的父节点又被送了回来给与了开启列表里的节点
					}
					//如果周边节点移动的代价比当前节点移动的代价要少的话,就替换当前节点的父节点,递归路径时遍会递归到最短路径的父类
				}
			}
		}
	}
} while (Start_listing.length!=0);
//如果开启列表为空，停止寻路
if(Start_listing.length==0&&Current_node.equals(Goal_node)==false){
	trace("没有路了")
	kaishi=false
}
}
public function bianyuan(h:int,l:int,hh:int,ll:int,map:Array):Boolean {
	if (hh-1==h&&ll-1==l) {
		if (map[h][l+1]==1||map[h+1][l]==1) {
			//trace("左上")
			return false;
		}
	} else if (hh-1==h&&ll+1==l) {
		if (map[h][l-1]==1||map[h+1][l]==1) {
			//trace("右上")
			return false;
		}
	} else if (hh+1==h&&ll-1==l) {
		if (map[h-1][l]==1||map[h][l+1]==1) {
			//trace("左下")
			return false;
		}
	} else if (hh+1==h&&ll+1==l) {
		if (map[h][l-1]==1||map[h-1][l]==1) {
			//trace("右下")
			return false;
		}
	} 
	return true
	//判断当前节点的斜角上周围是否有障碍物
}
public function detection_fraise(h:int,l:int,map:Array):Boolean {
	if (map[h][l]==1) {
		return false;
	} else {
		return true;
	}
}
//检测是否有障碍物
public function detection_border(h:int,l:int,map:Array):Boolean {
	return h < map.length && l < map[0].length && h >= 0 && l >= 0;
}
//检测是否超出边界
public function detection_listing(h:int,l:int,vec:Array):node {
	for (var i:int=0; i < vec.length; i++) {
		var mc:node=vec[i];
		if (h == mc.h && l == mc.l) {
			return mc;
		}
	}
	return null;
}
	//检测是否在列表里(检测当前行当前列是否与开启列表里的元素一样)
}
}

