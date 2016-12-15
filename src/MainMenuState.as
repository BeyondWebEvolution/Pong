package {
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class MainMenuState extends Sprite implements IState{
		private var _fsm:Document;
		private var _label:Label = new Label ("Pong!", 184, Config.WHITE, Config.DEFAULT_FONT, true); 
		private var _playButton:SimpleButton = new SimpleButton(Assets.getImage("normal"), 
							Assets.getImage("hover"), Assets.getImage("click"), Assets.getImage("normal")); 
		private var _instructionButton:SimpleButton = new SimpleButton(Assets.getImage("instruction"), 
							Assets.getImage("instruction"), Assets.getImage("instruction"), Assets.getImage("instruction")); 
		
		private var _backgroundSFX:SimpleSound = new SimpleSound("./assets/spashscreensound.mp3"); //("./assets/splashscreensound.mp3"); 
		private var _startSFX:SimpleSound = new SimpleSound("./assets/startGame.mp3"); 
		public function MainMenuState(fsm:Document){
			super();
			_fsm = fsm;
			_backgroundSFX.playSound(); 
			addChild(_label); 
			_label.x = Config.WORLD_CENTER_X - _label.textWidth * .5; 
			_label.y = Config.WORLD_CENTER_Y - 250;
			
			addChild(_playButton);
			_playButton.x = Config.WORLD_CENTER_X - _playButton.width * .5; 
			_playButton.y = _label.y + _label.textHeight;
			_playButton.addEventListener(MouseEvent.CLICK, onClickPlay); 
			
			addChild(_instructionButton); 
			_instructionButton.x = Config.WORLD_CENTER_X - _playButton.width * .5; 
			_instructionButton.y = _playButton.y + _playButton.height; 
			_instructionButton.width = _instructionButton.width * 1.36; 
			_instructionButton.addEventListener(MouseEvent.CLICK, onClickInstruction); 
			
		}
		
		public function onClickPlay(e:MouseEvent):void {
			_startSFX.playSound(); 
			_backgroundSFX.stopSound(); 
			_fsm.changeState(Document.PLAY_STATE); 
		}
		
		public function onClickInstruction(e:MouseEvent):void{
			_fsm.changeState(Document.INSTRUCTION_STATE); 
		}
		
		public function update():void{}
		public function destroy():void{
			_fsm = null; 
			_playButton.removeEventListener(MouseEvent.CLICK, onClickPlay); 
			removeChild(_label); 
			_label = null;
			removeChild(_playButton);
			_playButton = null; 
			
			removeChild(_instructionButton);
			_instructionButton = null; 
			
			_backgroundSFX = null;
			_startSFX = null; 
		
	
		} 
	}

}