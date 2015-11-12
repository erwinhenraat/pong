package actors 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.display.Stage;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import utils.MovementCalculator;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Ball extends MovieClip 
	{
		private var _movement:Point;
		public static const OUTSIDE_RIGHT:String = "outside right";
		public static const OUTSIDE_LEFT:String = "outside left";
		public function set movement(m:Point):void
		{
			_movement = m;
		}
		public function get xMove():Number
		{
			return _movement.x;			
		}
		public function set xMove(move:Number):void
		{
			_movement.x = move;
			
		}
		public function Ball() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new BallArt());
			movement = new Point(0, 0);
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		public function reset():void
		{
			this.x = stage.stageWidth / 2;
			this.y = stage.stageHeight / 2;
			_movement = new Point(0, 0);
			var t:Timer = new Timer(500, 1);
			t.addEventListener(TimerEvent.TIMER_COMPLETE, restart);
			t.start();
		}
		
		private function restart(e:TimerEvent):void 
		{
			_movement = MovementCalculator.calculateMovement(10 + Math.random() * 10, Math.random() * 360);
			if (_movement.x > 0 && _movement.x < 0.2) _movement.x += 0.2;
			if (_movement.x < 0 && _movement.x > -0.2) _movement.x -= 0.2;
		}
		private function loop(e:Event):void 
		{
			this.x += _movement.x;
			this.y += _movement.y;
			
			if (this.y <= 0 || this.y >= stage.stageHeight)
			{
				_movement.y *= -1;
				
			}
			if (this.x > stage.stageWidth)
			{
				dispatchEvent(new Event(Ball.OUTSIDE_RIGHT));
			}
			if (this.x < 0)
			{
				dispatchEvent(new Event(Ball.OUTSIDE_LEFT));
			}
		}
		public function destroy():void
		{
			this.removeEventListener(Event.ENTER_FRAME, loop);
			
		}
		
	}

}