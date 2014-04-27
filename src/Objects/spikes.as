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
	public class spikes extends Entity 
	{
		private var _image:Image;
		private var _image2:Image;
		
		private var spikeOn:Boolean = false;
		public function spikes(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.S1);
			_image2 = new Image(GA.S2);
			_image2.centerOO();
			_image.centerOO();
			
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			layer = GC.LAYER_SPIKES;
		}
		
		override public function update():void {
			super.update();
			updateCollision();
			updateSpike();
		}
		
		protected function updateCollision():void {
			if (collide("player", x, y)) {
				spikeOn = true;
			}
		}
		
		protected function updateSpike():void {
			if (spikeOn == true) {
				if (!collide("player", x, y)) {
					type = "block";
					graphic = _image2;
				}
			}
		}
		
	}

}