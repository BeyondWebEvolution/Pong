package 
{

	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	

	public class SimpleSound implements IState{
		private var _sound:Sound;
		private var _channel:SoundChannel; 
		public function SimpleSound(url:String){
			super();
			_sound = new Sound(new URLRequest(url));
		}
		
		public function playSound ():void{
			_channel =  _sound.play(); 
			var transform:SoundTransform = new SoundTransform(1, 0); 
			var leftSize:Number = Config.PADDLE_MARGIN + Config.PADDLE_WIDTH;
			var rightSize:Number = Config.WORLD_WIDTH - Config.PADDLE_MARGIN + Config.PADDLE_WIDTH; 
			_channel.soundTransform = transform; 
		}
		
		public function stopSound():void{
			_channel.stop();
		}
		
		public function update():void{
		}

		public function destroy():void{
			_sound = null; 
			_channel = null; 
		}
	
 
	}

}