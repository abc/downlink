package  {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	
	// This is the main body of code for the game.
	public class Main extends MovieClip
	{
		// This sound channel keeps a track of what sounds are playing.
		var soundChannel:SoundChannel = new SoundChannel();
		
		// The various backing tracks used in the game.
		var song1:Song1 = new Song1();
		var song2:Song2 = new Song2();
		var song3:Song3 = new Song3();
		var song4:Song4 = new Song4();

		// This is the player in level one.
		var mazePlayer = new Xerxes();
		// This is the player in level two.
		var level2Player = new Level2Player();

		// These are the enemies in level two.
		var enemy1:evilsquare;
		var enemy2:evilpentagon;
		var enemy3:evilcircle;
		var enemy4:evilsquare;

		// These are the code fragments you need to collect in level two.
		var fragment1:square;
		var fragment2:square;
		var fragment3:circle;
		var fragment4:pentagon;

		// This is the score for level two.
		var level2Score = 0;

		// This counts the "compute cycles" taken to finish the last level!
		var computeCycles:Timer = new Timer(1); // 1 second
		
		// The max number of cycles allowed before failure!
		var maxCycles = 10000;

		// Constructor for the game.
		public function Main()
		{
			// Start with the first song.
			soundChannel = song1.play();
			// Go to the first frame.
			gotoAndStop(0);
			// Make the enter_frame event be handled by the update method.
			stage.addEventListener(Event.ENTER_FRAME, update);
			// Initialize the main menu
			init();
		}

		// This method is the init method for the main menu home screen
		private function initMainMenuHome () : void
		{
			// Add the menu button handlers for the various menu options.
			startButton.addEventListener(MouseEvent.CLICK, startButton_CLICK);
			storyButton.addEventListener(MouseEvent.CLICK, storyButton_CLICK);
			instructionsButton.addEventListener(MouseEvent.CLICK, instructionsButton_CLICK);
		}

		// This method is the init method for the main menu screens that just have a back button.
		private function initMainMenuBack () : void
		{
			backButton.addEventListener(MouseEvent.CLICK, backButton_CLICK);
		}

		// This method is the dispose method for the main menu screens that just have a back button
		private function disposeMainMenuBack () : void
		{
			backButton.removeEventListener(MouseEvent.CLICK, backButton_CLICK);
		}

		// This method is the dispose method for the main menu home screen
		private function disposeMainMenuHome () : void
		{
			startButton.removeEventListener(MouseEvent.CLICK, startButton_CLICK);
			storyButton.removeEventListener(MouseEvent.CLICK, storyButton_CLICK);
			instructionsButton.removeEventListener(MouseEvent.CLICK, instructionsButton_CLICK);
		}

		// This method is the init method for level four
		private function initLevelFour () : void
		{
			// Stop any sounds playing
			soundChannel.stop();
			// Play the level four song
			soundChannel = song4.play();

			// Add the event listeners for the drag and drop on the four code fragments.
			l4fragment1.addEventListener(MouseEvent.MOUSE_DOWN, fragment1_MOUSE_DOWN);
			l4fragment4.addEventListener(MouseEvent.MOUSE_DOWN, fragment4_MOUSE_DOWN);
			l4fragment3.addEventListener(MouseEvent.MOUSE_DOWN, fragment3_MOUSE_DOWN);
			l4fragment2.addEventListener(MouseEvent.MOUSE_DOWN, fragment2_MOUSE_DOWN);
			
			l4fragment1.addEventListener(MouseEvent.MOUSE_UP, fragment1_MOUSE_UP);
			l4fragment4.addEventListener(MouseEvent.MOUSE_UP, fragment4_MOUSE_UP);
			l4fragment3.addEventListener(MouseEvent.MOUSE_UP, fragment3_MOUSE_UP);
			l4fragment2.addEventListener(MouseEvent.MOUSE_UP, fragment2_MOUSE_UP);

			// Start the "Compute cycles" timer!

			computeCycles.addEventListener(TimerEvent.TIMER, updateCycle);
			computeCycles.start();
		}
		
		function updateCycle(event:TimerEvent):void
		{
			// This exists, but only to stop the timer throwing errors. 
			// Does nothing.
		}


		// These are the methods for dragging the code fragments
		private function fragment1_MOUSE_DOWN			(event:MouseEvent) : void
		{
			l4fragment1.startDrag();
		}
		private function fragment2_MOUSE_DOWN			(event:MouseEvent) : void
		{
			l4fragment2.startDrag();
		}
		private function fragment3_MOUSE_DOWN			(event:MouseEvent) : void
		{
			l4fragment3.startDrag();
		}
		private function fragment4_MOUSE_DOWN			(event:MouseEvent) : void
		{
			l4fragment4.startDrag();
		}
		
		// These are the methods for checking if the code fragment is in the right place.
		private function fragment1_MOUSE_UP			(event:MouseEvent) : void
		{
			// If the coordinates are correct
			if (l4fragment1.x >= 300)
			{
				if (l4fragment1.y >= 80)
				{
					// Link it, make it in the right place, and prevent further interaction.
					l4fragment1.compileAndLink();
					l4fragment1.x = 360;
					l4fragment1.y = 90;
					l4fragment1.removeEventListener(MouseEvent.MOUSE_UP, fragment1_MOUSE_UP);
					l4fragment1.removeEventListener(MouseEvent.MOUSE_DOWN, fragment1_MOUSE_DOWN);
				}
			}
			l4fragment1.stopDrag();
			
			trace(l4fragment1.x);
		}
		private function fragment2_MOUSE_UP			(event:MouseEvent) : void
		{
			// If the first fragment is already in place
			if (l4fragment1.compiled)
			{
				// If the coordinates are correct
				if (l4fragment2.x >= 300)
				{
					if (l4fragment2.y >= 80)
					{
						// Link it, make it in the right place, and prevent further interaction.
						l4fragment2.x = 360;
						l4fragment2.y = 107;
						l4fragment2.compileAndLink();
						l4fragment2.removeEventListener(MouseEvent.MOUSE_UP, fragment2_MOUSE_UP);
						l4fragment2.removeEventListener(MouseEvent.MOUSE_DOWN, fragment2_MOUSE_DOWN);
					}
				}
			}
			
			l4fragment2.stopDrag();
		}
		private function fragment3_MOUSE_UP			(event:MouseEvent) : void
		{
			// If the first two fragments are already in place
			if ((l4fragment1.compiled) && (l4fragment2.compiled))
			{
				// If the coordinates are correct
				if (l4fragment3.x >= 300)
				{
					if (l4fragment3.y >= 80)
					{
						// Link it, make it in the right place, and prevent further interaction.
						l4fragment3.x = 380;
						l4fragment3.y = 122;
						l4fragment3.compileAndLink();
						l4fragment3.removeEventListener(MouseEvent.MOUSE_UP, fragment3_MOUSE_UP);
						l4fragment3.removeEventListener(MouseEvent.MOUSE_DOWN, fragment3_MOUSE_DOWN);
					}
				}
			}
			l4fragment3.stopDrag();
		}
		private function fragment4_MOUSE_UP			(event:MouseEvent) : void
		{
			// If the first three fragments are already in place
			if ((l4fragment1.compiled) && (l4fragment2.compiled) && (l4fragment3.compiled))
			{
				// If the coordinates are correct
				if (l4fragment4.x >= 300)
				{
					if (l4fragment4.y >= 80)
					{
						// Link it, make it in the right place, and prevent further interaction.
						l4fragment4.x = 400;
						l4fragment4.y = 137;
						l4fragment4.compileAndLink();
						l4fragment4.removeEventListener(MouseEvent.MOUSE_UP, fragment4_MOUSE_UP);
						l4fragment4.removeEventListener(MouseEvent.MOUSE_DOWN, fragment4_MOUSE_DOWN);
					}
				}
			}
			l4fragment4.stopDrag();
		}
		
		// This is the init method for level one.
		private function initLevelOne () : void
		{
			// Stop any sounds playing
			soundChannel.stop();
			// Play the level one song
			soundChannel = song2.play();
			// Add the player to the screen
			this.addChild(mazePlayer);
			// Add event listeners for key presses
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboard_KEY_DOWN);
		}

		// This is the dispose method for level one.
		private function disposeLevelOne () : void
		{
			// If the player is on screen
			if (this.contains(mazePlayer))
			{
				// remove it.
				this.removeChild(mazePlayer);
			}

			// and remove the keypress event listener
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyboard_KEY_DOWN);
		}

		// This is the init method for level two.
		private function initLevelTwo() : void
		{
			// Stop any sounds playing
			soundChannel.stop();

			// Play the level two song
			soundChannel = song3.play();

			// create the various enemies and collectables
			enemy1 = new evilsquare();
			enemy2 = new evilpentagon();
			enemy3 = new evilcircle();
			enemy4 = new evilsquare();
			
			fragment1 = new square();
			fragment2 = new square();
			fragment3 = new circle();
			fragment4 = new pentagon();
			
			// Add the enemies and code fragments and the player to the screen.
			this.addChild(enemy1);
			this.addChild(enemy2);
			this.addChild(enemy3);
			this.addChild(enemy4);
			this.addChild(fragment1);
			this.addChild(fragment2);
			this.addChild(fragment3);
			this.addChild(fragment4);
			this.addChild(level2Player);

			// Setup the positioning of everything

			enemy1.y = (Math.random() * 600) + 1;
			enemy1.x = 0;

			enemy2.y = (Math.random() * 600) + 1;
			enemy2.x = 0;

			enemy3.y = (Math.random() * 600) + 1;
			enemy3.x = 0;

			enemy4.y = (Math.random() * 600) + 1;
			enemy4.x = 0;

			fragment1.y = (Math.random() * 600) + 1;
			fragment1.x = 0;

			fragment2.y = (Math.random() * 600) + 1;
			fragment2.x = 0;

			fragment3.y = (Math.random() * 600) + 1;
			fragment3.x = 0;

			fragment4.y = (Math.random() * 600) + 1;
			fragment4.x = 0;

			// Add a mouse move event listener.
			stage.addEventListener(MouseEvent.MOUSE_MOVE, level2_MOUSE_MOVE);	
		}

		// This is the dispose method for level two.
		private function disposeLevelTwo() : void
		{
			// If any of the enemies or fragments are still on screen, remove them.

			if (this.contains(enemy1))
			{
				this.removeChild(enemy1);
			}
			if  (this.contains(enemy2))
			{
				this.removeChild(enemy2);
			}
			if  (this.contains(enemy3))
			{
				this.removeChild(enemy3);
			}
			if  (this.contains(enemy4))
			{
				this.removeChild(enemy4);
			}
			if  (this.contains(fragment4))
			{
				this.removeChild(fragment4);
			}
			if  (this.contains(fragment3))
			{
				this.removeChild(fragment3);
			}
			if  (this.contains(fragment2))
			{
				this.removeChild(fragment2);
			}
			if  (this.contains(fragment1))
			{
				this.removeChild(fragment1);
			}
			if  (this.contains(level2Player))
			{
				this.removeChild(level2Player);
			}

			// And remove the mouse event listener.
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, level2_MOUSE_MOVE);	
		}
		
		// This is the dispose method for level three.
		private function disposeLevelThree() : void
		{
			// If the screen has the lights out game on it
			if (this.contains(lightsout))
			{
				// remove it
				this.removeChild(lightsout);
			}
		}
		
		// This is the update method for level two.
		private function updateLevelTwo() : void
		{
			// Update the positioning of everything.
			enemy1.x += 15;
			enemy1.rotation += 5;

			fragment1.x += 13;
			fragment1.rotation += 2;

			enemy2.x += 5;
			enemy2.y += 5;
			enemy2.rotation += 10;

			fragment2.x += 7;
			fragment2.y += 3;
			fragment2.rotation += 10;

			enemy3.x -= 7;
			enemy3.y += 2;
			enemy3.rotation += 5;

			fragment2.x -= 5;
			fragment3.y += 3;
			fragment3.rotation += 6;

			enemy4.x += 7;
			enemy4.y -= 3;
			enemy4.rotation += 1;

			fragment4.x += 7;
			fragment4.y -= 3;
			fragment4.rotation += 1;
			

			// If anything goes off screen, put it back on.
			if ((enemy1.x > 800) || (enemy1.y >= 600) || (enemy1.y <= 0) || (enemy1.x <= 0))
			{
				enemy1.y = (Math.random() * 600) + 1;
				enemy1.x = 1;
			}
			if ((enemy2.x > 800) || (enemy2.y >= 600) || (enemy2.y <= 0) || (enemy2.x <= 0))
			{
				enemy2.y = (Math.random() * 600) + 1;
				enemy2.x = 1;
			}
			if ((enemy3.x > 800) || (enemy3.y >= 600) || (enemy3.y <= 0) || (enemy3.x <= 0))
			{
				enemy3.y = (Math.random() * 600) + 1;
				enemy3.x = 799;
			}
			if ((enemy4.x > 800) || (enemy4.y >= 600) || (enemy4.y <= 0) || (enemy4.x <= 0))
			{
				enemy4.y = (Math.random() * 600) + 1;
				enemy4.x = 1;
			}
			if ((fragment1.x > 800) || (fragment1.y >= 600) || (fragment1.y <= 0) || (fragment1.x <= 0))
			{
				fragment1.y = (Math.random() * 600) + 1;
				fragment1.x = 1;
			}
			if ((fragment2.x > 800) || (fragment2.y >= 600) || (fragment2.y <= 0) || (fragment2.x <= 0))
			{
				fragment2.y = (Math.random() * 600) + 1;
				fragment2.x = 1;
			}
			if ((fragment3.x > 800) || (fragment3.y >= 600) || (fragment3.y <= 0) || (fragment3.x <= 0))
			{
				fragment3.y = (Math.random() * 600) + 1;
				fragment3.x = 1;
			}
			if ((fragment4.x > 800) || (fragment4.y >= 600) || (fragment4.y <= 0) || (fragment4.x <= 0))
			{
				fragment4.y = (Math.random() * 600) + 1;
				fragment4.x = 1;
			}

			// Make sure the score shown on screen is accurate.
			score.text = level2Score;

			// If the player has won
			if (level2Score >= 4)
			{
				// Clean up the scene
				dispose();
				// Go to the next one
				gotoAndStop("level3.start");
				// and initialise it
				init();
			}

			// If the player collides with a code fragment (the collectable)
			if (fragment1.hitTestObject(level2Player))
			{
				// If the fragment is still on screen (AS3 can be a bit buggy with collecting the same fragment multiple times)
				if (this.contains(fragment1))
				{
					// Remove the fragment
					removeChild(fragment1);
					// and increase the score
					level2Score++;
				}

				
			}

			// Same as above.
			if (fragment2.hitTestObject(level2Player))
			{
				if (this.contains(fragment2))
				{
					removeChild(fragment2);
					level2Score++;
				}
				
			}
			// Same as above.
			if (fragment3.hitTestObject(level2Player))
			{
				if (this.contains(fragment3))
				{
					removeChild(fragment3);
					level2Score++;
				}
				
			}
			// Same as above.
			if (fragment4.hitTestObject(level2Player))
			{
				if (this.contains(fragment4))
				{
					removeChild(fragment4);
					level2Score++;
				}
				
			}

			// If the player hits any of the bad (evil) code fragments, they lose.

			if (enemy1.hitTestObject(level2Player))
			{
				dispose();
				gotoAndStop("gameover");
				init();
			}
			if (enemy2.hitTestObject(level2Player))
			{
				dispose();
				gotoAndStop("gameover");
				init();
			}
			if (enemy3.hitTestObject(level2Player))
			{
				dispose();
				gotoAndStop("gameover");
				init();
			}
			if (enemy4.hitTestObject(level2Player))
			{
				dispose();
				gotoAndStop("gameover");
				init();
			}
		}
		
		// This is the update method for level three.
		private function updateLevelThree () : void
		{
			trace(lightsout.victory);
			// Check if the player has won yet.
			if(lightsout.victory)
			{
				// If they have, dispose the scene and start the next one.
				dispose();
				gotoAndStop("level4.start");
				init();
			}
		}
		
		// This is the update method for level four
		private function updateLevelFour () : void
		{
			// Show the message telling the player how long they have left.
			looptext.text = "Looped " + computeCycles.currentCount + " times, " + (maxCycles - computeCycles.currentCount) + " remaining before forced connection closure";
			
			// if all of the code fragments are compiled
			if ((l4fragment1.compiled) && (l4fragment2.compiled) && (l4fragment3.compiled) && (l4fragment4.compiled))
			{
				// You win!
				gotoAndStop("victory");
			}
			
			// If the player has taken too long
			else if (computeCycles.currentCount >= maxCycles)
			{
				// They lose!
				gotoAndStop("gameover");
			}
		}

		// This handles the start button press.
		private function startButton_CLICK			(event:MouseEvent) : void
		{
			// Dispose the scene and start the next one.
			dispose();
			gotoAndStop("level1.start");
			init();
		}

		// These are the main menu options. Go to the menu screen the button corresponds to.
		private function storyButton_CLICK			(event:MouseEvent) : void
		{
			dispose();
			gotoAndStop("mainmenu.story");
			init();
		}
		private function instructionsButton_CLICK	(event:MouseEvent) : void
		{
			dispose();
			gotoAndStop("mainmenu.instructions");
			init();
		}
		private function backButton_CLICK			(event:MouseEvent) : void
		{
			dispose();
			gotoAndStop("mainmenu.home");
			init();
		}

		// Function to handle key presses in level one.
		private function keyboard_KEY_DOWN			(event:KeyboardEvent) : void
		{
			// Create a "phantom" player to check collisions
			var testPlayer = new Xerxes();
			// and set the phantom's coordinates to the players'
			testPlayer.x = mazePlayer.x;
			testPlayer.y = mazePlayer.y;

			// Move the phantom in the direction of the keypress.
			if (event.keyCode == Keyboard.W)
			{
				testPlayer.y -= 5;
			}

			if (event.keyCode == Keyboard.S)
			{
				testPlayer.y += 5;
			}

			if (event.keyCode == Keyboard.D)
			{
				testPlayer.x += 5;
			}

			if (event.keyCode == Keyboard.A)
			{
				testPlayer.x -= 5;
			}

			// If the player hits any of the corners, move them back out.
			if (maze.hitTestPoint(mazePlayer.x,mazePlayer.y,true))
			{
				// trace("hit");
				mazePlayer.x += 1;
				mazePlayer.y += 1;
			}
			else if(maze.hitTestPoint(mazePlayer.x + 15, mazePlayer.y, true))
			{
				// trace("hit");
				mazePlayer.x -=1;
				mazePlayer.y += 1;
			}
			else if(maze.hitTestPoint(mazePlayer.x, mazePlayer.y + 15, true))
			{
				mazePlayer.x += 1;
				mazePlayer.y -= 1;
				// trace("hit");
			}
			else if(maze.hitTestPoint(mazePlayer.x + 15, mazePlayer.y + 15, true))
			{
				mazePlayer.x -= 1;
				mazePlayer.y -= 1;
				// trace("hit");
			}
			else
			{
				// Otherwise, update their coordinates because they didn't hit anything
				mazePlayer.x = testPlayer.x;
				mazePlayer.y = testPlayer.y;
			}

			// If the player hits the exit area
			if (win.hitTestPoint(mazePlayer.x, mazePlayer.y, true))
			{

				// Move them on to the next level
				dispose();
				gotoAndStop("level2.start");
				init();
			}
		}

		// This handles the level two mouse movement
		private function level2_MOUSE_MOVE			(event:MouseEvent) : void
		{
			// Move the player with the mouse.
			level2Player.x = event.stageX;
			level2Player.y = event.stageY;
		}

		// This is the init function.
		private function init() : void
		{
			// Call the init method based on the level that we're on.
			switch (this.currentFrameLabel)
			{
				case "mainmenu.home":
					initMainMenuHome();
					break;
				case "mainmenu.story":
					initMainMenuBack();
					break;
				case "mainmenu.instructions":
					initMainMenuBack();
					break;
				case "level1.start":
					initLevelOne();
					break;
				case "level2.start":
					initLevelTwo();
					break;
				case "level4.start":
					initLevelFour();
					break;
			}
		}

		// This is the update function
		private function update(event:Event) : void
		{
			// Call the update method based on the level that we're on.
			switch (this.currentFrameLabel)
			{
				case "level2.start":
					updateLevelTwo();
					break;
				case "level3.start":
					updateLevelThree();
					break;
				case "level4.start":
					updateLevelFour();
					break;
			}
		}

		// This is the dispose function
		private function dispose() : void
		{
			// Call the dispose method based on the level that we're on.
			switch (this.currentFrameLabel)
			{
				case "mainmenu.home":
					disposeMainMenuHome();
					break;
				case "mainmenu.story":
					disposeMainMenuBack();
					break;
				case "mainmenu.instructions":
					disposeMainMenuBack();
					break;
				case "level1.start":
					disposeLevelOne();
					break;
				case "level2.start":
					disposeLevelTwo();
					break;
				case "level3.start":
					disposeLevelThree();
					break;
			}
		}
	}
}

