package ui
{
	import com.bit101.components.RadioButton;
	import com.socket.msg.NetPlayerGet;
	import com.socket.msg.NetPlayerInfo;
	import flash.display.Bitmap;	
	import flash.events.Event;
	import com.bit101.components.Component;
	
	public class UiCharSelect extends UiNode
	{
		private var gameImg:ImgFile = null;
		private var img:Bitmap = new Bitmap();		
		
		private var count:int = 0;
		private var selName:Array = new Array();
		private var char:RadioButton;
				
		public function UiCharSelect()
		{
			super();
			addChild(img);				
			// 全屏背景显示
			ImgList.getInstance().LoadRes("asset/ui/登录游戏.jpg");	
			
			xmlConfig.loadXML("asset/ui/CharSelect.xml");	
			this.addEventListener(Event.ENTER_FRAME, onDraw);			
		}
		public function Free():void
		{
			count = 0;
		}
		public function GetPlayerInfo(player:NetPlayerInfo):void
		{
			var sex:Array = ["男", "女"];
			count++;
			char = xmlConfig.getCompById("char"+count) as RadioButton;
			char.visible = true;
			if (count == 1)
				char.selected = true;
			char.label = player.Name + " \\ " + sex[player.Sex];
			selName.push(player.Name);
		}
		public function OnCharSelectEnter(event:Event):void
		{
			if (count < 1)
				return;
			// 判断选了哪个角色
			for (var i:int = 0; i<4; i++)
			{
				char = xmlConfig.getCompById("char" + (i + 1)) as RadioButton;	
				if (char.selected)
				{
					break;
				}
			}
			var playetGet:NetPlayerGet = new NetPlayerGet();
			playetGet.Name = selName[i];
			playetGet.Line = GameDemo.playerLine;
			playetGet.SendMsg();
		}		
		public function OnCharCreate(event:Event):void
		{
			Hide(null);
			GameDemo.uiCharCreate.Show();
		}
		override public function Resize():void
		{
			if (MainDraw.CanvasWidth > 0 && MainDraw.CanvasHeight > 0 &&
				img.bitmapData)
			{
				img.scaleX = MainDraw.CanvasWidth / img.bitmapData.width;
				img.scaleY = MainDraw.CanvasHeight / img.bitmapData.height;
			}
			var win:Component = xmlConfig.getCompById("charSelect");
			if (win)
				win.DoAlign();		
		}	
		private function onDraw(e:Event):void
		{
			gameImg = ImgList.getInstance().GetRes("asset/ui/登录游戏.jpg");
			if (gameImg)
			{
				if (gameImg.DrawBitMap(0, 0, 0, img))
				{
					this.removeEventListener(Event.ENTER_FRAME, onDraw);
					Resize();
				}
			}			
		}		
	}
}