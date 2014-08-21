package lua
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import luaAlchemy.LuaAlchemy;
	import luaAlchemy.LuaAssets;
	
	public class LuaCore
	{
		private var luaAl:LuaAlchemy;
		private var objTest:CTest=new CTest();		
		private var loadurl:URLLoader = new URLLoader();	
		private var luaFile:ResourcePool = new ResourcePool();
		private var fileName:String;
		
		public function LuaCore()
		{
			loadurl.dataFormat = "binary";			
			luaAl = new LuaAlchemy(LuaAssets.filesystemRoot());
			luaAl.setGlobalLuaValue("luaTalk", GameDemo.uiDialog);
			luaAl.setGlobalLuaValue("luaTask", GameDemo.uiTaskLog);
		}
		public function doString(str:String):void
		{
			luaAl.doString(str);
		}
		public function loadLua(file:String):void
		{
			fileName = file;
			var str:String = luaFile.getResource(fileName);
			if (str)
			{
				doString(str);	
			}
			else
			{
				loadurl.load(new URLRequest(file));
				loadurl.addEventListener(Event.COMPLETE, onLoadLua);
			}
		}
		private function onLoadLua(event:Event):void
		{
			var buf:ByteArray = loadurl.data;
			
			var str:String = buf.readMultiByte(buf.length, "gbk");  //loadurl.data;
			doString(str);				
			luaFile.addResource(fileName, str);
		}		
	}
}