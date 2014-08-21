package lib
{
	public class Magic extends Obj
	{
		public static var MAGIC_MOVE:int = 0;	// 移动
		public static var MAGIC_BLOW:int = 1;		// 爆炸

		public static var MAGIC_FIX:int = 0;	// 定点法术
		public static var MAGIC_FLY:int = 1;		// 飞行法术
		public static var MAGIC_UPRIGHT:int = 2;	// 垂直落下
		public static var MAGIC_SLOPE:int = 3;	// 倾斜落下

		
		public var m_MoveType:int;// 运动形式
		public var m_MoveDist:int;// 动作类型
		public var m_Delay:int;// 法术发出延迟
		public var m_Speed:int;// 速度
		public var m_Pos:int;// 位置0－在后，1－在前
		public var m_OrgX:int;// 起始X
		public var m_OrgY:int;// 起始Y
		public var m_DestX:int;// 目的X
		public var m_DestY:int;// 目的Y	
		public var state:int;
		
		private var MagicName:String;
		
		public function Magic()
		{
			super();
		}
		public function InitMagic (Name:String, Owner:Npc):void
		{
			MagicName = Name;
			m_MoveType = GameDemo.skillData.GetValueForName(Name, "运动形式");
			m_Speed = GameDemo.skillData.GetValueForName(Name, "飞行速度");
			dirNum = GameDemo.skillData.GetValueForName(Name, "方向数量");
			m_Pos = GameDemo.skillData.GetValueForName(Name, "前后关系");
			type = TYPE_ITEM;
			m_Delay = 0;
			m_Pos *= 16;//确保移到人物底面的前
			m_OrgX = Owner.sx;
			m_OrgY = Owner.sy;
			m_DestX = Owner.m_DestX;
			m_DestY = Owner.m_DestY;
			ChangeState(MAGIC_MOVE);
			switch (m_MoveType)
			{
				case MAGIC_FIX:
					sx = m_DestX;
					sy = m_DestY + m_Pos;
					break;
				case MAGIC_FLY:
					sx = m_OrgX;
					sy = m_OrgX + m_Pos;
					break;
				case MAGIC_UPRIGHT:
					sx = m_DestX;
					sy = m_DestY + m_Pos;
					sz = 350;
					break;
				case MAGIC_SLOPE:
					sx = m_DestX + 350;
					sy = m_DestY + m_Pos;
					sz = 350;
					break;
			}
			//SetRect(m_X, m_Y);
			//LoadRect();
		}
		//*****************************************************************************
		public function OnTimer():void
		{
			if (m_Delay > 0)
			{
				m_Delay --;
				return;
			}
			switch (m_MoveType)
			{
				case MAGIC_FIX:
					OnFix();
					break;
				case MAGIC_FLY:
					OnFly();
					break;
				case MAGIC_UPRIGHT:
					OnUpright();
					break;
				case MAGIC_SLOPE:
					OnSlope();
					break;
				default:
					Delete();
					break;
			}
		}
		//*****************************************************************************
		// 定点
		private function OnFix():void
		{
			switch (state)
			{
				case MAGIC_MOVE:
					if (NextFrame() && frame == 0)
					{
						MagicBlow();
					}
					break;
				case MAGIC_BLOW:
					if (NextFrame() && frame == 0)
					{
						Delete();
					}
					break;
			}
		}
		//*****************************************************************************
		// 飞行
		private function OnFly():void
		{
			switch (state)
			{
				case MAGIC_MOVE:
					OnMove(m_MoveDist++);
					NextFrame();
					if (m_MoveDist * m_Speed > 640)
						Delete();
					break;
				case MAGIC_BLOW:
					if (NextFrame() && frame == 0)
						Delete();
					break;
			}
		}
		//*****************************************************************************
		// 垂直下落
		private function OnUpright():void
		{
			switch (state)
			{
				case MAGIC_MOVE:
					sz -= m_Speed;
					if (sz < 1)
					{
						MagicBlow();
						break;
					}
					NextFrame();
					break;
				case MAGIC_BLOW:
					if (NextFrame() && frame == 0)
					{
						Delete();
					}
					break;
			}
		}
		//*****************************************************************************
		// 斜向下落
		private function OnSlope():void
		{
			switch (state)
			{
				case MAGIC_MOVE:
					sz -= m_Speed;
					sx -= m_Speed;
					if (sz < 1)
					{
						MagicBlow();
						break;
					}
					NextFrame();
					break;
				case MAGIC_BLOW:
					if (NextFrame() && frame == 0)
					{
						Delete();
					}
					break;
			}
		}
		//*****************************************************************************
		// 飞行跟踪目标
		private function OnMove(Dist:int):void
		{
			/*int Dx = m_DestX - m_OrgX;
			int Dy = m_DestY - m_OrgY;
			int Dt = Dx * Dx + Dy * Dy;
			if (Dt == 0)
			{
				MagicBlow();
				return;
			}
			Dt = (int)sqrt((double)Dt);
			int CosX = Dx * 1024 / Dt;
			int CosY = Dy * 1024 / Dt;
			m_Dir = GetImgDir(CosX, CosY);
			m_X = m_OrgX + Dist * CosX / 1024;
			m_Y = m_OrgY + Dist * CosY / 1024;
			if (abs(m_X - m_DestX) <= 64 && abs(m_Y - m_DestY) <= 32)
			{
				MagicBlow();
			}*/
		}
		//*****************************************************************************
		// 法术爆炸
		private function MagicBlow():void
		{
			ChangeState(MAGIC_BLOW);
			dirNum = 1;
			dir = 0;
		}
		//*****************************************************************************
		// 改变状态
		private function ChangeState(State:int):void
		{
			var Key:Array = ["飞行效果","爆炸效果"];
			var effectName:String = GameDemo.skillData.GetValueForName(MagicName, Key[State]);
			if (effectName)
			{
				var Image:String = GameDemo.effectData.GetValueForName(effectName, "图像");
				if (Image)
				{
					//m_Image[0] = GpImgList->Load(Image);
					LoadImg("asset/magic/蜀山/爆炸/苍天之怒.Img");
					//SetPalette(0, GpSpc->m_EffectIni.GetStr(Image, "颜色", ""));
				}
				//PCSTR Sound = GpSpc->m_EffectIni.GetStr(Name, "声音", "");
				//if (Sound[0])
				//{
				//	int Pan = (m_X - GpSpc->m_X) * 20;
				//	int Vol = GetDistance(GpSpc) * 4;
				//	GpWavList->Play(Sound, Pan, -Vol);
				//}
			}
			interval = 0;
			state = State;
			frame = 0;
			m_MoveDist = 0;
		}
		private function Delete():void
		{
			if(parent)
				parent.removeChild(this);
			//GameDemo.DrawList.removeChild(this);
			//delete this;
		}
		//****************************************************************************	
	}


	
}