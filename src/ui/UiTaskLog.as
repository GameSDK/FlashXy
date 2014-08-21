package ui
{
	import com.bit101.components.List;
	import com.bit101.components.Text;
	import com.core.IniFile;
	import com.core.TabFile;
	import com.socket.msg.NetRunTask;
	
	import flash.events.Event;

	public class UiTaskLog extends UiNode
	{
		public var taskLog:IniFile = new IniFile();
		public var taskData:TabFile = new TabFile();
		private var info:Text;		
		private var list:List;
		
		public function UiTaskLog()
		{
			super();
			xmlConfig.loadXML("asset/ui/TaskLog.xml");		
			xmlConfig.addEventListener(Event.COMPLETE, onLoadComplete);	
			taskData.Load("asset/data/TaskLog.ini");
		}
		public function Update():void
		{
			list = xmlConfig.getCompById("list") as List;
			if (list)
			{
				list.removeAll();
				for(var key:String in taskLog.ini)
				{
					var text:Array = key.split("_");					
					list.addItem(text[1]);
				}

			}			
			
		}
		public function onLoadComplete(event:Event):void
		{
			list = xmlConfig.getCompById("list") as List;
			if (list)
				list.addEventListener(Event.SELECT, onSelect);	
			ClearTaskInfo();

		}
		public function ClearTaskInfo():void
		{
			info = xmlConfig.getCompById("task") as Text;
			if (info)
			{
				info.text = "";
			}			
		}
		public function GetTaskLog(str:String):int
		{
			return taskLog.GetValue("Task", str) as int;
		}
		public function GetKillNpc(task:String, npc:String):int
		{
			return taskLog.GetValue("Kill", task+","+npc) as int;			
		}
		public function RunTask(name:String, param:String = ""):void
		{
			var msg:NetRunTask = new NetRunTask();
			msg.Name = name;
			msg.Param = param;
			msg.SendMsg();			
		}
		public function AddTaskInfo(str:String, par:String = ""):void
		{
			//info = xmlConfig.getCompById("task") as Text;
			if (info)
			{
				info.text = info.text + "<FONT COLOR=\"#ffffff\">" + str + "</FONT>\n";
			}				
		}
		private function onSelect(e:Event):void
		{
			var taskName:String = e.target.selectedItem;
			var taskFile:String = taskData.GetValueForName(taskName, "脚本") as String;
			if (taskFile != null)
				GameDemo.LoadLua(taskFile);
		}
	}
}