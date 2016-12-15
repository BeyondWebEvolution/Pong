package {
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	public class Key {
		private static var _itialized:Boolean = false; 
		private static var _keys:Object = {}; 
		
		public static const SERVE:uint = Keyboard.SPACE;
		public static const UPLEFT:uint = Keyboard.W;
		public static const DOWNLEFT:uint = Keyboard.S;
		public static const UPRIGHT:uint = Keyboard.O;
		public static const DOWNRIGHT:uint = Keyboard.K;
		public static const PAUSE1:uint = Keyboard.P;
		public static const PAUSE2:uint = Keyboard.Q;
		public static const EXIT:uint = Keyboard.ESCAPE;
		
		public static const RESUME:uint = Keyboard.R; 
		
		
		public function Key(){} //never call this because we will never create an instance of this class
		
		public static function init(stage:Stage):void{
			if (!_itialized){
				
				stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 0, true);
				stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp, false, 0, true);
				stage.addEventListener(Event.DEACTIVATE, onDeactivate, false, 0, true);
				_itialized = true; 
			}
		}
		
		public static function isDown(keyCode:uint):Boolean{
			
			return (keyCode in _keys); 
		}
		
		public static function onKeyDown(e:KeyboardEvent):void{
			//store key press
			
			_keys[e.keyCode] = true; 
		}
		
		public static function onKeyUp(e:KeyboardEvent):void{
			//delete /remove stored keypress
			delete _keys[e.keyCode]
		}
		
		public static function onDeactivate(e:Event):void{
			//clear all keypresses
			_keys = {}; 
		}
	}

}