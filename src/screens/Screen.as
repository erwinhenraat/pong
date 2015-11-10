package screens 
{
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Screen extends MovieClip
	{
		[Embed(source = "../../lib/starjedi/Starjedi.ttf",
		fontName = "jedi", 
		mimeType = "application/x-font", 
		fontWeight="normal", 
		fontStyle="normal", 		
		advancedAntiAliasing="true", 
		embedAsCFF = "false")]		
		private var JediFont:Class;
		
		protected var textFormat:TextFormat;
		protected var subFormat:TextFormat;
		protected var scoreFormat:TextFormat;
		
		
		public function Screen() 
		{
			textFormat = new TextFormat();
			textFormat.font = "jedi";
			textFormat.size = 60;
			textFormat.color = 0xffffff;
			
			
			subFormat = new TextFormat();
			subFormat.font = "jedi";
			subFormat.size = 20;
			subFormat.color = 0xff0000;
			
			scoreFormat = new TextFormat();
			scoreFormat.font = "jedi";
			scoreFormat.size = 40;
			scoreFormat.color = 0xffffff;
			
		}
		
	}

}