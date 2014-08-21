package ui
{
	import com.bit101.components.BaseWindow;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import lib.Skill;
	import lib.SkillList;	
	public class UiSkill extends UiNode
	{
		private var HintSkill:Skill = null;
		public var m_TableID:int = 0; // 标签页ID		
		public var m_PickSkill:Skill;
		public var m_FreePick:Boolean;
		
		
		public var SKILL_ATTACK:int = 0;// 攻击技能
		public var SKILL_ASSIST:int = 1;// 辅助技能
		public var SKILL_PASSIV:int = 2;// 被动技能
			
		public function UiSkill()
		{
			super();
			xmlConfig.loadXML("asset/ui/Skill.xml");		
			xmlConfig.addEventListener(Event.COMPLETE, onLoadComplete);
			
			this.addEventListener(Event.ENTER_FRAME, onDraw);			
			
		}
		public function onLoadComplete(event:Event):void
		{
			var win:BaseWindow = xmlConfig.getCompById("skill") as BaseWindow;
			if (win)
			{
				win.addChild(GameDemo.player.skillList.DrawList);
			}			
			
		}		
		private function onDraw(e:Event):void
		{
			var win:BaseWindow = xmlConfig.getCompById("skill") as BaseWindow;
			if (win)
			{
				GameDemo.player.skillList.Draw(0, 0, 0);
			}
		}	
		override public function OnMouseMove(e:MouseEvent):void
		{
			if (HintSkill)
			{
				HintSkill.HideHint();
			}
			HintSkill = GameDemo.player.skillList.GetSkill(e.localX, e.localY, m_TableID);
			if (HintSkill)
				HintSkill.DrawHint(e.localX, e.localY);
		}	
		override public function OnMouseDown(e:MouseEvent):void
		{	
			e.stopPropagation();		
			var X:int = e.localX;
			var Y:int = e.localY;		
			//if (!PtInWindow(X, Y) || Done)
			//	return;
			// 左键整理技能
			if (e.buttonDown)
			{
				//KmSkill* Skill = GpSpc->m_SkillList.GetSkill(X, Y, m_TableID);
				var skill:Skill;
				skill = GameDemo.player.skillList.GetSkill(X, Y, m_TableID);
				
				if (skill)
				{
					//Done = TRUE;
					if (!skill.m_Active)
					{
						//GpGame->ShowMessage("你还没有学会此技能。");
						return;
					}
					if (skill.m_Level == 0)
					{
						//GpGame->ShowMessage("技能等级为0时无法使用，右键点击点后即可使用");
						return;
					}
					if (skill.m_Kind == SKILL_PASSIV)
					{
						//GpGame->ShowMessage("被动技能不必使用，加点后直接起效");
						return;
					}
					m_PickSkill = skill;
					m_FreePick = false;
					GameDemo.pickSkillName = skill.name;
				}
				else
				{
					DropPickSkill();
				}
			}
			// 右键加技能点
			/*if (Button == MK_RBUTTON && m_PickSkill == NULL)
			{
				KmSkill* Skill = GpSpc->m_SkillList.GetSkill(X, Y, m_TableID);
				if (Skill)
				{
					Skill->AddPoint();
					Done = TRUE;
					return;
				}
			}
			KmUiNode::OnMouseDown(Button, X, Y, Done);*/			
		}	
		// 把拿起来的技能放下
		public function DropPickSkill():void
		{
			var PickSkill:Skill = GetPickSkill();
			if (PickSkill)
			{
				//来自快捷栏
				if (m_FreePick)
				{
					GameDemo.uiMain.DrawList[PickSkill.m_Quick - 1].bitmapData = null;
					PickSkill.m_Quick = 0;
					// 通知服务器仍掉技能
					PickSkill.SendSpcSkill();
				}
				//m_PickSkill = null;
				GameDemo.pickSkillName = null;
			}
		}
		public function GetPickSkill():Skill
		{
			return GameDemo.player.skillList.FindSkill(GameDemo.pickSkillName)
		}		
		public function SetPickSkill(skill:Skill):void
		{
			if (skill)
				GameDemo.pickSkillName = skill.name;
			else
				GameDemo.pickSkillName = null;
		}			
	}
}