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
	public class Block extends Entity 
	{
		private var _image:Image;
		public function Block(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.BLOCK);
			_image.centerOO();
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			type = "block";
			layer = GC.LAYER_BLOCK;
		}
		
		override public function update():void {
			super.update();
			updateCollision();
		}
		
		protected function updateCollision():void {
			if (collide("bbullet", x, y)) {
				FP.world.remove(this);
			}
		}
		
	}

}