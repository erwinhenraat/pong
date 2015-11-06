package utils 
{
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author erwin henraat
	 * 
	 * use constructor to set controls
	 * use properties up, down and fire to check buttonstates
	 * 
	 * 
	 */
	public class Controller extends EventDispatcher
	{
		private var _up:Boolean;
		private var _down:Boolean;
		private var _fire:Boolean;
		private var _upKeyCode:int;
		private var _downKeyCode:int;
		private var _fireKeyCode:int;
		
		
		public function Controller(stage:Stage, up:int = Keyboard.UP, down:int = Keyboard.DOWN, fire:int = Keyboard.SPACE) 
		{
			_upKeyCode = up;
			_downKeyCode = down;
			_fireKeyCode = fire;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onUp);
			
		}
		public function get up():Boolean
		{
			return _up;			
		}
		public function get down():Boolean
		{
			return _down;			
		}
		public function get fire():Boolean
		{
			return _fire;			
		}
		private function onUp(e:KeyboardEvent):void 
		{
			switch(e.keyCode)
			{
				case _upKeyCode:
					_up = false;
					break;
				case _downKeyCode:
					_down = false;
					break;
				case _fireKeyCode:
					_fire = false;
					break;
				
			}
		}		
		private function onDown(e:KeyboardEvent):void 
		{			
			switch(e.keyCode)
			{
				case _upKeyCode:
					_up = true;
					break;
				case _downKeyCode:
					_down = true;
					break;
				case _fireKeyCode:
					_fire = true;
					break;
				
			}
		}
		
	}

}