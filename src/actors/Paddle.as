package actors 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Paddle extends MovieClip 
	{
		
		public function Paddle() 
		{
			addChild(new PaddleArt());
		}
		
	}

}