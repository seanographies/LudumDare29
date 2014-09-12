package  
{
	import chars.Bunn;
	import chars.Huu;
	import chars.StaticHuu;
	import flash.display.Graphics;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import Objects.Block;
	import Objects.Boss;
	import Objects.EarthDoor;
	import Objects.Flower;
	import Objects.GrassPatch;
	import Objects.Heart;
	import Objects.Letter;
	import Objects.spikes;
	import Objects.Turret;
	import Objects.TypeWritter;
	import Objects.VoidDoor;
	import Objects.WholeBody;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class GameWorld extends World 
	{
		protected var map:Entity
		public var _mapGrid:Grid
		public var _mapImage:Image;
		protected var _mapData:Class;
		
		protected var bunn:Bunn;
		protected var huu:Huu;
		
		public function GameWorld(mapData:Class) 
		{
			_mapData = mapData;
			super(); 
			loadMap(_mapData);
          _mapImage = new Image(_mapGrid.data);
		  _mapImage.color = 0x000000;
		  _mapImage.scale = 32;
           map = new Entity (_mapGrid.x,_mapGrid.y, _mapImage, _mapGrid);
		   map.setHitbox(_mapGrid.width,_mapGrid.height);
		   map.type = "level";
		   map.layer = GC.LAYER_LEVEL;
		}
		
		override public function begin():void {
			super.begin();
			add(map);
			worldAddon();
			//add(bunn);
			//add(huu);
		}
		
		protected function loadMap(mapData:Class):void {
			var mapXML:XML = FP.getXML (mapData);
			var node:XML;
			
		//map grid	
            _mapGrid = new Grid(uint(mapXML.@width), (uint(mapXML.@height)), 32,32,-16,-16);
            _mapGrid.loadFromString(String(mapXML.tiles32), "", "\n");
		//objects
			//bunn = new Bunn(new Point(Number (mapXML.Objects.Bunn.@x), (Number(mapXML.Objects.Bunn.@y))));
			//huu = new Huu(new Point(Number (mapXML.Objects.Huu.@x), (Number(mapXML.Objects.Huu.@x))));
			
			//bunn
			for each (node in mapXML.Objects.Bunn) {
				add(new Bunn(new Point(Number(node.@x), Number(node.@y))));
			}			
			//huu
			for each (node in mapXML.Objects.Huu) {
				add(new Huu(new Point(Number(node.@x), Number(node.@y))));
			}
			//heart
			for each (node in mapXML.Objects.Heart) {
				add(new Heart(int(node.@x), int(node.@y)));
			}
			//turret
			for each (node in mapXML.Objects.Turret) {
				add(new Turret(int(node.@x), int(node.@y)));
			}
			//voidoor
			for each (node in mapXML.Objects.Voiddoor) {
				add(new VoidDoor(int(node.@x), int(node.@y)));
			}
			//block
			for each (node in mapXML.Objects.Block) {
				add(new Block(int(node.@x), int(node.@y)));
			}
			//earthdoor
			for each (node in mapXML.Objects.Earthdoor) {
				add(new EarthDoor(int(node.@x), int(node.@y)));
			}
			//grasspatch
			for each (node in mapXML.Objects.Grasspatch) {
				add(new GrassPatch(int(node.@x), int(node.@y)));
			}
			//flower
			for each (node in mapXML.Objects.Flower) {
				add(new Flower(int(node.@x), int(node.@y)));
			}
			//spikes
			for each (node in mapXML.Objects.Spikes) {
				add(new spikes(int(node.@x), int(node.@y)));
			}
			//boss
			for each (node in mapXML.Objects.Boss) {
				add(new Boss(int(node.@x),int(node.@y)));
			}
			//typewritter
			for each (node in mapXML.Objects.Typewritter) {
				add(new TypeWritter(int(node.@x), int(node.@y)));
			}
			//death instructions
			for each (node in mapXML.Objects.Death) {
				add(new TextBubble(Number(node.@x),Number(node.@y),"A complimetary Void fast travel for your despair, R to engage",12));
			}
			//wholebodyX
			for each (node in mapXML.Objects.WholebodyX) {
				add(new WholeBody(int(node.@x), int(node.@y),false,true));
			}
			//wholebodyY
			for each (node in mapXML.Objects.WholebodyY) {
				add(new WholeBody(int(node.@x), int(node.@y),true,false));
			}
			
			//tilesheet parse
			//if (String(mapXML.Tiles).length > 0) {
				//var tm:Tilemap = new Tilemap(GA.TILES,_mapGrid.width,_mapGrid.height,32,32);
				//tm.loadFromString(mapXML.Tiles, ",", "/n");
				//save tilemap as the map image.
				//_mapImage = tm;
			//}
			
		}
		
		protected function worldAddon():void {
			if (GameManager.levelTicket == 0) {
				FP.world.add(new Letter(480, 256));
				FP.world.add(new TextBubble(224, 128, "A letter?",20));
			}
			if (GameManager.levelTicket == 1) {
				FP.world.add(new Letter(10, 500));
				FP.world.add(new TextBubble(32, 32, "Dearest Love,",20));
				FP.world.add(new TextBubble(32, 64, "I remember the first time our eyes met. I was walking up the stairs\n and i saw you coming the opposite direction.I took a quick glance\n and that was it, i knew i was in love.After then i would always make \nthe effort to see you everyday, be in the same room as you, know\n where you are.I also got used to recognizing your friends.\nWherever they were, i would always look for you.As the days pass,\n i long for you to be with me, to share, even the simpliest things\n with. When im at home, watching movies on my laptop, i think of us,\n in each others arms.Sometimes when i dont see you during the day,\n i miss you. Im too shy to talk to you, everytime i want to, something \n tells me im not good enough or you may not like me.\n So this is why i am writing to you now.\n I want you to know that out there someone loves you.\n From,\n Your love.",20));
				FP.world.add(new TextBubble(32, 500, "press q to close",20));
			}
			if (GameManager.levelTicket == 2) {
				FP.world.add(new TextBubble(256, 250, "Love Letter for: 3x Hearts",12));
				FP.world.add(new TextBubble(160, 128, "Who would have known? The cheapest way to get out was to be a love letter typer.",12));
			}
			if (GameManager.levelTicket == 4) {
				FP.world.add(new TextBubble(250, 64, "Press Z while moving in a direction to get a new Cigarette",12));
			}
			if (GameManager.levelTicket == 6) {
				FP.world.add(new TextBubble(256, 250, "Letter Written",12));
				FP.world.add(new TextBubble(160, 128, "The alienated ones are the easiest to get.",12));
			}
			if (GameManager.levelTicket == 7) {
				FP.world.add(new StaticHuu(352,288));
			}
			if (GameManager.levelTicket == 8) {
				FP.world.add(new TextBubble(256, 250, "Love Letter for: 2x Hearts",12));
			}
			if (GameManager.levelTicket == 9) {
				FP.world.add(new TextBubble(64, 480, "Eaten souls are easily broken with my Cigarettes",12));
			}
			if (GameManager.levelTicket == 12) {
				FP.world.add(new TextBubble(32, 32, "You think a stupid love letter type writter \n and a innocent Human will save you?\n I know what you are trying to do\n and its not going to work and if it does\n it'll take too long and\nyou'll probably die of lung cancer.",16));
			}
			if (GameManager.levelTicket == 13) {
				FP.world.add(new TextBubble(256, 250, "Letter Written",12));
			}
			if (GameManager.levelTicket == 17) {
				FP.world.add(new TextBubble(416, 32, "Violets are blue.",20));
			}
			if (GameManager.levelTicket == 14) {
				FP.world.add(new StaticHuu(352,288));
			}
			if (GameManager.levelTicket == 15) {
				FP.world.add(new Letter(480, 256));
			}
			if (GameManager.levelTicket == 16) {
				FP.world.add(new Letter(10, 500));
				FP.world.add(new TextBubble(32, 32, "Dearest Love,",20));
				FP.world.add(new TextBubble(32, 64, "I saw you just the other day,\n you were wearing that green top\n I really want to meet you.I am slowly becoming more confident.\nI dont have many friends,\n So i dont know much about relationships.\n I have never been with anyone before, this is new to me.\n But i am going to meet you soon.\n I hope when i meet you i am ready, just as much as you are.\n From,\n Mystery Lover",20));
				FP.world.add(new TextBubble(32, 500, "press q to close",20));
			}
			if (GameManager.levelTicket == 18) {
				FP.world.add(new TextBubble(256, 250, "Love Letter for: 3x Hearts",12));
			}
			if (GameManager.levelTicket == 19) {
				FP.world.add(new TextBubble(192, 544, "Big boss is catching up on me and so is the void.",12));
			}
			if (GameManager.levelTicket == 22) {
				FP.world.add(new TextBubble(352, 32, "Why are you so stubborn?\n Seriously, why?\n Why?\nWhy?\n Why can't you get it through your thick skull\n That you will fail, you are wasting hearts, people are hungry\n and you are using them for some stupid love letter type writter\n What a waste!\n I'll tell you one last time, that humans soul\n will not save you from the void,\n no matter how manipulative you are, you will not be saved from\n this place, Which human would just let you eat their soul??\n None.",12));
			}
			if (GameManager.levelTicket == 23) {
				FP.world.add(new TextBubble(256, 250, "Letter Written",12));
			}
			if (GameManager.levelTicket == 24) {
				FP.world.add(new StaticHuu(352,288));
			}
			if (GameManager.levelTicket == 25) {
				FP.world.add(new Letter(480, 256));
			}
			if (GameManager.levelTicket == 26) {
				FP.world.add(new Letter(10, 500));
				FP.world.add(new TextBubble(32, 32, "Dearest Love,",20));
				FP.world.add(new TextBubble(32, 64, "I can't wait any longer! I am going to meet you my mind is telling me\n no! My heart is telling me Yes!Oh no.. this is so cliche\n Well.. what more can i say?\n I am so blinded by love, almost everything sounds soo true\n and original It is going to happen\n very soon my dear\n We will meet,\n From,\n Your cliche lover.",20));
				FP.world.add(new TextBubble(32, 500, "press q to close",20));
			}
			if (GameManager.levelTicket == 27) {
				FP.world.add(new TextBubble(256, 250, "Love Letter for: 1x Heart",12));
			}
			if (GameManager.levelTicket == 29) {
				FP.world.add(new TextBubble(32, 32, "Ok, then what are you going to do when you're out?\n Take up the form of a real rabbit?\n pffft hahahaha\n I tell you one last thing\n Life is absurd.",20));
			}
			if (GameManager.levelTicket == 30) {
				FP.world.add(new TextBubble(256, 250, "Letter Written",12));
			}
			if (GameManager.levelTicket == 31) {
				FP.world.add(new StaticHuu(352,288));
			}
			if (GameManager.levelTicket == 32) {
				FP.world.add(new Letter(480, 256));
			}	
			if (GameManager.levelTicket == 33) {
				FP.world.add(new Letter(10, 500));
				FP.world.add(new TextBubble(32, 32, "Dearest Love,",20));
				FP.world.add(new TextBubble(32, 64, "Today\n Is the day my love\n We shall meet!\n I am ready, ready as ever, to finally meet you\n To look into your eyes and tell you i love you\n It makes my heart beat oh so fast knowing that you will meet me\n there Oh dear, im blushing just at the thought\n Let us not wait any longer!\n meet me by the gardens with the beautiful violets,\n i am finally coming out of the void.",20));
				FP.world.add(new TextBubble(32, 500, "press q to close",20));
			}
			if (GameManager.levelTicket == 34) {
			FP.world.add(new TextBubble(32, 100, "Im so nervous, i dont know whether it was that person in the grey sweater i see everytime\n or is it the one that always looks at me awkwardly whenever im at the Library?", 12));
			}
			if (GameManager.levelTicket == 35) {
			FP.world.add(new TextBubble(128, 320, "The void bids you farewell", 12));
			}
			if (GameManager.levelTicket == 36) {
			FP.world.add(new TextBubble(64, 320, "From beneath the surface he emerges and manipulates.", 20));
			}
			if (GameManager.levelTicket == 37) {
				FP.world.add(new TextBubble(160, 64, "Ludum Dare 29", 30));
				FP.world.add(new TextBubble(160, 300, "Thank you for playing Love Letter Typer", 20));
				FP.world.add(new TextBubble(160,332, "A game by @seanographies", 20));
			}
		}
		
	}

}