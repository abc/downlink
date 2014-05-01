package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flashx.textLayout.formats.Float;
	
	// This is the "lights out" game used in level three.
	public class LightsOut extends MovieClip
	{	
	
		// How large should the grid be?
		var XSIZE:int = 5;
		var YSIZE:int = 5;

		// How many times should the lights be randomised?
		var ITERATIONS:int = 5;
		// What is the chance that a light will be flipped on a single run?
		var FLIPCHANCE:Number = 0.1;
		// Has the player won the game yet?
		var victory:Boolean = false;
		
		// How many moves has the player made?
		var moves:int = 0;
		
		// This is an array to hold the lights.
		public var lights:Array = [];
		
		public function LightsOut()
		{
			// Start the game.
			start();
		}
		
		// This code starts the actual gameplay
		public function start ()
		{
			// Set up the array of lights		
			for (var i = 0; i < XSIZE; i++)
			{
				lights[i] = new Array();
				for (var j = 0; j < YSIZE; j++)
				{
					lights[i][j] = new Light(this);
					lights[i][j].x = i * 45;
					lights[i][j].xCoord = i;
					lights[i][j].yCoord = j;
					lights[i][j].y = j * 45;
					addChild(lights[i][j]);
				}
			}
			
			// Randomise the lights
			randomise();
		}
		
		// This was originally used to remove the lights from the screen so another game could start.
		// This feature is not used in the actual game, but it's not a bad feature to have, so there's no harm in keeping it.
		public function clear ()
		{
			// Remove each light individually.
			for (var i = 0; i < XSIZE; i++)
			{
				for (var j = 0; j < YSIZE; j++)
				{
					removeChild(lights[i][j]);
				}
			}
		}
		
		// This is used to randomise the lights (so the puzzle actually is random every time)
		public function randomise ()
		{
			// For the number of iterations
			for (var iterations = 0; iterations < ITERATIONS; iterations++)
			{
				// There is a chance that a light will be randomized.
				// (10% at time of writing.)
				for (var i = 0; i < XSIZE; i++)
				{
					for (var j = 0; j < YSIZE; j++)
					{
						// If the random is greater than the flip chance, flip the light.
						if (Math.random() >= FLIPCHANCE)
							this.flip (i, j);
					}
				}
			}

			// Reset the number of moves to 0.
			this.moves = 0;
		}
		
		// This is used to flip lights.
		public function flip (x:int, y:int)
		{
			// Increase the number of moves.
			this.moves++;
			// Toggle the light passed to the coordinates.
			lights[x][y].toggle();
			

			// Work out what lights immediately next to the light clicked also need to be flipped.
			if (y > 0)
				lights[x][y - 1].toggle();
			if (x > 0)
				lights[x - 1][y].toggle();
			if (x < XSIZE - 1)
				lights[x + 1][y].toggle();
			if (y < YSIZE - 1)
				lights[x][y + 1].toggle();
				
			// Check if the last move was a winning move!
			checkWin();
		}
		
		// Has the player won yet?
		public function checkWin ():Boolean
		{
			// Check each light.
			for (var k = 0; k < XSIZE; k++)
			{
				for (var l = 0; l < YSIZE; l++)
				{
					if (lights[k][l].status)
					{
						// If any of the light is lit, there is no win yet.
						return false;
					}
				}
			}
			// Else, the player has won!
			clear();
			youWin();
			return true;
		}		
		
		public function youWin () : void
		{
			// Make the player win!
			this.victory = true;
		}
		
	}
	
}
