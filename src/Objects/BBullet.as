package Objects 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author sean singh
	 */
	public class BBullet extends Entity
	{
		private var _image:Image;
		
		private var moveX:Number = 0;
		private var moveY:Number = 0;
		
		public function BBullet() 
		{
			_image = new Image(GA.BBULLET);
			_image.centerOO();
			_image.scale = 2;
			graphic = _image;
			setHitbox( 9,9,7,6);
			type = "bbullet";
			layer = GC.LAYER_BULLET;
		}
		
		public function setMovement (_x:Number, _y:Number = 0):void {
			moveX = _x;
			moveY = _y;
		}
		
		override public function update():void {
			super.update();
			x += moveX * FP.elapsed;
			y += moveY * FP.elapsed;
			
			destroyBullet();
		}
		
		public function destroyBullet():void {
			if (collide ("level", x, y)||collide("Block",x,y)||collide ("wholebody", x, y)) {
				destroy();
			}
		}
		
		public function destroy():void {
			FP.world.recycle(this);
		}
		
	}

}