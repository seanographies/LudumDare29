package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class TextBubble extends Entity 
	{
		
		public function TextBubble(_x:Number=0, _y:Number=0,textWords:String="", tSize:int = 12, tColor:uint = 0xFFCC00)
		{
			x = _x;
			y = _y;
			
			var t:Text = new Text(textWords);
			t.size = tSize;
			t.color = tColor;
			graphic = t;
			layer = GC.LAYER_BLOCK;
		}
		
	}

}