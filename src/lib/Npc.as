package lib
{
	import com.socket.msg.NetMapNpc;
	
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.text.TextField;

	public class Npc extends Obj
	{
		public var NPC_STAND:int = 0;// 站立
		public var	NPC_RUN:int = 1;// 跑步
		public var	NPC_SIT:int = 2;// 打坐
		public var	NPC_DIG:int = 3;// 挖矿
		public var	NPC_GET:int = 4;// 采集
		public var	NPC_JUMP:int = 5;// 跳跃
		public var	NPC_ATTACK:int = 6;// 攻击
		public var NPC_MAGIC:int = 7;// 法术
		public var	NPC_DIE:int = 8;// 死亡
		
		protected var textName:TextField = new TextField();		
		public var dispName:String;		
		public var speed:int = 2;
		public var originX:int = 0;
		public var originY:int = 0;
		public var state:int = NPC_STAND;
		public var level:int;
		
		private var endX:int = 0;
		private var endY:int = 0;
		
		private var path:Array = null;
		private var pathPos:Point;
		
		public var npcName:String = "";
		public var talkFile:String = "";
		public var soundFile:String = "";
		public var npcImage:String = "";
		public var actionName:String = "";
		
		public var Cloth:String = "asset/npc/";;// 衣服
		public var Weapon:String = "asset/npc/刀";;// 武器
		public var Ride:String = "";// 坐骑
		public var m_Owner:String = "";//宠物主人		
		public var m_MagicName:String = "";// 法术名称		
		public var m_MagicLevel:int;// 法术等级		
		
		public var m_DestX:int;// 目标坐标
		public var m_DestY:int;// 目标坐标	

		public var m_Life:int;// 生命
		public var m_LifeMax:int;// 最大生命		
		public function Npc()
		{
			super();
			type = TYPE_NPC1;		
			super.dirNum = 8;
			super.dirFrm = 5;			
			super.interval = 8;			
		}
		public function RecvMapNpc(msg:NetMapNpc):void
		{
			name = msg.Name;
			type = msg.Type;
			state = msg.State;
			dir = msg.Dir;
			sx = msg.X;
			sy = msg.Y;
			level = msg.Level;
			ChangeState();
		}
		public function Load(npcName:String):void
		{
			SetName(npcName);			
			npcImage = GameDemo.npcData.GetValueForName(dispName, "图像") as String;
			soundFile = GameDemo.npcData.GetValueForName(dispName, "声音") as String;
			talkFile = GameDemo.npcData.GetValueForName(dispName, "对话脚本") as String;
			//dirNum = GameDemo.npcData.GetValueForName(dispName, "方向") as int;

			//m_Mount = File->GetInt(m_DispName, "飞行", 0);
			//m_FixDir = File->GetInt(m_DispName, "固定", 0);
			//m_Body = File->GetInt(m_DispName, "尸体", 1);
			//m_Size = File->GetInt(m_DispName, "大小", 64);
			//SetPalette(0, File->GetStr(m_DispName, "颜色", ""));
			//m_Delay = 0;
			// 防止除0错
			if (dirNum < 1)
				dirNum = 1;
			if (dir >= dirNum)
				dir = 0;
			
			//LoadImg(npcImage + ".png");				
		}
		public function LoadWeapon(file:String):void
		{
			imgFile[1] = file;
			if (file != "")
				ImgList.getInstance().LoadRes(file);			
		}		
		public function LoadRide(file:String):void
		{
			imgFile[2] = file;
			if (file != "")			
				ImgList.getInstance().LoadRes(file);			
		}		
		public function DoRun(oX:int, oY:int):void
		{
			state = NPC_RUN;
			originX = sx;
			originY = sy;
			
			endX = oX;
			endY = oY;
			dir = GetDir(endX, endY);		
			if (ObstInLine(endX, endY) == true)
			{
				path = Map.path.FindPath(originX / 64, originY / 32, 
					endX / 64, endY / 32);
				if (path != null && path.length > 1)		
				{
					pathPos = path.pop();
					pathPos = path.pop();
					dir = GetDir(pathPos.x * 64 + 32, pathPos.y * 32 + 16);		
				}
			}
			else
			{
				path = null;
			}
			ChangeState();
		}
		public function DoStand():void
		{
			state = NPC_STAND;
			ChangeState();
		}
		public function DoAttack(X:int, Y:int):void
		{
			if (state != NPC_ATTACK)
			{
				state = NPC_ATTACK;
				dir = GetDir(X, Y);
				ChangeState();
			}
		}	
		public function DoMagic(X:int, Y:int, Action:int):void
		{
			m_DestX = X;
			m_DestY = Y;
			state = NPC_MAGIC;
			//ChangeState(NPC_MAGIC, Action);
			ChangeState();
			dir = GetDir(X, Y);
			if (dir >= dirNum)
				dir = 0;
			GameDemo.magicList.Add(this, m_MagicName, 10);
			//PlaySound();
		}		
		public function DoDie():void
		{
			state = NPC_DIE;
			ChangeState();
			this.filters = null;
		}		
		public function OnRun():void
		{
			NextFrame();				
			if (Math.abs(sx - endX) > 20 || Math.abs(sy - endY) > 20)
			{
				if (path == null)
				{
					RunToPos(endX, endY);
					if (Map.mapObs.GetObst(sx, sy) == MapObs.MAP_OBST)
					{
						sx = oldX;
						sy = oldY;
						
						DoStand();
					}					
				}
				else
				{
					if (!RunToPos(pathPos.x * 64 + 32, pathPos.y * 32 + 16))
						DoStand();
					
					if (path.length > 0 && sx == pathPos.x * 64 + 32 && sy == pathPos.y * 32 + 16)
					{
						pathPos = path.pop();
						dir = GetDir(pathPos.x * 64 + 32, pathPos.y * 32 + 16);		
						
					}					

				}

				// 所在格子变化
				if (sx / 64 != originX / 64 || sy / 32 != originY / 32)
				{
					originX = sx;
					originY = sy;
					
					// 主角发送坐标
					if (type == TYPE_PL)
					{
						GameDemo.player.SendSpcPos();
					}
				}
			}
			else if (state != NPC_STAND)
			{
				DoStand();
				var npc:Npc = GameDemo.npcList.getResource(npcName) as Npc;
				if (npc != null && npc.state != NPC_DIE)
				{
					if (npc.type == TYPE_NPC1)
					{
						GameDemo.TalkToNPC(npc.talkFile);
					}
					else if (npc.type == TYPE_MAP)
					{
						GameDemo.LeaveMap();
						GameDemo.uiTaskLog.RunTask("地图切换", npc.dispName);
					}
					else
					{
						DoAttack(npc.sx, npc.sy);
					}
				}
			}
		
		}
		public function OnStand():void
		{
			NextFrame();		
		}
		public function OnAttack():void
		{
			if (!NextFrame())
				return;
			if (frame == dirFrm - 1 || dirFrm == 0)
			{
				if (npcName.length > 0 && GameDemo.testGame)
				{
					var npc:Npc = GameDemo.npcList.getResource(npcName) as Npc;
					if (npc != null && npc.state != NPC_DIE)
					{
						npc.DoDie();
						npcName = "";
						DoStand();
					}
				}
			}
			else if (frame == 0)
			{
				//DoStand();
			}
		}
		public function OnDie():void
		{
			if (frame < dirFrm - 1)
			{
				NextFrame();
			}
			else if (frame >= dirFrm - 1)
			{
				frame = dirFrm - 1;
			}
		}		
		public function OnMagic():void
		{
			if (!NextFrame())
				return;
			if (frame == 0)
			{
				//m_AppeAct = 0;
				DoStand();
			}			
		}
		public function OnTimer():void
		{
			switch(state)
			{
				case NPC_STAND:
					OnStand();
					break;
				case NPC_RUN:
					OnRun();
					break;
				case NPC_ATTACK:
					OnAttack();
					break
				case NPC_MAGIC:
					OnMagic();
					break;
				case NPC_DIE:
					OnDie();
					break;				
			}
			//var a:uint = Map.mapObs.GetObst(sx, sy);		
			//if (a == MapObs.LOW_OBST)
			//{
			//	trace("low");
			//}
			if (Map.mapObs.GetObst(sx, sy) == MapObs.LOW_OBST)
			{
				this.alpha = 0.5;
			}
			else
			{
				this.alpha = 1;
			}
		}
		public function ChangeState():void
		{
			switch(state)
			{
				case NPC_STAND:
					super.dirFrm = 5;
					super.interval = 4;
					actionName = "站立";
					break;
				case NPC_RUN:
					super.dirFrm = 5;
					super.interval = 2;
					actionName = "跑步";
					break;
				case NPC_ATTACK:
				case NPC_MAGIC:
					super.dirFrm = 5;
					super.interval = 2;
					actionName = "攻击";
					break
				case NPC_DIE:
					super.dirFrm = 5;
					super.interval = 2;
					actionName = "死亡";
					break;
				
			}			
			UpdateImage();
		}
		public function UpdateImage():void
		{
			switch(type)
			{
				case TYPE_OBJ:
				case TYPE_ITEM:
				case TYPE_NPC1:
				case TYPE_BOX:
				case TYPE_DIG:
				case TYPE_GET:
				case TYPE_MAP:
					LoadImg(npcImage + ".png");	
					break;
				case TYPE_NPC2:
				case TYPE_NPC3:
					LoadImg(npcImage + actionName + ".png");	
					break;		
				case TYPE_OPL:
				case TYPE_PL:
					if (Cloth != "")
						LoadImg(Cloth + actionName + ".png");	
					else
						LoadImg("asset/npc/" + actionName + ".png");	
						
					if (Weapon != "")
						LoadWeapon(Weapon + actionName + ".png");
					else
						LoadWeapon("");
					
					if (Ride != "")
						LoadRide(Ride + actionName + ".png");
					break;
				default:
					LoadImg(npcImage+".png");
					break;
			
			}		
			frame = 0;
		}
		
		// 取得人物对某点的方向
		public function GetDir(oX:int, oY:int):int
		{
			// 计算X,Y坐标差值
			var dx:int = oX - sx;
			var dy:int = oY - sy;

			if (dx == 0 && dy == 0)
				return 4;
			// 两种特殊情况(dx==0 || dy==0)
			if (dx == 0)
			{
				if (dy >= 0)
					return 0;
				else
					return 4;
			}
			if (dy == 0)
			{
				if (dx >= 0)
					return 6;
				else
					return 2;
			}
			// 角度的正切值(结果*1000 整数化)
			var	nTan:int = dy * 1000 / dx;
			nTan = Math.abs(nTan);
			// 根据正切值判断方向
			if (nTan >= 1207) // tan(67.5)/2
			{
				if (dy > 0)
					return 0;
				else
					return 4;
			}
			if (nTan >= 207) // tan(22.5)/2
			{
				if (dx > 0)
				{
					if (dy > 0)
						return 7;
					else
						return 5;
				}
				else
				{
					if (dy > 0)
						return 1;
					else
						return 3;
				}
			}
			if (dx > 0)
				return 6;
			else
				return 2;

		}
		
		public function RunToPos(oX:int, oY:int):Boolean
		{
			// 即时计算cos值，使x，y轴速度分量的计算尽量精确
			oldX = sx;
			oldY = sy;
			var Dx:Number = oX - originX;
			var Dy:Number = oY - originY;
			var Dt:Number = Dx * Dx + Dy * Dy * 2;
			if (Dt == 0)
				return false;
			Dt = Math.sqrt(Dt);
			var CosX:Number = Dx / Dt;
			var CosY:Number = Dy / Dt;
			// 计算x，y轴速度 由于计算的误差，适当增加斜向移动速度
			var SpeedX:int = speed * Math.abs(CosX) * 2.0;
			if (SpeedX > speed)// * 2)
				SpeedX = speed// * 2;
			if (SpeedX < 1)
				SpeedX = 1;				
			var SpeedY:int = speed * Math.abs(CosY) * 2.0;
			if (SpeedY > speed)
				SpeedY = speed;
			if (SpeedY < 1)
				SpeedY = 1;
			if (sx < oX)
			{
				sx += SpeedX;
				if (sx > oX)
					sx = oX;
			}
			else if (sx > oX)
			{
				sx -= SpeedX;
				if (sx < oX)
					sx = oX;
			}
			if (sy < oY)
			{
				sy += SpeedY;
				if (sy > oY)
					sy = oY;
			}
			else if (sy > oY)
			{
				sy -= SpeedY;
				if (sy < oY)
					sy = oY;
			}
			InsertObj(GameDemo.DrawList);
			return true;
		}	
		
		// 检测跳跃中是否有高障碍
		public function ObstInLine(X:int, Y:int):Boolean
		{
			var Dx:Number = X - sx;
			var Dy:Number = Y - sy;
			var Dt:Number = Dx * Dx + Dy * Dy * 2;
			if (Dt == 0)
				return false;
			Dt = Math.sqrt(Dt);
			var CosX:Number = Dx * 1000 / Dt;
			var CosY:Number = Dy * 1000 / Dt;
			var OriginX:Number = sx;
			var OriginY:Number = sy;
			//m_OriginDir = Dt / 8;
			for (var i:int = 0; i < Dt; i += 8)
			{
				X = OriginX + i * CosX / 1000;
				Y = OriginY + i * CosY / 1000;
				if (Map.mapObs.GetObst(X, Y) == MapObs.MAP_OBST)
					return true;
			}
			return false;
		}
		
		public function SetName(str:String):void
		{
			var filter:GlowFilter = new GlowFilter(0x000000,1,2,2,200);					
			dispName = str;
			textName.htmlText = dispName;
			textName.textColor = 0xffffff;
			textName.x = sx - Map.MapX;
			textName.y = sy - Map.MapY;
			textName.mouseEnabled = false;
			textName.filters = [filter];
			addChild(textName);
		}
		public function UpdateName():void
		{
			textName.x = sx - Map.MapX;
			textName.y = sy - Map.MapY;			
		}
		public function SetPos(X:int, Y:int):void
		{
			sx = X;
			sy = Y;
		}
		public function SetLife(Life:int):void
		{
			m_Life = Life;
			if (m_LifeMax < m_Life || m_LifeMax < 1)
				m_LifeMax = m_Life + 1;
			//m_ImgRect.Init(48, 4, 48 * m_Life / m_LifeMax);
		}		
	}

}