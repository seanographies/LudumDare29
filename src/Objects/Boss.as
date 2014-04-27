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
	public class Boss extends Entity 
	{
		private var _image:Image;
		
		public function Boss(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.BOSS);
			_image.centerOO();
			_image.scale = 9;
			graphic = _image;
		}
		
	}

}