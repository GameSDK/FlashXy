package ui
{
	import com.bit101.components.Component;
	import com.bit101.components.Text;
	
	import flash.events.Event;
	import flash.events.MouseEvent;	
	
	public class UiDialog extends UiNode
	{
		private var talk:Text;
		private var funTemp:Function;
		
		public function UiDialog()
		{
			super();
			xmlConfig.loadXML("asset/ui/Dialog.xml");					
			this.addEventListener(MouseEvent.CLICK, Hide);		
		}
		//public function OnPage(e:Event):void
		//{
		//	Hide(null);
		//}
		public function OnTalk(fun:Function):void
		{
			this.addEventListener(MouseEvent.CLICK, fun);		
			funTemp = fun;
		}		
		public function Talk(name:String, str:String):void
		{
			talk = xmlConfig.getCompById("talk") as Text;
			if (talk)
			{
				talk.text = name + ":" + str;
			}
			Show();
			//if (funTemp != null)
			//	this.removeEventListener(MouseEvent.CLICK, funTemp);
		}
		override public function Resize():void
		{
			if (MainDraw.CanvasWidth > 0 && MainDraw.CanvasHeight > 0 )
			{
				var win:Component = xmlConfig.getCompById("dialog");
				if (win)
					win.DoAlign();
				
			}
		}	
		override public function Show():void
		{
			this.visible = true;
		}		
	}
}