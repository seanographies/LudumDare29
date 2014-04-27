package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP
	import net.flashpunk.graphics.Text;
	import Objects.Letter;
	/**
	 * ...
	 * @author sean singh
	 */
	public class GameManager 
	{
		public static var levelTicket:int;
		public function GameManager() {
			trace("GameManger is managing the game");
		}
		
		public function changeLevel():void {
			//Stage 1
			//Level 1
			if (levelTicket == 0) {
				FP.world.add(new Letter(480, 256));
			}
			if (levelTicket == 1) {
				FP.world = new GameWorld(GA.L1);
				FP.world.add(new Letter(480, 256));
				//add text for letter
				//add press Q to exit
			}
			if (levelTicket == 2) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH1);
				//add text saying x3 Hearts to type
			}
			if (levelTicket == 3) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S1L1);
			}
			if (levelTicket == 4) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S1L2);
			}
			if (levelTicket == 5) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S1L3);
			}
			if (levelTicket == 6) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH2);
				//add text saying Letter Written
			}
			if (levelTicket == 7) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.H2);
				//add image of static huu
			}
			if (levelTicket == 8) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH1);
				//add text saying x2 Hearts to type
			}
			if (levelTicket == 9) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S2L1);
			}
			if (levelTicket == 10) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S2L2);
			}
			if (levelTicket == 11) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S2B1);
			}
			if (levelTicket == 12) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S2B2);
				//add boss text
				//add boss head
			}
			if (levelTicket == 13) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH2);
				//add text saying x2 hearts found
				//add heart door 2
			}
			if (levelTicket == 14) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.H2);
			}
			if (levelTicket == 15) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.H1);
				//add letter
			}
			if (levelTicket == 16) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.L1);
				//add text for letter
			}
			if (levelTicket == 17) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.G1);
			}
			if (levelTicket == 18) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH1);
				//add text saying x3 hearts
			}
			if (levelTicket == 19) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S3L1);
			}
			if (levelTicket == 20) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S3L2);
			}
			if (levelTicket == 21) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S3B1);
			}
			if (levelTicket == 22) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S3B2);
				//add boss text
			}
			if (levelTicket == 23) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH2);
				//text add letter written
			}
			if (levelTicket == 24) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.H2);
			}
			if (levelTicket == 25) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.H1);
			}
			if (levelTicket == 26) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.L1);
			}
			if (levelTicket == 27) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH1);
				//add text saying x3 Hearts to type
			}
			if (levelTicket == 28) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S4B1);
			}
			if (levelTicket == 29) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.S4B2);
				//boss
				//boss text
			}
			if (levelTicket == 30) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH2);
				//letter written
				//heart door unlocked
			}
			if (levelTicket == 31) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.H2);
			}
			if (levelTicket == 33) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.L1);
			}
			if (levelTicket == 32) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.H1);
				//add letter
			}
			if (levelTicket == 34) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.H1);
				//got to meet it text
			}
			if (levelTicket == 35) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.BH2);
				//add full heart door
				//text: you are now free to leave
			}
			if (levelTicket == 36) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.E);
			}
			if (levelTicket == 37) {
				FP.world.removeAll();
				FP.world = new GameWorld(GA.L1);
				//add credits
			}
		}
		
		public function playerDeath():void {
			FP.world.removeAll();
			FP.world = new GameWorld(GA.D);
		}
		
	}

}