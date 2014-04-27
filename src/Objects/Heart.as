package Objects 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Heart extends Entity 
	{
		private var _image:Image;
		
		public function Heart(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.HEART);
			_image.centerOO();
			_image.scale = 2;
			graphic = _image;
			
			setHitbox(16,16,8,8);
			type = "heart";
			layer = GC.LAYER_HEART;
		}
		
		override public function update():void {
			super.update();
			updateCollision();
		}
		
		//TODO: add in particle effect/sound later on
		protected function updateCollision():void {
			if (collide("player", x, y)) {
				FP.world.remove(this);
			}
		}
		
	}

}