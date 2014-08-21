package ui
{
	import com.bit101.components.Component
		
	public class UiMenu extends UiNode
	{
		public function UiMenu()
		{
			super();
			xmlConfig.loadXML("asset/ui/Menu.xml");				
		}
	}
}