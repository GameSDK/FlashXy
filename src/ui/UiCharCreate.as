package ui
{
	import com.bit101.components.InputText;
	import com.bit101.components.RadioButton;
	import com.socket.msg.NetPlayerNew;
	
	import flash.events.Event;

	public class UiCharCreate extends UiNode
	{
		private var gameimg:ImgFile = new ImgFile();
		
		public function UiCharCreate()
		{
			super();
			gameimg.addBitMap = true;
			addChild(gameimg);				
			// 全屏背景显示
			gameimg.Load("asset/ui/登录游戏.jpg");
		
			xmlConfig.loadXML("asset/ui/CharCreate.xml");			
		}
		public function OnReturn(e:Event):void
		{
			Hide(null);
			GameDemo.uiCharSelect.Show();
		}
		public function OnCharCreate(e:Event):void
		{
			var man:RadioButton = xmlConfig.getCompById("charman") as RadioButton;
			var woman:RadioButton = xmlConfig.getCompById("charwoman") as RadioButton;
			var name:InputText = xmlConfig.getCompById("name") as InputText;
			if (name.text != "")
			{
				var create:NetPlayerNew = new NetPlayerNew();
				create.Name = name.text;
				create.Party = "绿林豪杰";
				if (man.selected)
					create.Sex = 0;
				else
					create.Sex = 1;
				create.Head = 0;
				create.SendMsg();
			}
		}
	}
}