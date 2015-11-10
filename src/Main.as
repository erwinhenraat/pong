package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import screens.GameScreen;
	import screens.IntroScreen;
	
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Main extends Sprite 
	{
		private var gameScreen:GameScreen
		private var introScreen:IntroScreen;
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point			
			
			buildIntroSreen();
			
		}
		private function buildIntroSreen():void
		{			
			introScreen = new IntroScreen();
			addChild(introScreen);
			introScreen.addEventListener(IntroScreen.START_GAME, startGame);
		}
		private function startGame(e:Event):void 
		{
			removeChild(introScreen);
			gameScreen = new GameScreen();
			addChild(gameScreen);
			gameScreen.addEventListener(GameScreen.GAME_OVER, onGameOver);
		}
		
		private function onGameOver(e:Event):void 
		{
			removeChild(gameScreen);
			gameScreen = null;			
			buildIntroSreen();
			
		}
		
	}
	
}