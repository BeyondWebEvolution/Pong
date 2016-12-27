package {
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event; 
	import flash.events.MouseEvent;
	
	public class InstructionState  extends Sprite implements IState{
		private var _fsm:Document; 
		private var _instructions:Label = new Label("The left player uses W to move up, S to move down, and Q to pause and unpause. \nThe right player uses O to move up, K to move down, and P to pause and unpause. \nPress 'SPACE' to serve.",  24, Config.WHITE, Config.DEFAULT_FONT, true);;
		private var _backButton:SimpleButton = new SimpleButton(Assets.getImage("back"), 
							Assets.getImage("back"), Assets.getImage("back"), Assets.getImage("back")); 
		
		
		public function InstructionState(fsm:Document){
			super();
			_fsm = fsm; 
			addChild(_instructions);
			_instructions.x = Config.WORLD_CENTER_X - _instructions.textWidth * .5; 
			_instructions.y = Config.WORLD_CENTER_Y - _instructions.textHeight; 
			
			addChild(_backButton); 
			_backButton.x =0; 
			_backButton.y =0; 
			_backButton.addEventListener(MouseEvent.CLICK, onClickBack); 
		}
		
		public function onClickBack(e:MouseEvent):void {
			_fsm.changeState(Document.MENU_STATE); 
		}
		
		public function update():void{
			if (Key.isDown(Key.EXIT)){
				_fsm.changeState(Document.MENU_STATE); 
			}
		}
		
		public function destroy():void{
			_fsm = null; 
			
			removeChild(_instructions);
			_instructions = null; 
		} 
	}
}