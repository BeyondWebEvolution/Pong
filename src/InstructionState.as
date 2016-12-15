package {
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event; 
	import flash.events.MouseEvent;
	
	public class InstructionState  extends Sprite implements IState{
		private var _fsm:Document; 
		
		private var _instrux0:Label = new Label("The object of the game is to score points by getting the ball to hit the wall on your oponent's side.", 24, Config.WHITE, Config.DEFAULT_FONT, true); 
		private var _instrux1:Label = new Label("The right player uses W to move up, S to move down, and Q to pause.", 24, Config.WHITE, Config.DEFAULT_FONT, true);
		private var _instrux2:Label = new Label("The left player uses O to move up, K to move down, and P to pause.", 24, Config.WHITE, Config.DEFAULT_FONT, true); 
		private var _instrux3:Label = new Label("Press space to serve. ", 24, Config.WHITE, Config.DEFAULT_FONT, true); 
		private var _instrux4:Label = new Label("The first player to 11 wins.", 24, Config.WHITE, Config.DEFAULT_FONT, true); 
		private var _backButton:SimpleButton = new SimpleButton(Assets.getImage("back"), 
							Assets.getImage("back"), Assets.getImage("back"), Assets.getImage("back")); 
		
		
		public function InstructionState(fsm:Document) 
		{
			super();
			_fsm = fsm; 
			addChild(_instrux0);
			_instrux0.x = Config.WORLD_CENTER_X - _instrux0.textWidth * .5; 
			_instrux0.y = Config.WORLD_CENTER_Y + _instrux0.textHeight; 
			
			addChild(_instrux1);
			_instrux1.x = Config.WORLD_CENTER_X - _instrux1.textWidth * .5; 
			_instrux1.y = _instrux0.y + _instrux1.textHeight; 
			
			addChild(_instrux2);
			_instrux2.x = Config.WORLD_CENTER_X - _instrux2.textWidth * .5; 
			_instrux2.y = _instrux1.y + _instrux2.textHeight; 
			
			addChild(_instrux3); 
			_instrux3.x = Config.WORLD_CENTER_X - _instrux3.textWidth * .5; 
			_instrux3.y = _instrux2.y + _instrux2.textHeight; 
			
			addChild(_instrux4); 
			_instrux4.x = Config.WORLD_CENTER_X - _instrux4.textWidth * .5; 
			_instrux4.y = _instrux3.y + _instrux3.textHeight; 
			
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
			
			removeChild(_instrux0);
			_instrux0 = null; 
			removeChild(_instrux1);
			_instrux1 = null; 
			removeChild(_instrux2);
			_instrux2 = null; 
			
			removeChild(_instrux3); 
			_instrux3 = null; 
			removeChild(_instrux4); 
			_instrux4 = null; 
			removeChild(_backButton);
			_backButton = null;
		} 
	}

}