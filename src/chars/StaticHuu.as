package chars 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class StaticHuu extends Entity 
	{
		private var _image:Image;
		public function StaticHuu(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			_image = new Image(GA.HU);
			_image.centerOO();
			_image.scale = 2;
			graphic = _image;
		}
		
	}

}