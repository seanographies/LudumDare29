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
	public class TypeWritter extends Entity 
	{
		private var _image:Image;
		
		public function TypeWritter(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.TYPEWRITTER);
			_image.centerOO();
			_image.scale = 2;
			graphic = _image;
			
			setHitbox(32, 32, 16, 16);
			type = "typewritter";
		}
		
	}

}