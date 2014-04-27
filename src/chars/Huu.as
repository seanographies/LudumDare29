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
	public class Huu extends Entity 
	{
		[Embed(source = "../../assets/huu.png")] public static const HUU:Class;
		private var _image:Image;
		private var _v:Point;
		private var moveSpeed:int = 200;
		
		private var gm:GameManager = new GameManager;
		
		private const SPRITE_WIDTH:Number = 32;
		private const SPRITE_HEIGHT:Number = 32;
		private var playerSpritemap:Spritemap = new Spritemap(GA.SPRITEMAP, SPRITE_WIDTH, SPRITE_HEIGHT);
		private var curAnimation:String = "still";
		
		public function Huu(p:Point) 
		{
			x = p.x;
			y = p.y;
			_v = new Point;
			
			_image = new Image(HUU);
			_image.centerOO();
			_image.scale = 2;
			graphic = _image;
			
			setHitbox(32,32,16,16);
			type = "player";
			layer = GC.LAYER_PLAYER;
			
			//spritemaps
			playerSpritemap.add("updown", [4, 5],GV.frames, true);
			playerSpritemap.add("right", [1, 2,3], GV.frames, true);
			playerSpritemap.add("left", [7, 8,9], GV.frames, true);
			playerSpritemap.add("still", [0], 0, false);
			playerSpritemap.centerOO();
			playerSpritemap.scale = 2;
			graphic = playerSpritemap;
			playerSpritemap.play(curAnimation);
			
		}
		
		override public function update():void {
			super.update();
			updateMovement();
			updateLevelCollision();
			bunnCollision();
		}
		
		protected function updateMovement():void {
			var movement:Point = new Point;
			var horizontalMovement:Boolean = true;
			var verticalMovement:Boolean = true;
			playerSpritemap.play(curAnimation);
			
			if (Input.check(Key.UP)) { movement.y--;curAnimation = "updown";}
			else if (Input.check(Key.DOWN)) { movement.y++; curAnimation = "updown"; }
			else verticalMovement = false;
			
			if (Input.check(Key.LEFT)) { movement.x--;curAnimation = "left"; }
			else if (Input.check(Key.RIGHT)) { movement.x++; curAnimation = "right"; }
			else horizontalMovement = false;
			
			if ((!verticalMovement) && (!horizontalMovement))
			{
				curAnimation = "still";
			}
			
			if (Input.check(Key.R)) { gm.changeLevel(); };
			_v.x = movement.x * FP.elapsed * moveSpeed;
			_v.y = movement.y * FP.elapsed * moveSpeed;
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
		
		protected function bunnCollision():void {
			if (collide("player", x, y)) {
				GameManager.levelTicket += 1;
				gm.changeLevel();
				trace("roll the credits");
			}
		}
		
	}

}