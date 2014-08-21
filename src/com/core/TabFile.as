package com.core
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class TabFile
	{
		private var loadurl:URLLoader = new URLLoader();
		private var loadimg:Loader = new Loader();
		private var FileName:String;
		
		private var tabName:Array;
		public var tab:Array = new Array();
		
		public function TabFile()
		{
		}
		public function Load(file:String):void
		{

			FileName = file;

			loadurl.dataFormat = URLLoaderDataFormat.BINARY;
			loadurl.load(new URLRequest(file));
			loadurl.addEventListener(Event.COMPLETE, onLoad);
			
		}		
		private function onLoad(e:Event):void
		{
			var buf:ByteArray = e.target.data as ByteArray;
			var txt:String = buf.readMultiByte(buf.length, "gbk");
			var data:Array = txt.split("\r\n");

			//for each (var line:String in data)
			for (var i:int; i < data.length; i++)
			{
				var pool:Dictionary = new Dictionary();
				if (i == 0)
				{
					tabName = data[i].split("\t");
				}
				else
				{
					var tabdata:Array = data[i].split("\t");
					for (var j:int = 0; j < tabdata.length; j++)
						pool[tabName[j]] = tabdata[j];
					tab.push(pool);
				}
			}
		}
		public function GetValue(index:int, name:String):*
		{
			if (tab.length > 0)
				return tab[index][name];
			return null;
		}
		public function GetValueForName(str:String, name:String):*
		{
			for (var i:int = 0; i < tab.length; i++)
			{
				if (tab[i][tabName[0]] == str)
					return  tab[i][name];
			}
			return null;
		}
	}
}