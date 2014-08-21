package lib
{
	import com.socket.msg.NetPlayerSkill;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;	
	public class Skill extends Obj
	{
		// 法术目标类型

		public static var OBJ_TYPE_SPC:int = 0;		//玩家目标
		public static var OBJ_TYPE_PET:int = 1;		//宠物目标
		public static var OBJ_TYPE_NPC:int = 2;		//怪物目标

		//*****************************************************************************
		// 施法目标类型

		public static var OBJ_KIND_OWNER:int = 0;	//只对自己
		public static var OBJ_KIND_SINGLE:int = 1;	//单一目标，可对自己或他人
		public static var OBJ_KIND_AREA:int = 2;		//在一定范围内，可以无目标

		//*****************************************************************************
		// 技能类型

		public static var SKILL_ATTACK:int = 0;// 攻击技能
		public static var SKILL_ASSIST:int = 1;// 辅助技能
		public static var SKILL_PASSIV:int = 2;// 被动技能

		
		private var square:Sprite = new Sprite();		
		private var pick:Sprite = new Sprite();

		public var m_Level:int;// 等级
		public var m_Quick:int;// 快捷位置
		public var m_Active:Boolean;//是否激活
		public var m_Dist:int;// 施法距离
		
		public var m_Timer:int;// 间隔时间定时器
		public var m_CoolSpeed:int;//速度计时
		private var m_Intro:String;//简介
		private var m_CoolTime:int;//图片定时
		
		public var m_Index:int;// 位置标号
		public var m_Kind:int;// 类型
		public var m_Picked:Boolean;// 是否拿起
		public var m_Action:int;// 施法动作
		
		public function Skill()
		{
			super();
			this.mouseEnabled = false;			
			square.graphics.beginFill(0x000000, 0.5);
			square.graphics.drawRect(ItemList.GRID_SIZE, 0, 100, 200);	
			square.visible = false;
			square.mouseEnabled = false;
			addChild(square);				
			
			pick.graphics.beginFill(0x000000, 0.5);
			pick.graphics.drawRect(0, 0, ItemList.GRID_SIZE, ItemList.GRID_SIZE);	
			pick.visible = false;
			pick.mouseEnabled = false;
			addChild(pick);				
		}
		public function GetNetMsg(Msg:NetPlayerSkill):void
		{
			m_Level = Msg.SkillLevel;
			m_Quick = Msg.QuickIndex;
			m_Timer = Msg.SkillTimer;
			m_CoolSpeed = m_Timer * 30;
			m_Active = true;
		}	
		// gm修改
		public function SetNetMsg(Msg:NetPlayerSkill):void
		{
			//TmNetPlayerSkill* p = (TmNetPlayerSkill*)Msg->m_Data;
			//strcpy(p->SkillName, m_Name);
			//p->SkillLevel = m_Level;
			//p->QuickIndex = m_Quick;
		}
		public function Load():void
		{
			LoadImg("asset/ui/流风利刃.img");
			m_Intro = GameDemo.skillData.GetValueForName(name, "技能简介") as String;
			m_Kind = GameDemo.skillData.GetValueForName(name, "技能类型");
			m_Index = GameDemo.skillData.GetValueForName(name, "界面位置");
			trace(name, m_Index, m_Kind);
			/*KmIniFile *File = &GpSpc->m_SkillFile;
			PCSTR Name = m_Name;
			// 基本数值
			File->GetString(Name, "技能门派", "", m_Party);
			File->GetString(Name, "技能简介", "", m_Intro);
			File->GetString(Name, "技能图标", "", m_IconFile);
			m_Kind = File->GetInt(Name, "技能类型", 0);
			m_Index = File->GetInt(Name, "界面位置", 0);
			m_Action = File->GetInt(Name, "施法动作", 1);
			m_ObjKind = File->GetInt(Name, "施法对象", 0);
			m_Dist = File->GetInt(Name, "施法距离", 0);
			m_MaxLevel = File->GetInt(Name, "等级上限", 0);
			m_MaxHurt = File->GetInt(Name, "伤害上限", 0);
			m_EffectKind = File->GetInt(Name, "效果类型", 0);
			// 数值随等级变化
			int Temp = 0;
			File->Get2Int(Name, "需要等级", &m_ReqLevel, &Temp);
			m_ReqLevel += Temp * m_Level;
			File->Get2Int(Name, "冷却时间", &m_Interval, &Temp);
			m_Interval += Temp * m_Level;
			File->Get2Int(m_Name, "普通攻击", &m_Attack[0], &Temp);
			m_Attack[0] += Temp * m_Level;
			File->Get2Int(m_Name, "金系攻击", &m_Attack[1], &Temp);
			m_Attack[1] += Temp * m_Level;
			File->Get2Int(m_Name, "木系攻击", &m_Attack[2], &Temp);
			m_Attack[2] += Temp * m_Level;
			File->Get2Int(m_Name, "水系攻击", &m_Attack[3], &Temp);
			m_Attack[3] += Temp * m_Level;
			File->Get2Int(m_Name, "火系攻击", &m_Attack[4], &Temp);
			m_Attack[4] += Temp * m_Level;
			File->Get2Int(m_Name, "土系攻击", &m_Attack[5], &Temp);
			m_Attack[5] += Temp * m_Level;
			File->Get2Int(Name, "附加伤害", &m_Damage, &Temp);
			m_Damage += Temp * m_Level;
			File->Get2Int(Name, "法力消耗", &m_ManaCost, &Temp);
			m_ManaCost += Temp * m_Level;
			File->Get2Int(Name, "效果时间", &m_EffectTime, &Temp);
			m_EffectTime += Temp * m_Level;
			File->Get2Int(Name, "效果数值", &m_EffectValue, &Temp);
			m_EffectValue += Temp * m_Level;
			File->Get2Int(Name, "效果概率", &m_EffectOdds, &Temp);
			m_EffectOdds += Temp * m_Level;
			// 图标
			m_Icon = GpImgList->Load(m_IconFile);
			// 冷却
			m_Cool = GpImgList->Load("\\face\\间隔进度.Img");
			m_CoolTime = 31;*/

		}
		public function LoadQuick(parent:Sprite):void
		{
			
			var img:Bitmap = new Bitmap();		
			imgBitmap[1] = img;
			parent.addChild(imgBitmap[1]);
		}
		public function DrawItem(x:int, y:int):void
		{
			gameImg = ImgList.getInstance().GetRes(imgFile[0]);
			if (gameImg)
			{
				//dirFrm = gameImg.GetFrame() / dirNum;
				//var Frame:int = frame + dir * dirFrm;				
				gameImg.DrawBitMap(x, y, 0, imgBitmap[0]);
				
				//if (m_PickUp == 1)
				//	pick.visible = true;
				//else
				//	pick.visible = false;
				
				//	gameImg.DrawBitMap(sx - Map.MapX, sy - Map.MapY, 0, imgBitmap[0]);
			}
		}		
		public function DrawQuickSkill(X:int, Y:int, img:Bitmap):void
		{
			gameImg = ImgList.getInstance().GetRes(imgFile[0]);
			if (gameImg)
			{
				gameImg.DrawBitMap(X, Y, 0, img);
			}			
		}
		public function DrawHint(X:int, Y:int):void
		{
			//X += m_X;
			//Y += m_Y;
			//DrawHintPos(X, Y, 12, POS_RIGHT);
			//trace(m_DispName);
			
			
			square.visible = true;
			
			
		}
		public function DrawSkillPos(X:int, Y:int, img:Bitmap):void
		{
			gameImg = ImgList.getInstance().GetRes(imgFile[0]);
			if (gameImg)
			{
				//dirFrm = gameImg.GetFrame() / dirNum;
				//var Frame:int = frame + dir * dirFrm;				
				gameImg.DrawBitMap(X - ItemList.GRID_SIZE / 2, Y - ItemList.GRID_SIZE / 2, 0, img);
			}
			
		}		
		public function HideHint():void
		{
			square.visible = false;
		}		
		private function OnMouseOver(e:MouseEvent):void
		{
			square.visible = true;			
		}
		private function OnMouseOut(e:MouseEvent):void
		{
			square.visible = false;;			
		}
		private function OnMouseMove(e:MouseEvent):void
		{
			e.stopPropagation();
		}		
		// 向服务器发送快捷技能位置
		public function SendSpcSkill():void
		{
			var msg:NetPlayerSkill = new NetPlayerSkill();
			msg.SkillName = name;
			msg.QuickIndex = m_Quick;
			msg.SendMsg();
		}
		public function PtInSkill(X:int, Y:int):Boolean
		{
			//trace(X, x, x + SkillList.GRID_SIZE);
			return (X >= x && X < x + SkillList.GRID_SIZE && Y >= y && Y < y + SkillList.GRID_SIZE);
		}	
		// 检查施法距离
		public function CheckDist(X:int, Y:int):Boolean
		{
			if (m_Dist == 0)
				return true;
			if (Math.abs(GameDemo.player.sx / 64 - X / 64) <= m_Dist &&
				Math.abs(GameDemo.player.sy / 32 - Y / 32) <= m_Dist)
				return true;
			return false;
		}		
		public function OnTimer():void
		{
			if (m_Timer > 0 && GameDemo.timerNum % 1000 == 0)
				m_Timer--;
			if (m_CoolSpeed > 0 && interval > 0)
			{
				m_CoolTime = 31 - 31.0 / (Number)(interval * 30) * m_CoolSpeed;
				m_CoolSpeed--;
				if (m_CoolSpeed > m_Timer * 30 && interval > 1)
					m_CoolSpeed = m_Timer * 30;
			}
		}		
	}
}