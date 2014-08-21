package lib
{
	public class MagicList extends ObjList
	{
		public var MOVE_FIX:int = 0;		// 定点，可多图，可延时
		public var MOVE_FLY:int = 1;		// 飞行，可多图，可延时
		public var MOVE_UPRIGHT:int = 2;	// 垂直下落，可多图，可延时
		public var MOVE_SLOPE:int = 3;		// 倾斜下落，可多图，可延时
			
		public var m_MagicName:String;//法术名称
		public var m_MagicKind:int;//法术类型
		public var m_MoveType:int;//运动形式
		public var m_ImageNum:int;//图象数量
		public var m_ImgDelay:int;//图象延时
		public var m_MagicArea:int;//攻击范围
		public var m_ObjKind:int;//目标类型		
		
		public function MagicList()
		{
			super();
		}
		public function Add(Owner:Npc, MagicName:String, Delay:int):void
		{
			// 读取设定
			m_MagicName = MagicName;
			m_MagicKind = GameDemo.skillData.GetValueForName(m_MagicName, "技能类型");
			m_MoveType = GameDemo.skillData.GetValueForName(m_MagicName, "运动形式");
			m_ImageNum = GameDemo.skillData.GetValueForName(m_MagicName, "图像数量");
			m_ImgDelay = GameDemo.skillData.GetValueForName(m_MagicName, "图像延时");
			m_MagicArea = GameDemo.skillData.GetValueForName(m_MagicName, "攻击范围");
			m_ObjKind = GameDemo.skillData.GetValueForName(m_MagicName, "施法对象");
			// 目标类型
			if (m_ObjKind == Skill.OBJ_KIND_OWNER)
			{
				Owner.m_DestX = Owner.sx;
				Owner.m_DestY = Owner.sy;
			}
			// 发出特效
			//PCSTR Name = GpSpc->m_SkillFile.GetStr(m_MagicName, "发出效果", "");
			//Owner->AddEffect(Name, Owner->m_X, Owner->m_Y);
			// 生成法术对象
			switch (m_MoveType)
			{
				case MOVE_FIX:
					OnFix(Owner, Delay);
					break;
				case MOVE_FLY:
					OnFly(Owner, Delay);
					break;
				case MOVE_UPRIGHT:
					OnUpright(Owner, Delay);
					break;
				case MOVE_SLOPE:
					OnSlope(Owner, Delay);
					break;
			}	
		}
		override public function OnTimer():void
		{
			for (var key:String in pool)
			{
				var Node:Magic = getResource(key) as Magic;	
				if (Node)
					Node.OnTimer();
			}			
		}	
		override public function Draw():void
		{
			for (var key:String in pool)
			{
				var Node:Magic = getResource(key) as Magic;				
				if (Node.m_Delay <= 0)				
					Node.Draw();
			}			
		}		
		// 定点法术，可多图，可延时
		private function OnFix(Owner:Npc, Delay:int):void
		{
			var node:Magic = new Magic();
			node.InitMagic(m_MagicName, Owner);
			node.m_Delay = Delay;
			node.InsertObj(GameDemo.DrawList);	
			addResource(node.name, node);
			for (var i:int = 1; i < m_ImageNum; i++)
			{
				node = new Magic();
				node.InitMagic(m_MagicName, Owner);
				node.sx += TtgLib.Random(1, m_MagicArea) * TtgLib.Random(-2, 2) * 32;
				node.sy += TtgLib.Random(1, m_MagicArea) * TtgLib.Random(-2, 2) * 16;
				node.m_Delay = i * m_ImgDelay + Delay;
				node.InsertObj(GameDemo.DrawList);	
				addResource(node.name, node);
			}
		}
		//*****************************************************************************
		// 飞行，可多图，可延时
		private function OnFly(Owner:Npc, Delay:int):void
		{
			/*KmMagic* Magic = (KmMagic*)GmCalloc(sizeof(KmMagic));
			Magic->Init(m_MagicName, Owner);
			Magic->m_Delay = Delay;
			AddTail(Magic);
			for (int i = 1; i < m_ImageNum; i++)
			{
				Magic = (KmMagic*)GmCalloc(sizeof(KmMagic));
				Magic->Init(m_MagicName, Owner);
				AddTail(Magic);
				Magic->m_Delay = i * m_ImgDelay + Delay;
			}*/
		}
		//*****************************************************************************
		// 垂直下落，可多图，可延时
		private function OnUpright(Owner:Npc, Delay:int):void
		{
			/*KmMagic* Magic = (KmMagic*)GmCalloc(sizeof(KmMagic));
			Magic->Init(m_MagicName, Owner);
			Magic->m_Delay = Delay;
			AddTail(Magic);
			for (int i = 1; i < m_ImageNum; i++)
			{
				Magic = (KmMagic*)GmCalloc(sizeof(KmMagic));
				Magic->Init(m_MagicName, Owner);
				AddTail(Magic);
				Magic->m_X += GmRandom(1, m_MagicArea) * GmRandom(-2, 2) * 32;
				Magic->m_Y += GmRandom(1, m_MagicArea) * GmRandom(-2, 2) * 16;
				Magic->m_Delay = i * m_ImgDelay + Delay;
			}*/
		}
		//*****************************************************************************
		// 倾斜下落，可多图，可延时
		private function OnSlope(Owner:Npc, Delay:int):void
		{
			/*KmMagic* Magic = (KmMagic*)GmCalloc(sizeof(KmMagic));
			Magic->Init(m_MagicName, Owner);
			Magic->m_Delay = Delay;
			AddTail(Magic);
			for (int i = 1; i < m_ImageNum; i++)
			{
				Magic = (KmMagic*)GmCalloc(sizeof(KmMagic));
				Magic->Init(m_MagicName, Owner);
				AddTail(Magic);
				Magic->m_X += GmRandom(1, m_MagicArea) * GmRandom(-2, 2) * 32;
				Magic->m_Y += GmRandom(1, m_MagicArea) * GmRandom(-2, 2) * 16;
				Magic->m_Delay = i * m_ImgDelay + Delay;
			}*/
		}		
	}
}