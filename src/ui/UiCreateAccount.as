package ui
{
	import com.bit101.components.InputText;
	import com.socket.msg.NetReg;
	import flash.display.Bitmap;		
	import flash.events.Event;
	
	public class UiCreateAccount extends UiNode
	{
		private var gameImg:ImgFile = null;
		private var img:Bitmap = new Bitmap();		
		
		public function UiCreateAccount()
		{
			super();
			addChild(img);				
			ImgList.getInstance().LoadRes("asset/ui/登录游戏.jpg");	
			
			xmlConfig.loadXML("asset/ui/CreateAccount.xml");
			this.addEventListener(Event.ENTER_FRAME, onDraw);			
		}
		public function OnReturn(e:Event):void
		{
			Hide(null);
			GameDemo.uiGameStart.Show();
		}
		
		public function OnCreate(e:Event):void
		{
			var msg:NetReg = new NetReg();
			var accountText:InputText = xmlConfig.getCompById("account") as InputText;
			var passwordText:InputText = xmlConfig.getCompById("password")as InputText;
			
			msg.Account = accountText.text;
			msg.Password = passwordText.text;
			msg.SendMsg();
		}
		override public function Resize():void
		{
			if (MainDraw.CanvasWidth > 0 && MainDraw.CanvasHeight > 0 &&
				img.bitmapData)
			{
				img.scaleX = MainDraw.CanvasWidth / img.bitmapData.width;
				img.scaleY = MainDraw.CanvasHeight / img.bitmapData.height;
			}
			
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