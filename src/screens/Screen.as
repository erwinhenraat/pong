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
		
		[Embed(source="../../lib/runescape_uf.ttf",	
		fontName = "rune",
		mimeType = "application/x-font",
		fontWeight = "normal",
		fontStyle = "normal",
		advancedAntiAliasing = "true",
		embedAsCFF = "false")]
		private var runeFont:Class;
		
		protected var textFormat:TextFormat;
		protected var subFormat:TextFormat;
		protected var scoreFormat:TextFormat;
		
		
		public function Screen() 
		{
			textFormat = new TextFormat();
			textFormat.font = "rune";
			textFormat.size = 60;
			textFormat.color =  0xFFFF00;
			
			
			subFormat = new TextFormat();
			subFormat.font = "rune";
			subFormat.size = 30;
			subFormat.color = 0xff0000;
			
			scoreFormat = new TextFormat();
			scoreFormat.font = "rune";
			scoreFormat.size = 40;
			scoreFormat.color = 0xFFFF00;
			
		}
		
	}

}