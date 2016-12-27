package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize; 
	import flash.text.TextFormat;
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;

	public class Game extends Sprite implements IState{
		private var _fsm:Document; 
		private var _entities:Vector.<Entity> = new Vector.<Entity>;
		private var _ball:Ball = new Ball(); 
		public static var _leftScore:Number = 0; 
		public static var _rightScore:Number = 0; 
		private var _hasServed:Boolean = false;  
		private var _bounceSFX:SimpleSound = new SimpleSound("./assets/bounce1.mp3");
		private var _serveSFX:SimpleSound = new SimpleSound("./assets/serve2.mp3"); 
		private var _scoreBoard:Label = new Label("0  :  0", 64, Config.WHITE, Config.DEFAULT_FONT, true); 
		
		//used to pause the game 
		private var _paused:Boolean = false; 
		private var _frameCount:Number = 0;//makes sure the key isn't being reread too soon after pausing/resuming and canceling out the previous action 
		private var _gamePaused:Label = new Label ("Game is paused. Press P or Q again to resume.", 42, Config.WHITE, Config.DEFAULT_FONT, true);  
		
		public function Game(fsm:Document){
			super();
			_fsm = fsm; 
			addEntity(new Paddle(true));
			addEntity(new Paddle(false)); 
			_ball.addEventListener(Ball.EXIT_LEFT, onGoal);
			_ball.addEventListener(Ball.EXIT_RIGHT, onGoal); 
			_ball.addEventListener(Ball.BOUNCE, onBounce); 
			addChild(_ball);
			addChild(_scoreBoard); 
			resetBoard(); 
		}
		
		public function onBounce(e:Event):void{
			_bounceSFX.playSound(); 
		}
		
		public function onGoal (e:Event):void{
			if (e.type == Ball.EXIT_LEFT){
				_rightScore++; 
			}else {
				_leftScore++; 
			}
			resetBoard(); 
			if (_leftScore == 11 || _rightScore == 11){
				_fsm.changeState(Document.GAME_OVER_STATE); 
				_rightScore = 0;
				_leftScore = 0; 
			}
			
		}
		
		public function resetBoard():void{
			for (var i:Number = 0; i < _entities.length; i++){
				_entities[i].reset(); 
			}
			_ball.reset(); 
			_scoreBoard.text = _leftScore + " : " + _rightScore; 
			_scoreBoard.x = Config.WORLD_CENTER_X - (_scoreBoard.textWidth * .5); 
			_hasServed = false; 
		}

		public function addEntity(e:Entity):void{
			_entities.push(e); 
			addChild(e); 
		}
		
		private function pauseGame():void{
			_paused = true;
			addChild(_gamePaused);
			_gamePaused.x = Config.WORLD_CENTER_X - _gamePaused.textWidth * .5; 
			_gamePaused.y = Config.WORLD_CENTER_Y - _gamePaused.textHeight;
			_frameCount = 0;
		}
		
		private function resumeGame():void{
			removeChild(_gamePaused); 
			_paused = false;
			_frameCount = 0;
		}
		
		public function update():void{
			_frameCount += 1; 
			if ((Key.isDown(Key.PAUSE1) && _paused == false && _frameCount > 10) || (Key.isDown(Key.PAUSE2) && _paused == false && _frameCount > 10)){//pauses game
				pauseGame(); 
			}
			if ((Key.isDown(Key.PAUSE1) && _paused == true && _frameCount > 10)|| (Key.isDown(Key.PAUSE2)&& _paused == true && _frameCount > 10)){//resumes game
				resumeGame(); 
			}
			if (_paused == true){
				return; 
			}
			if (_hasServed){
				_ball.update();  
				var entity:Entity; 
				for (var i:Number = 0; i < _entities.length; i++){
					entity = _entities[i]
					entity.update(); 
					if (isColliding(_ball, entity)){
						_ball.onCollision(entity);
					}
				}
			} else if (Key.isDown(Key.SERVE)){
				_serveSFX.playSound(); 
				_ball.serve(); 
				_hasServed = true; 
			} 
		}

		public function destroy():void{
			_ball.removeEventListener(Ball.EXIT_LEFT, onGoal);
			_ball.removeEventListener(Ball.EXIT_RIGHT, onGoal); 
			_ball.removeEventListener(Ball.BOUNCE, onBounce); 
			for (var i:Number = 0; i < _entities.length; i++){
				_entities[i].destroy(); 
				removeChild(_entities[i]); 
			}
			_entities = new Vector.<Entity>;
			_ball.destroy()
			removeChild(_ball); 
			_ball = null; 
			removeChild(_scoreBoard); 
			_scoreBoard = null; 
			_bounceSFX = null; 
			_serveSFX = null; 
			_gamePaused = null; 
		}
		
		//AABB (Axially Aligned Bounding Box) intersection test
		public function isColliding(lhs:Entity, rhs:Entity):Boolean {
			return !(lhs.right < rhs.left
					|| rhs.right < lhs.left
					|| lhs.bottom < rhs.top
					|| rhs.bottom < lhs.top);
		}
 
	}

}