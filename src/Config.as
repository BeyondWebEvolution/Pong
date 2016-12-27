package{
	public class Config {
		public function Config(){}
		
		public static const BLACK:uint = 0x000000;
		public static const WHITE:uint = 0xFFFFFF;
		public static const RED:uint = 0xFF0000; 
		
		public static const WORLD_WIDTH:Number = 1280;
		public static const WORLD_HEIGHT:Number = 720;
		public static const WORLD_CENTER_X:Number = WORLD_WIDTH * .5;
		public static const WORLD_CENTER_Y:Number = WORLD_HEIGHT * .5;
		
		public static const PADDLE_HEIGHT:Number = 100;
		public static const PADDLE_WIDTH:Number = 20; 
		public static const PADDLE_MARGIN:Number = 150; 
		
		public static const Ball_WIDTH:Number = 10; 
		public static const Ball_MAX_SPEED:Number = PADDLE_WIDTH-2;
		
		public static const DEFAULT_FONT:String = "ChunkFive"
	}

}