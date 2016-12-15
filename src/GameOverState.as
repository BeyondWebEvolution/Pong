package {
	import flash.display.Sprite;
	import flash.events.Event; 
	

	
	public class GameOverState extends Sprite implements IState{
		private var _fsm:Document; 
		private var _gameOver:Label = new Label ("Game Over!", 84, Config.WHITE, Config.DEFAULT_FONT, true); 
		private var _instrux:Label = new Label("Press ESC to restart", 48, Config.WHITE, Config.DEFAULT_FONT, true); 

		private var _winnerSound:SimpleSound = new SimpleSound("./assets/gameOverSound.mp3"); 
		
		public function GameOverState(fsm:Document) 
		{
			super();
			_fsm = fsm; 
			_winnerSound.playSound(); 
			addChild(_gameOver); 
			_gameOver.x = Config.WORLD_CENTER_X - _gameOver.textWidth * .5; 
			_gameOver.y = Config.WORLD_CENTER_Y - _gameOver.textHeight; 
			var winnerText:String
			if (Game._leftScore > Game._rightScore){
				winnerText = "Left player wins!"; 
			}else{
				winnerText = "Right player wins!"; 
			}
			var _winner:Label =  new Label (winnerText, 48, Config.WHITE, Config.DEFAULT_FONT, true);
			addChild(_winner);
			_winner.x = Config.WORLD_CENTER_X - _winner.textWidth * .5; 
			_winner.y = _gameOver.y + _winner.textHeight + 100; 
			
			
			addChild(_instrux);
			_instrux.x = Config.WORLD_CENTER_X - _instrux.textWidth * .5; 
			_instrux.y = _winner.y + _instrux.textHeight; 
			
		}
		
		public function update():void{
			if (Key.isDown(Key.EXIT)){
				_winnerSound.stopSound(); 
				_fsm.changeState(Document.MENU_STATE); 
				
			}
		}
		public function destroy():void{
			_fsm = null; 
			removeChild(_gameOver); 
			_gameOver = null;
			
			removeChild(_instrux);
			_instrux = null; 
			
			_winnerSound = null; 
			
		} 
	}

}