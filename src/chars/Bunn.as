package chars 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import Objects.BBullet;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Bunn extends Entity 
	{
		[Embed(source = "../../assets/bunn.png")] private static const BUNN:Class;
		private var _image:Image;
		private var _v:Point;
		private var moveSpeed:int = 200;
		
		private var shootDelay:Number;
		private var finalShootDelay:Number = .2;
		private var shootRight:Boolean;
		private var shootLeft:Boolean;
		private var shootUp:Boolean;
		private var shootDown:Boolean;
		
		private var gm:GameManager = new GameManager;
		
		private const SPRITE_WIDTH:Number = 32;
		private const SPRITE_HEIGHT:Number = 32;
		private var playerSpritemap:Spritemap = new Spritemap(GA.SPRITEMAP, SPRITE_WIDTH, SPRITE_HEIGHT);
		private var curAnimation:String = "still";
		
		public function Bunn(p:Point) 
		{
			x = p.x;
			y = p.y;
			_v = new Point;
			
			
			setHitbox(32,32,16,16);
			type = "player";
			layer = GC.LAYER_PLAYER;
			
			//spritemaps
			playerSpritemap.add("updown", [18, 19],GV.frames, true);
			playerSpritemap.add("right", [11, 12,13], GV.frames, true);
			playerSpritemap.add("left", [14, 15,16], GV.frames, true);
			playerSpritemap.add("still", [10], 0, false);
			playerSpritemap.centerOO();
			playerSpritemap.scale = 2;
			graphic = playerSpritemap;
			playerSpritemap.play(curAnimation);
			
		}
		
		override public function update():void {
			super.update();
			updateMovement();
			updateLevelCollision();
			updateBlockCollision();
			updateFire();
			updateDirection();
			updateDeath();
		}
		
		protected function updateMovement():void {
			var movement:Point = new Point;
			var horizontalMovement:Boolean = true;
			var verticalMovement:Boolean = true;
			playerSpritemap.play(curAnimation);
			
			if (Input.check(Key.UP)) { movement.y--; shootUp = true; curAnimation = "updown"; }
			else if (Input.check(Key.DOWN)) { movement.y++; shootDown = true;  curAnimation = "updown"; }
			else verticalMovement = false;
			
			if (Input.check(Key.LEFT)) { movement.x--; shootLeft = true;  curAnimation = "left";}
			else if (Input.check(Key.RIGHT)) { movement.x++; shootRight = true; curAnimation = "right"; }
			else horizontalMovement = false;
			
			if ((!verticalMovement) && (!horizontalMovement))
			{
				curAnimation = "still";
			}
			
			if (Input.check(Key.R)) { gm.changeLevel();};
			_v.x = movement.x * FP.elapsed * moveSpeed;
			_v.y = movement.y * FP.elapsed * moveSpeed;
			
		}
		
		protected function updateDirection():void {
			shootUp = true;
			shootDown = false;
			shootLeft = false;
			shootRight = false;
		}
		
		private function updateLevelCollision():void {
			x += _v.x;
			if (collide ("level", x, y)) {
				if (FP.sign(_v.x) > 0) {
					_v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32 - width;
                    }else {
                         _v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32;
                    }
               }
            y += _v.y;
            if (collide ("level", x, y)) {
                if (FP.sign(_v.y) > 0){
                    _v.y - 0;
						y = Math.floor (y / 32) * 32 + 32 - height;
                }else {
					_v.y - 0;
						y = Math.floor (y / 32) * 32 + 32;
                }
			}
		}
		
		private function updateBlockCollision():void {
			if (collide ("block", x, y)||collide("turret",x,y)) {
				if (FP.sign(_v.x) > 0) {
					_v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32 - width;
                    }else {
                         _v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32;
                    }
               }
            if (collide ("block", x, y)||collide("turret",x,y)) {
                if (FP.sign(_v.y) > 0){
                    _v.y - 0;
						y = Math.floor (y / 32) * 32 + 32 - height;
                }else {
					_v.y - 0;
						y = Math.floor (y / 32) * 32 + 32;
                }
			}
		}
		
		protected function updateFire():void {
			if (Input.check(Key.Z)) {
				if (shootDelay > 0) shootDelay -= FP.elapsed;
				else {
					var newBullet:BBullet = FP.world.create(BBullet) as BBullet;
					newBullet.x = x;
					newBullet.y = y;
					
					if (shootUp == true) {
					newBullet.setMovement( 0, -GV.BBULLETMOVEMENT);
					FP.world.add(newBullet);
					shootDelay = finalShootDelay;
					}
					if (shootDown == true) {
					newBullet.setMovement( 0, GV.BBULLETMOVEMENT);
					FP.world.add(newBullet);
					shootDelay = finalShootDelay;
					}
					if (shootLeft == true) {
					newBullet.setMovement( -GV.BBULLETMOVEMENT, 0);
					FP.world.add(newBullet);
					shootDelay = finalShootDelay;
					}
					if (shootRight == true) {
					newBullet.setMovement( GV.BBULLETMOVEMENT, 0);
					FP.world.add(newBullet);
					shootDelay = finalShootDelay;
					}
				}
			}
		}
		
		protected function updateDeath():void {
			if (collide("wholebody", x, y) || collide("bullet", x, y)) {
				gm.playerDeath();
			}
		}
		
	}

}