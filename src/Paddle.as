package {
	import flash.display.Sprite;
	import flash.ui.Keyboard;
	public class Paddle extends Entity{
		private var _isLeft:Boolean = false; 
		private var _acceleration:Number = 0; 
		private var _baseSpeed:Number = 5; 
		private var _friction:Number = .9
		public function Paddle(isLeft:Boolean) 
		{
			super();
			_isLeft = isLeft; 
			draw();
			reset(); 
		}
		
		override public function reset():void{
			super.reset(); 	
			centerY = Config.WORLD_CENTER_Y
			if (_isLeft){
				x = Config.PADDLE_MARGIN; 
			}else{
				x = Config.WORLD_WIDTH - (Config.PADDLE_MARGIN +width); 
			}
		}
		
		private function checkInput():void{
			if (_isLeft){
				_vy = 0
				if (Key.isDown(Key.DOWNLEFT)){
					_vy = 15; 
				}
				if (Key.isDown(Key.UPLEFT)){
					_vy = -15;
				}
			} else {
				_vy = 0
				if (Key.isDown(Key.DOWNRIGHT)){
					_vy = 15; 
				}
				if (Key.isDown(Key.UPRIGHT)){
					_vy = -15;
				}
			}
		}
		
		override public function update():void{
			checkInput(); 
			super.update();
			boundsCheck(); 
		}
		
		override public function boundsCheck():void{
			if (top < 0){
				top = 0; 
			} else if (bottom > Config.WORLD_HEIGHT){
				bottom = Config.WORLD_HEIGHT; 
			}
		}
		
		private function draw():void{
			graphics.clear(); 
			graphics.beginFill(_color, 1); 
			graphics.drawRect(0, 0, Config.PADDLE_WIDTH, Config.PADDLE_HEIGHT);
			graphics.endFill(); 
		}
	
		public function readInput():void{
			
		}
	}
}