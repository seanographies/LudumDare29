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
	public class Turret extends Entity 
	{
		private var _image:Image;
		
		private var shootDelay:Number;
		
		public function Turret(x:Number = 0, y:Number = 0) 
		{
			this.x = x;
			this.y = y;
			_image = new Image(GA.TURRET);
			_image.centerOO();
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			type = "turret";
			layer = GC.LAYER_TURRET;
		}
		
		override public function update():void {
			super.update();
			updateFire();
		}
		
		public function updateFire():void {
			if (shootDelay > 0) shootDelay -= FP.elapsed;
			else {
				var newBullet:Bullet = FP.world.create(Bullet) as Bullet;
				newBullet.x = x;
				newBullet.y = y;
				newBullet.setMovement( 0, GV.BULLETMOVEMENT);
				
				var newBullet2:Bullet = FP.world.create(Bullet) as Bullet;
				newBullet2.x = x;
				newBullet2.y = y;
				newBullet2.setMovement( 0, -GV.BULLETMOVEMENT);
				
				var newBullet3:Bullet = FP.world.create(Bullet) as Bullet;
				newBullet3.x = x;
				newBullet3.y = y;
				newBullet3.setMovement( GV.BULLETMOVEMENT, 0);
				
				var newBullet4:Bullet = FP.world.create(Bullet) as Bullet;
				newBullet4.x = x;
				newBullet4.y = y;
				newBullet4.setMovement( -GV.BULLETMOVEMENT, 0);
				
				FP.world.add(newBullet);
				FP.world.add(newBullet2);
				FP.world.add(newBullet3);
				FP.world.add(newBullet4);
				
				shootDelay = 2.2;
				
			}
		}
	}

}