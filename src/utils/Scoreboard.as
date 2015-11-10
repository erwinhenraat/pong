package utils 
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.events.Event;
	import screens.Screen;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Scoreboard extends Screen
	{
		private var _scores:Array = [];
		private var left:TextField;
		private var right:TextField;		
		
		public function set player1(value:Number):void
		{
			_scores[0] = value;
			if (value < 10) { left.text  = "0" + String(value); } else { left.text = String(value); }
			left.setTextFormat(scoreFormat);
		}
		public function set player2(value:Number):void
		{
			_scores[1] = value;
			if (value < 10) { right.text  = "0" + String(value); } else { right.text = String(value); }
			right.setTextFormat(scoreFormat);
		
		}
		public function get player1():Number
		{
			return _scores[0];			
		}
		public function get player2():Number
		{
			return _scores[1];			
		}
		public function Scoreboard() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);			
		}		
		private function init(e:Event):void 
		{
			_scores = [0,0];
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
					
			
			left = new TextField();			
			left.embedFonts = true;		
			left.autoSize = TextFieldAutoSize.CENTER;
			left.text  = "00";
			
			left.setTextFormat(scoreFormat);
			left.border = false;
			left.borderColor = 0xffffff;
			
			left.x = stage.stageWidth / 2 - 30 - left.width;
			addChild(left);
		
			right = new TextField();			
			right.embedFonts = true;	
			right.autoSize = TextFieldAutoSize.CENTER;
			right.text  = "00";
			
			right.setTextFormat(scoreFormat);
			right.border = false;
			right.borderColor = 0xffffff;
			
			right.x = stage.stageWidth / 2 + 30;
			addChild(right);
			
			var line:Shape = new Shape();
			line.graphics.beginFill(0xffffff, 1);
			line.graphics.drawRect( -2, 0, 4, 60);
			line.graphics.endFill();
			line.x = stage.stageWidth / 2;
			
			addChild(line);
		}
		
	}

}