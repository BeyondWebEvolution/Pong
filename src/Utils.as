package {
	import flash.geom.Point;
	public class Utils {
		public function Utils(){}
		
		public static function random(min:Number, max:Number):Number{
			return Math.random() * (max - min + 1) + min; 
		}
		
		//SAT intersection test. http://www.metanetsoftware.com/technique/tutorialA.html
		//returns true on intersection, and sets the least intersecting axis in overlap
		public static function getOverlap(e1:Entity, e2:Entity, overlap:Point):Boolean {
			overlap.setTo(0, 0);
			var centerDeltaX:Number = e1.centerX - e2.centerX;
			var halfWidths:Number = (e1.width + e2.width) * 0.5;
			if (Math.abs(centerDeltaX) > halfWidths){//no overlap on x == no collision
				return false; 
			}
			var centerDeltaY:Number = e1.centerY - e2.centerY;
			var halfHeights:Number = (e1.height + e2.height) * 0.5;
			if (Math.abs(centerDeltaY) > halfHeights){//no overlap on y == no collision
				return false; 
			}
			var dx:Number = halfWidths - Math.abs(centerDeltaX); //overlap on x
			var dy:Number = halfHeights - Math.abs(centerDeltaY); //overlap on y
			if (dy < dx) {
				overlap.y = (centerDeltaY < 0) ? -dy : dy;
			} else if (dy > dx) {
				overlap.x = (centerDeltaX < 0) ? -dx : dx;
			} else {
				overlap.x = (centerDeltaX < 0) ? -dx : dx;
				overlap.y = (centerDeltaY < 0) ? -dy : dy;
			}
			return true;
		}
		
	}

}