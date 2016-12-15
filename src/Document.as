package 
{
	import flash.display.NativeMenu;
	import flash.display.Sprite;
	import flash.events.Event; 
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	public class Document extends Sprite {
		public static const MENU_STATE:Number = 0;
		public static const PLAY_STATE:Number = 1;
		public static const GAME_OVER_STATE:Number = 2;
		public static const INSTRUCTION_STATE:Number = 3; 
		public static const PAUSE_STATE:Number = 4; 
		
		private var _currentState:IState;
		private var _assets:Assets; 
		
		public function Document() 
		{
			if (stage) init(); 
			else addEventListener(Event.ADDED_TO_STAGE, init); 
			
		}
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init); 
			addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true); 
			addEventListener(Event.DEACTIVATE, onDeactivate, false, 0, true); 
			Key.init(stage); 
			changeState(MENU_STATE)

			
		}
		private function onDeactivate(e:Event):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.ACTIVATE, onActivate, false, 0, true);
		}
		
		private function onActivate(e:Event):void{
			removeEventListener(Event.ACTIVATE, onActivate);
			addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
		}
		public function changeState(nextState:Number):void{
			if (_currentState != null){
				_currentState.destroy(); 
				removeChild(Sprite(_currentState));
				_currentState = null; 
			}
			if (nextState == PLAY_STATE){
				_currentState = new Game(this);
			} else if (nextState == INSTRUCTION_STATE){
				_currentState = new InstructionState(this); 
			} else if (nextState == GAME_OVER_STATE){
				_currentState = new GameOverState(this); 
			} else {//nextstate == menu_state
				_currentState = new MainMenuState(this); 
			}
			
			addChild(Sprite(_currentState));
			
			
		}
		
		private function onEnterFrame(e:Event):void{
			_currentState.update(); 
		}
	}

}