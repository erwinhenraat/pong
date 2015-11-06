package screens 
{
	import actors.AI;
	import actors.Ball;
	import actors.Paddle;
	import actors.Player;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import utils.MovementCalculator;
	
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class GameScreen extends Screen
	{
		private var balls:Array = [];
		private var paddles:Array = [];
		public function GameScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}		
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
	
			
			for (var i:int = 0; i < 6; i++) 
			{
				balls.push(new Ball());
				addChild(balls[i]);
				balls[i].reset();
				
				balls[i].addEventListener(Ball.OUTSIDE_RIGHT, onRightOut);
				balls[i].addEventListener(Ball.OUTSIDE_LEFT, onLeftOut);
				
			}	
			paddles.push(new AI());
			paddles.push(new Player());
			paddles[0].balls = balls;
			for (i = 0; i < 2; i++) 
			{
				
				addChild(paddles[i]);
				paddles[i].y = stage.stageHeight / 2;
			}	
			paddles[0].x = stage.stageWidth - 100;
			
			paddles[1].x = 100;
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}		
		
		private function loop(e:Event):void 
		{
			checkCollision();
		}
		
	
		
		private function checkCollision():void 
		{
			for (var i:int = 0; i < balls.length; i++) 
			{
				for (var j:int = 0; j < paddles.length; j++) 
				{
					if (paddles[j].hitTestPoint(balls[i].x, balls[i].y, true))
					{
						balls[i].xMove *= -1;
					}
				}
			}
			
		}
		private function onLeftOut(e:Event):void 
		{
			var b:Ball = e.target as Ball;
			b.reset();
			
		}		
		private function onRightOut(e:Event):void 
		{
			var b:Ball = e.target as Ball;
			b.reset();
			
		}
		
			
	}

}