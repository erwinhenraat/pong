package actors 
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Powerup extends MovieClip
	{
		private var shape:Shape;
		public function Powerup() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			
			
			
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			shape = new Shape();
			shape.graphics.beginFill(0xff0000);
			shape.graphics.drawCircle(0, 0, 20);
			shape.graphics.endFill();
			addChild(shape);
			
			this.x = 250 + Math.random() * (stage.stageWidth-500);
			this.y = Math.random() * stage.stageHeight;
			
		}
		
	}

}