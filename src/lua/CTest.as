package lua
{
	import com.bit101.components.PushButton;
	import com.bit101.utils.MinimalConfigurator;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class CTest extends Sprite
	{
		public var xmlConfig:MinimalConfigurator;	
		
		public var btn:PushButton;
		
		public function CTest()
		{
			xmlConfig = new MinimalConfigurator(this);					
			xmlConfig.loadXML("asset/ui/Menu.xml");
		}
		public function Test():int 
		{
			trace("test","test1");
			btn = xmlConfig.getCompById("return") as PushButton;
			
			return 1;
			
		}
		public function Test2(num:String):void
		{
			trace(num,"test2");
		}
		public function Test3(value:int):void
		{
			trace(value.toString(),"test3");
		}	
		public function setEvent(fun:Function):void
		{
			btn.addEventListener(MouseEvent.CLICK, fun);
		}
	}
}