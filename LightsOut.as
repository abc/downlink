package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flashx.textLayout.formats.Float;
	
	
	public class LightsOut extends MovieClip
	{	
	
		var XSIZE:int = 5;
		var YSIZE:int = 5;
		var ITERATIONS:int = 5;
		var FLIPCHANCE:Number = 0.1;
		var victory:Boolean = false;
		
		var moves:int = 0;
		
		public var lights:Array = [];
		
		public function LightsOut()
		{
			// newGame.addEventListener(MouseEvent.CLICK, reset);
			// var test = new Light();
			// test.x = 100;
			// addChild(test);
			
			//XInput.value = 5;
			//YInput.value = 5;
			
			start();
		}
		
		public function start ()
		{
			XSIZE = 5;
			YSIZE = 5;
			// ITERATIONS = 5;
			// FLIPCHANCE = 0.1;
			
			for (var i = 0; i < XSIZE; i++)
			{
				lights[i] = new Array();
				for (var j = 0; j < YSIZE; j++)
				{
					
					// trace("Added new light at " + i + " , " + j + ".");
					lights[i][j] = new Light();
					lights[i][j].x = i * 45;
					lights[i][j].xCoord = i;
					lights[i][j].yCoord = j;
					lights[i][j].y = j * 45;
					addChild(lights[i][j]);
				}
			}
			
			randomise();
		}
		
		public function clear ()
		{
				for (var i = 0; i < XSIZE; i++)
				{
					for (var j = 0; j < YSIZE; j++)
					{
						removeChild(lights[i][j]);
					}
				}
		}
		
		public function randomise ()
		{
			for (var iterations = 0; iterations < ITERATIONS; iterations++)
			{
				for (var i = 0; i < XSIZE; i++)
				{
					for (var j = 0; j < YSIZE; j++)
					{
						if (Math.random() >= FLIPCHANCE)
							test (i, j);
					}
				}
			}
			this.moves = 0;
		}
		
		public function test (x:int, y:int)
		{
			this.moves++;
			lights[x][y].toggle();
			
			if (y > 0)
				lights[x][y - 1].toggle();
			if (x > 0)
				lights[x - 1][y].toggle();
			if (x < XSIZE - 1)
				lights[x + 1][y].toggle();
			if (y < YSIZE - 1)
				lights[x][y + 1].toggle();
				
				if (checkWin())
				{
					
				}
				else
				{
					
				}
		}
		
		public function checkWin ():Boolean
		{
			for (var k = 0; k < XSIZE; k++)
			{
				for (var l = 0; l < YSIZE; l++)
				{
					if (lights[k][l].status)
					{
						// No win yet.
						return false;
					}
				}
			}
			clear();
			youWin();
			return true;
		}
		
		public function youWin ()
		{
			victory = true;
		}
		
		
	}
	
}
