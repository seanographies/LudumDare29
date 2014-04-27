package 
{
import net.flashpunk.Engine;
import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(800, 600, 60, false);
			trace("Flashpunk is working");
		}
		
		override public function init():void {
			super.init();
			//FP.console.enable();
			FP.world = new GameWorld(GA.H1);
			FP.screen.color = 0x990033;
		}
		
	}
	
}