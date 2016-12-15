package {
	import flash.events.Event;
	import flash.geom.Point;
	public class Ball extends Entity { 
		public static const EXIT_LEFT:String = "exitleft"; 
		public static const EXIT_RIGHT:String = "exitright"; 
		public static const BOUNCE:String = "bounce";
		public function Ball(){
			super();
			draw(); 
			reset(); 
		}
		
		public function serve():void{
			_vx = Utils.random(-Config.Ball_MAX_SPEED, Config.Ball_MAX_SPEED);
			_vy = Utils.random( -Config.Ball_MAX_SPEED, Config.Ball_MAX_SPEED); 
			while (_vx == 0){
				_vx = Utils.random(-Config.Ball_MAX_SPEED, Config.Ball_MAX_SPEED);
			}
			while (_vx == 0){
				_vy = Utils.random( -Config.Ball_MAX_SPEED, Config.Ball_MAX_SPEED); 
			}
			
		}
		
		override public function onCollision(e:Entity):void{
			var overlap:Point = new Point(0, 0); 
			if (Utils.getOverlap(this, e, overlap)){
				x += overlap.x; 
				y += overlap.y; 
				
				//TODO: calculare return angle (where on the paddle the ball is hitting as a percentage
				// to influence the return angle
				//trace(((centerY - e.top / e.height) - .5)); //give range -5, 5
				_vy *= -1;
				_vx *= -1;
				dispatchEvent(new Event(BOUNCE)); 
			}
			
			
		}
		private function checkInput():void{
			if (_vx != 0 && _vy != 0) {return; } 
			if (_vx == 0 && _vy == 0 && Key.isDown(Key.SERVE)){
				
				
				serve();
			}
			
		}
	
		
		override public function boundsCheck():void{
			if (top <= 0){
				top = 0; 
				_vy *= -1;
				dispatchEvent(new Event(BOUNCE)); 
			} else if (bottom > Config.WORLD_HEIGHT){
				bottom - Config.WORLD_HEIGHT; 
				_vy *= -1;
				dispatchEvent(new Event(BOUNCE)); 
			}
			
			if (left < 0){
				left = 0; 
				_vx = 0;
				dispatchEvent(new Event(EXIT_LEFT)); 
			} else if (right > Config.WORLD_WIDTH){
				right = Config.WORLD_WIDTH; 
				_vx *= 0; 
				dispatchEvent(new Event(EXIT_RIGHT));
			}
		}
		
		override public function reset():void{
				super.reset();
				centerY = Config.WORLD_CENTER_Y;
				centerX = Config.WORLD_WIDTH * .5;
		}
	
		private function draw():void{
			with(graphics){
				clear(); 
				beginFill(_color, 1); 
				drawRect(0, 0, Config.Ball_WIDTH, Config.Ball_WIDTH);
				endFill(); 	
			}
		}
		
		override public function destroy():void{
		}
		
		

	}
}