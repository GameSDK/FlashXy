package
{
	public class ImgList extends ResourcePool
	{
		//public static var resPool:ResourcePool=new ResourcePool();	

		private static var singleton : ImgList = null;	
		
		public function ImgList()
		{
			super();
		}

		public static function getInstance() : ImgList 
		{    
			if ( singleton == null )            
				singleton = new ImgList(  );    
			return singleton;    
		}		
		public function LoadRes(str:String):void
		{
			AddRes(str);
		}
		public function AddRes(str:String):void
		{
			if (getResource(str) == null)
			{
				var gameImg:ImgFile = new ImgFile();					
				addResource(str, gameImg);
			}
		}
		public function GetRes(str:String):ImgFile
		{
			var gameImg:ImgFile = getResource(str);
			if (gameImg != null && !gameImg.beginLoad)
				gameImg.Load(str);			
			return gameImg;
		}
	}
}