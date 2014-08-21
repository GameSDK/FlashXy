package lib
{
	import com.socket.msg.NetPlayerSkill;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class SkillList extends ResourcePool
	{
		private var m_Num:int;
		private var m_GridSize:int;
		private var MAX_SKILL:int= 42;//技能最大值
		public static var  GRID_SIZE:int=	36;//技能格子大小
		
		public var m_Rect:Array = new Array(MAX_SKILL);
		public var DrawList:Sprite = new Sprite();
		public var QuickDrawList:Sprite = new Sprite();
		
		public function SkillList()
		{
		}
		public function Init(X:int, Y:int, W:int, H:int, Row:int, Col:int, GridSize:int):void
		{
			m_Num = 0;
			m_GridSize = GridSize;
			
			for (var m_Y:int = 0; m_Y < Row; m_Y++)
			{
				for (var m_X:int = 0; m_X < Col; m_X++)
				{
					var Rect:Rectangle = new Rectangle();
					
					Rect.left = X + m_X * W;
					Rect.top = Y + m_Y * H;
					Rect.right = X + m_X * W + m_GridSize;
					Rect.bottom = Y + m_Y * H + m_GridSize;
					
					m_Rect[m_Num] = Rect;
					m_Num++;

				}
			}
		}		
		public function AddSkill(Msg:NetPlayerSkill):void
		{
			var skill:Skill = getResource(Msg.SkillName) as Skill;			
			if (skill == null)
			{
				skill = new Skill();
				skill.name = Msg.SkillName;
				addResource(skill.name, skill);				
			}
			skill.GetNetMsg(Msg);
			skill.Load();
			skill.x = m_Rect[skill.m_Index].left;
			skill.y = m_Rect[skill.m_Index].top;

			DrawList.addChild(skill);
			if (skill.m_Quick > 0)
			{
				skill.LoadQuick(QuickDrawList);
				//QuickDrawList.addChild(skill);
			}
		}		
		public function Draw(x:int, y:int, Kind:int):void
		{
			for (var key:String in pool)
			{
				var skill:Skill = getResource(key) as Skill;
				if (skill && skill.m_Kind == Kind)
				{
					skill.DrawItem(x, y);
				}
			}			
		}	
		public function GetSkill(X:int, Y:int, Kind:int):Skill
		{
			for (var key:String in pool)
			{
				var skill:Skill = getResource(key) as Skill;
				if (skill && skill.m_Kind == Kind)
				{
					if (skill.PtInSkill(X, Y))
						return skill;
				}
			}	
			return null;
		}		
		public function FindSkill(name:String):Skill
		{
			return getResource(name) as Skill;
		}		
		//*****************************************************************************
		public function GetQuickSkill(Index:int):Skill
		{
			var skill:Skill = null;
			for (var key:String in pool)
			{
				skill = getResource(key) as Skill;
				if (skill.m_Active && skill.m_Quick == Index)
					return skill;;
			}
			return null;
		}	
		public function OnTimer():void
		{
			for (var key:String in pool)
			{
				var Node:Skill = getResource(key) as Skill;	
				if (Node)
					Node.OnTimer();
			}			
		}			
	}
}