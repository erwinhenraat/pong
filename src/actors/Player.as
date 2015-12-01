package actors 
{
	import flash.filters.GlowFilter;
	import utils.Controller;	
	import flash.events.Event;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Player extends Paddle 
	{
		private var controller:Controller;
		private var speed:Number = 0;
		private var maxSpeed:Number = 15;
		
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);		
		}		
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			controller = new Controller(stage);
			this.addEventListener(Event.ENTER_FRAME, loop);	
			this.filters = [new GlowFilter(0xff0000)];
		}
		private function loop(e:Event):void 
		{
			if (controller.up)
			{
				speed = -maxSpeed;
			}
			else if(controller.down)
			{
				speed = maxSpeed;
			}else
			{
				if (speed > 0) speed--;
				if (speed < 0) speed++;
				
			}
			if (controller.fire)
			{
				
				
			}
			if (this.y < 0) this.y = 0;
			if (this.y > stage.stageHeight) this.y = stage.stageHeight;
		
			this.y += speed;
			
			
		}
		public function destroy():void
		{
			this.removeEventListener(Event.ENTER_FRAME, loop);	
			
		}
	
		
	}

}