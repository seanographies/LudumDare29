package Objects 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	
	public class VoidDoor extends Entity 
	{
		private var gm:GameManager = new GameManager;
		
		private var _image:Image;
		
		public function VoidDoor(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.VOIDDOOR);
			_image.centerOO();
			_image.scale = 2
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			layer = GC.LAYER_VOIDDOOR;
		}
		
		override public function update():void {
			super.update();
			updateCollision();
		}
		
		protected function updateCollision():void {
			if (collide("player", x, y)) {
				GameManager.levelTicket += 1;
				gm.changeLevel();
			}
		}
		
		
	}

}