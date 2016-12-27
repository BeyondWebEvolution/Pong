package {
	import flash.display.Bitmap;
	public class Assets {
		public function Assets() {}
		
		[Embed(source = "assets/Chunkfive.otf",
			fontName = "ChunkFive", 
			mimeType = "application/x-font",
			unicodeRange = "U+0021-U+005a, U+005c-U+005f, U+0061-U+007d", 
			advancedAntiAliasing = "true", 
			embedAsCFF = "false")]
		public var ChunkFiveClass:Class; 
		
		[Embed(source = "assets/button-normal.png")]
		private static const ButtonNormal:Class;
		
		[Embed (source = "assets/button-hover.png")]
		public static const ButtonHover:Class; 
		
		[Embed(source = "assets/button-click.png")]
		public static const ButtonClick:Class;
		
		[Embed(source = "assets/Instruction-button.png")]
		public static const InstructionButton:Class;
		
		[Embed(source = "assets/Back-Button.png")]
		public static const BackButton:Class;
		
		public static function getImage(n:String):Bitmap{
			var imgClass:Class = ButtonNormal; 
			if (n == "click"){
				imgClass = ButtonClick;
			} else if (n == "hover"){
				imgClass = ButtonHover; 
			} else if ( n == "instruction"){
				imgClass = InstructionButton; 
			} else if (n == "back"){
				imgClass = BackButton; 
			} 
			return new imgClass() as Bitmap;
		}
	}
}