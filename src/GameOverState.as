package {
	import flash.display.Sprite;
	import flash.events.Event; 
	public class GameOverState extends Sprite implements IState{
		private var _fsm:Document; 
		private var _gameOver:Label = new Label ("Game Over!", 84, Config.WHITE, Config.DEFAULT_FONT, true); 
		private var _instruxEscape:Label = new Label("Press ESC to restart", 48, Config.WHITE, Config.DEFAULT_FONT, true); 
		private var _winnerSound:SimpleSound = new SimpleSound("./assets/gameOverSound.mp3"); 
		
		public function GameOverState(fsm:Document) {
			super();
			_fsm = fsm; 
			_winnerSound.playSound(); 
			addChild(_gameOver); 
			_gameOver.x = Config.WORLD_CENTER_X - _gameOver.textWidth * .5; 
			_gameOver.y = Config.WORLD_CENTER_Y - _gameOver.textHeight; 
			
			var winnerText:String
			if (Game._leftScore > Game._rightScore){ //decides which player won and displays that player
				winnerText = "Left player wins!"; 
			}else{
				winnerText = "Right player wins!"; 
			}
			var _winner:Label =  new Label (winnerText, 48, Config.WHITE, Config.DEFAULT_FONT, true);
			addChild(_winner);
			_winner.x = Config.WORLD_CENTER_X - _winner.textWidth * .5; 
			_winner.y = _gameOver.y + _winner.textHeight + 100; 
			
			addChild(_instruxEscape);
			_instruxEscape.x = Config.WORLD_CENTER_X - _instruxEscape.textWidth * .5; 
			_instruxEscape.y = _winner.y + _instruxEscape.textHeight; 
			
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
			removeChild(_instruxEscape);
			_instruxEscape = null; 
			_winnerSound = null; 
			
		} 
	}
}