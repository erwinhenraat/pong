package actors 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Obstacle extends MovieClip
	{
		
		public function Obstacle() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new ObstacleArt());
			this.enabled = false;
			this.visible = false;
		
			toggle(5000 + Math.random()*3000);
		}		
		private function toggle(ms:uint = 2000):void 
		{
			var t:Timer = new Timer(ms, 1);
			t.addEventListener(TimerEvent.TIMER, onTime);
			t.start();
		}		
		private function onTime(e:TimerEvent):void 
		{
			this.enabled ? this.enabled = false : this.enabled = true;
			this.visible ? this.visible = false : this.visible = true;			
			this.x = 250 + Math.random() * stage.stageWidth - 500;  //wtf no stage?!!?!?!
			this.y = Math.random() * stage.stageHeight;
			toggle(5000 + Math.random() * 3000);
		}
		
	}

}