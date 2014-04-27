package Objects 
{
	import flash.media.Video;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class WholeBody extends Entity 
	{
		private var _image:Image;
		
		private var speedY:Number = 70;
		
		public var movesX:Boolean;
		public var movesY:Boolean;
		
		private const SPRITE_WIDTH:Number = 32;
		private const SPRITE_HEIGHT:Number = 32;
		private var playerSpritemap:Spritemap = new Spritemap(GA.SPRITEMAP, SPRITE_WIDTH, SPRITE_HEIGHT);
		private var curAnimation:String = "still";
		
		public function WholeBody(x:Number = 0, y:Number = 0, moveY:Boolean = false, moveX:Boolean = false) 
		{
			this.x = x;
			this.y = y;
			_image = new Image(GA.WHOLEBODY);
			_image.centerOO();
			_image.angle = 0;
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			type = "wholebody";
			movesX = new Boolean(moveX);
			movesY = new Boolean(moveY);
			layer = GC.LAYER_WHOLEBODY;
			
			playerSpritemap.add("still", [20,21,22], 6,true);
			playerSpritemap.centerOO();
			playerSpritemap.scale = 2;
			graphic = playerSpritemap;
			playerSpritemap.play(curAnimation);
			
		}
		
		override public function update():void {
			super.update();
			updateMovement();
			updateDeath();
		}
		
		protected function updateMovement():void {
			if (movesX == true) {
				updateXMovement();
			}
			
			if (movesY == true) {
				updateYMovement();
			}
		}
		
		public function updateYMovement():void {
			
			if (y < 7 && speedY < 0) speedY *= -1;
			if (y > FP.height - 7 && speedY > 1) speedY *= -1; 
			y += speedY * FP.elapsed;
			
			if (collide("Block",x,y)||collide("level",x,y)) speedY *= -1;
			
		}
		
		public function updateXMovement():void {
			
			if (x < 7 && speedY < 0) speedY *= -1;
			if (x > FP.height - 7 && speedY > 1) speedY *= -1; 
			x += speedY * FP.elapsed;
			
			if (collide("Block",x,y)||collide("level",x,y)) speedY *= -1;
			
		}
		
		protected function updateDeath():void {
			if (collide("bbullet", x, y)) {
				FP.world.remove(this);
			}
		}
		
	}
}