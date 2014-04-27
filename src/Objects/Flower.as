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
	public class Flower extends Entity 
	{
		private var _image:Image;
		public function Flower(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.FLOWER);
			_image.centerOO();
			_image.scale = 2;
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			type = "flower";
		}
		
		override public function update():void {
			super.update();
			updateCollison();
		}
		
		protected function updateCollison():void {
			if (collide("player", x, y)) {
				FP.world.remove(this);
			}
		}
		
	}

}