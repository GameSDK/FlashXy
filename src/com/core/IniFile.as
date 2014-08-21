package com.core
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.events.EventDispatcher;	
	import flash.utils.Endian;	
	
	public class IniFile extends EventDispatcher
	{
		private var loadurl:URLLoader = new URLLoader();
		private var loadimg:Loader = new Loader();
		private var FileName:String;
		
		public var ini:Dictionary = new Dictionary();
		
		public function IniFile()
		{
		}
		public function Load(file:String):void
		{
			
			FileName = file;
			
			loadurl.dataFormat = URLLoaderDataFormat.BINARY;
			loadurl.load(new URLRequest(file));
			loadurl.addEventListener(Event.COMPLETE, onLoad);
			//GameDemo.log.text=	file;			
		}		
		private function onLoad(e:Event):void
		{
			var buf:ByteArray = loadurl.data as ByteArray;//e.target.data as ByteArray;
			buf.endian=Endian.LITTLE_ENDIAN;
			
			var txt:String = buf.readMultiByte(buf.length, "gbk");
			var data:Array = txt.split("\r\n");
			//GameDemo.log.text=	GameDemo.log.text + ";;"+ txt;
			//for each (var line:String in data)
			for (var i:int = 0; i < data.length; i++)
			{
				//var pool:Dictionary = new Dictionary();
				var begin:int = data[i].indexOf("[");
				var sec:String;
				if (begin >= 0)
				{
					var end:int =  data[i].indexOf("]");
					sec = data[i].slice(begin + 1, end);
				}
				// key
				else
				{	var key:Array = data[i].split("=");
					if (key.length > 1)
					{
						//pool[key[0]] = key[1];
						//ini[sec + "_" + key[0]] = key[1];
						SetValue(sec, key[0], key[1]);
						//trace(ini[sec][key[0]]);
					}
				}
			}
			dispatchEvent(new Event(Event.COMPLETE));			
		}
		public function GetValue(sec:String, key:String):*
		{
			//if (ini.length > 0)
				return ini[sec + "_" + key];
			//return null;
		}
		public function SetValue(sec:String, key:String, value:*):void
		{
			ini[sec + "_" + key] = value;			
		}
		public function free():void
		{
			for(var key:String in ini)
			{
				delete ini[key];
			}
		}
	}
}