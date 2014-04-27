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
	public class GrassPatch extends Entity 
	{
		
		private var _image:Image;
		private var _image2:Image;
		private var grassOn:Boolean = false;
		
		public function GrassPatch(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.GP1);
			_image.centerOO();
			_image.scale = 2;
			_image2 = new Image(GA.GP2);
			_image2.centerOO();
			_image2.scale = 2;
			
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			layer = GC.LAYER_SPIKES;
		}
		
		override public function update():void {
			super.update();
			updateCollision();
			updateGrass();
		}
		
		protected function updateCollision():void {
			if (collide("player", x, y)) {
				grassOn = true;
			}
		}
		
		protected function updateGrass():void {
			if (grassOn == true) {
				if (!collide("player", x, y)) {
					graphic = _image2;
				}
			}
		}
		
		
	}

}