package lib
{
	import flash.display.Sprite;

	public class PlayerList extends NpcList
	{
		public function PlayerList()
		{
			super();
		}
		public function AddPlayer(player:OtherPlayer, spr:Sprite):void
		{
			player.InsertObj(spr);			
			addResource(player.name, player);		
		}		
	}
}