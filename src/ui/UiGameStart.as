package ui
{
	import com.bit101.components.CheckBox;
	import com.bit101.components.Component;
	import com.bit101.components.InputText;
	import com.bit101.components.PushButton;
	import com.core.MD5;
	import com.socket.msg.NetLogin;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.SharedObject;
	
	public class UiGameStart extends UiNode
	{
		private var gameImg:ImgFile = null;//new ImgFile();
		private var img:Bitmap = new Bitmap();		
		
		private var accountText:InputText;
		private var passwordText:InputText;	
		
		private var saveAccount:Boolean;
		
		public function UiGameStart()
		{
			super();		
			
			addChild(img);		
			//addChild(gameimg);				
			// 全屏背景显示
			ImgList.getInstance().LoadRes("asset/ui/登录游戏.jpg");			
			//gameimg.Load("asset/ui/登录游戏.jpg");
			

			xmlConfig.loadXML("asset/ui/Login.xml");
			
			xmlConfig.addEventListener(Event.COMPLETE, onLoadComplete);
			this.addEventListener(Event.ENTER_FRAME, onDraw);

			//var win:Component = new Component(this,100,100);
			//win.imgStr = "登录界面.img";
			
			/*var _btn:PushButton;
			var account:Label;
			var password:Label;
		

			
			account = new Label(this,400,200,"帐号");
			password = new Label(this,400,220,"密码");	
			
			accountText = new InputText(this,440,200,"");
			accountText.maxChars = 32;
			
			passwordText = new InputText(this,440,220,"");
			passwordText.maxChars = 32;
			passwordText.password = true;
			
			_btn = new PushButton(this, 420, 240, '确定',SendLogin);	
			
			_enterGame = new PushButton(this, 420, 270, '进入游戏',EnterGame);	
			*/
			//addEventListener(Event.ADDED_TO_STAGE, init);
			//addEventListener(Event.ENTER_FRAME, DrawBuff);
			
		}
		private function onLoadComplete(event:Event):void
		{
			var so:SharedObject = SharedObject.getLocal("GameDemo");
			saveAccount = so.data.saveAccount;
			var save:CheckBox = xmlConfig.getCompById("save")as CheckBox;
			if (save)
				save.selected = saveAccount;
			if (save.selected)
			{
				accountText = xmlConfig.getCompById("account") as InputText;
				if (accountText)
					accountText.text = so.data.Account;
			}
		
		}
		public function SendLogin(event:Event):void
		{
			accountText = xmlConfig.getCompById("account") as InputText;
			passwordText = xmlConfig.getCompById("password")as InputText;
			if (accountText.text != "" && passwordText.text != "")
			{
				// 发送登录消息
				var netLogin:NetLogin = new NetLogin();
				netLogin.Account = accountText.text;
				netLogin.Password = MD5.hash(passwordText.text);
				netLogin.Address = "";
				netLogin.Server = "";
				netLogin.CheckLetter = 0;
				netLogin.Letter = 0;
				netLogin.SendMsg();
				
				var save:CheckBox = xmlConfig.getCompById("save")as CheckBox;
				if (save)
				{
					var so:SharedObject = SharedObject.getLocal("GameDemo");
					so.data.saveAccount = save.selected;
					if (save.selected)
					{
						so.data.Account = accountText.text;
					}
					//立即写入本地文件
					so.flush ();
				}

				
			}
			
		}
		public function EnterGame(event:Event):void
		{
			GameDemo.TestGame();

		}
		//private function DrawBuff(event:Event):void
		//{
			//if (this.visible)
			//	gameimg.Draw(0, 0, 0);
		//}		
		public function OnCreate(e:Event):void
		{
			Hide(null);
			GameDemo.uiCreatAcc.Show();
			
		}
		override public function Resize():void
		{
			if (MainDraw.CanvasWidth > 0 && MainDraw.CanvasHeight > 0 &&
				img.bitmapData)
			{
				img.scaleX = MainDraw.CanvasWidth / img.bitmapData.width;
				img.scaleY = MainDraw.CanvasHeight / img.bitmapData.height;
			}
			var win:Component = xmlConfig.getCompById("login");
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