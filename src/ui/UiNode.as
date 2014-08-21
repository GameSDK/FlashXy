package ui
{
	import com.bit101.components.Style;
	import com.bit101.utils.MinimalConfigurator;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.MouseCursor;
	
	public class UiNode extends Sprite
	{
		protected var xmlConfig:MinimalConfigurator;	
		
		public function UiNode()
		{
			
			super();
			xmlConfig = new MinimalConfigurator(this);			
			Style.fontSize = 12;
			Style.embedFonts = false;
			Style.fontName = '宋体';
			Style.BACKGROUND = 0xffffff;
			Style.BUTTON_FACE = 0x666666;
			Style.LABEL_TEXT = 0xffffff;
			Style.TEXT_BACKGROUND = 0;
			Style.LIST_DEFAULT = 0;
			Hide(null);			
			addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
			addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);					

		}
		public function Init():void
		{
			
		}
		public function Show():void
		{
			if (this.visible)
				Hide(null);
			else
				this.visible = true;
		}
		public function Hide(e:Event):void
		{
			this.visible = false;
		}		
		public function Resize():void
		{
			
		}
		public function OnMouseDown(e:MouseEvent):void
		{
			e.stopPropagation();
		}
		public function OnMouseMove(e:MouseEvent):void
		{

		}
	}
}