package Objects 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Letter extends Entity 
	{
		private var _image:Image;
		private var gm:GameManager = new GameManager;
		
		public function Letter(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.LETTER);
			_image.centerOO();
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			type = "letter";
		}
		
		override public function update():void {
			super.update();
			updateCollision();
			updateCall();
		}
		
		protected function updateCollision():void {
			if (collide("player", x, y)) {
				GameManager.levelTicket += 1;
				gm.changeLevel();
			}
		}
		
		protected function updateCall():void {
			if (Input.check(Key.Q)) {
				GameManager.levelTicket += 1;
				gm.changeLevel();
			}
		}
		
	}

}