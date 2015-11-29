package actors 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import screens.GameScreen;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Obstacle extends MovieClip
	{
		private var t:Timer =  new Timer(1000);
		private var p:MovieClip;
		
		
		public function Obstacle() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new ObstacleArt());
			p = parent as MovieClip;
			onTime(null);
		}		
		private function toggle(ms:uint = 2000):void 
		{
			t.stop();
			t.delay = ms;
			t.repeatCount = 1;
			t.addEventListener(TimerEvent.TIMER, onTime);
			t.start();
		}		
		private function onTime(e:TimerEvent):void 
		{
			if (this.visible)
			{
				remove();
			}
			else
			{
				add();
			}			
			
		}
		public function remove():void
		{
			this.visible = false;
			this.x = - 1000;
			toggle(4000 + Math.random() * 4000);
			
		}
		private function add():void
		{
			this.visible = true;
			this.x = 250 + Math.random() * (stage.stageWidth - 500);
			this.y = Math.random() * stage.stageHeight;
			toggle(4000 + Math.random() * 4000);
		}
		
		public function destroy():void
		{
			t.stop();
			t.removeEventListener(TimerEvent.TIMER, onTime);
		}
		
	}

}