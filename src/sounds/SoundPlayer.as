package sounds 
{
	import flash.media.Sound;
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import screens.*;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class SoundPlayer 
	{
		private var _sounds:Array = [];
		private var _channel:SoundChannel;
		private var _main:Main;
		public function SoundPlayer(main:Main):void
		{
			_main = main;			
			
			loadSound("../lib/pong.mp3");			
			loadSound("../lib/pong2.mp3");			
			loadSound("../lib/pong3.mp3");	
			loadSound("../lib/lose.mp3");	
			loadSound("../lib/intro.mp3");	
						
			_main.addEventListener(GameScreen.BALL_BOUNCE, onBounce, true);
			_main.addEventListener(GameScreen.GAME_OVER, onGameOver, true);
			_main.addEventListener(IntroScreen.START_GAME, onIntro, true);
			
		}
		
		private function onIntro(e:Event):void 
		{
			playSound(4);
		}
		
		private function onGameOver(e:Event):void 
		{
			playSound(3);
		}		
		private function onBounce(e:Event):void 
		{
			playSound(Math.floor(Math.random() * 3));
		}
		private function loadSound(file:String):void
		{
			_sounds.push(new Sound(new URLRequest(file)));
				
		}
		private function playSound(index:int, loops:int = 1, volume:Number = 1, pan:Number = 0):void
		{
			if (index > _sounds.length - 1)
			{
				trace("referenced sound is not loaded");				
			}
			else
			{			
				var transform:SoundTransform = new SoundTransform(volume, pan);
				_channel = _sounds[index].play(0, loops);
				_channel.soundTransform = transform;
			}			
		}	
		
	}

}