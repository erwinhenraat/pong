package screens 
{
	import actors.Paddle;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class GameScreen extends Screen
	{
		
		public function GameScreen() 
		{
			addChild(new Paddle());
		}
		
	}

}