package
{
	public class TtgLib
	{
		public function TtgLib()
		{
		}
		/**替换文件扩展名*/
		public static function ChangeFileExt(file:String, ext:String):String
		{
			var buff:Array = new Array();
			buff = file.split(".");
			if (ext != "")
				return buff[0] + "." + ext;
			else
				return buff[0];
		}
		/**获取文件路径*/
		public static function GetFilePath(file:String):String
		{
			var index:int = file.lastIndexOf("\\");
			if (index > -1)
			{
				return file.slice(0, index);
			}
			else
			{
				index = file.lastIndexOf("/");
				if (index > -1)
				{
					return file.slice(0, index);
				}				
			}
			return file;
		}		
		public static function Random(Min:int, Max:int):int
		{
			if (Max < Min)
				Max = Min;
			return (Min + Math.random() % (Max - Min + 1));
		}
	}
 
}