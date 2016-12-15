package 
{
	import flash.display.Sprite;
	
	
	/**entity
	 * velocity on x/y
	 * update ()
	 * boundsCheck
	 * onCollision(Entity)
	 * reset()
	 * 
	 */
	public class Entity extends Sprite {
		public function get halfHeight():Number { return height * 0.5;  }
		public function get halfWidth():Number { return width * 0.5;  }
		public function get centerY():Number {return y + (height * 0.5); }
		public function get centerX():Number {return x + (width * 0.5); }
		public function get bottom():Number{return y + height; }
		public function get right():Number{return x + width; }
		public function get left():Number{return x; }
		public function get top():Number{return y; }
		public function get radius():Number {return (width + height) * 0.25;  }

		public function set centerY(y:Number):void {this.y = y - (height * 0.5); }		
		public function set centerX(x:Number):void {this.x = x - (width * 0.5); }
		public function set bottom(n:Number):void{ y = n - height; }
		public function set right(n:Number):void{ x = n - width; }
		public function set left(n:Number):void{ x = n; }
		public function set top(n:Number):void{ y = n; }
		
		protected var _vx:Number = 0; 
		protected var _vy:Number = 0; 
		protected var _color:uint = Config.RED; 
		
		public function Entity() 
		{
			super();
			
		}
		public function reset():void{
			_vx = 0;
			_vy = 0; 
		}
		public function update():void{
			x += _vx;
			y += _vy; 
			boundsCheck(); 
		}
		
		public function destroy():void{
			//Clean up any refernce we're holding
			//remove event listeners 
			
		}
		public function boundsCheck():void{
			
		}
		public function onCollision(e:Entity):void{
			
		}
		
		
	}

}