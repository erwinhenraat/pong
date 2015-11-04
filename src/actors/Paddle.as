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
			this.graphics.beginFill(0x550000);
			this.graphics.drawRect(0, 0, 20, 100);
			this.graphics.endFill();
			
			
		}
		
	}

}