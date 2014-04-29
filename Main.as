package  {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Main extends MovieClip
	{

		var mazePlayer = new Xerxes();
		var level2Player = new Level2Player();

		var enemy1:evilsquare;
		var enemy2:evilpentagon;
		var enemy3:evilcircle;
		var enemy4:evilsquare;

		var fragment1:square;
		var fragment2:square;
		var fragment3:circle;
		var fragment4:pentagon;

		var level2Score = 4;

		public function Main()
		{
			dispose();
			gotoAndStop(0);
			stage.addEventListener(Event.ENTER_FRAME, update);
			init();
		}

		private function initMainMenuHome () : void
		{
			startButton.addEventListener(MouseEvent.CLICK, startButton_CLICK);
			storyButton.addEventListener(MouseEvent.CLICK, storyButton_CLICK);
			instructionsButton.addEventListener(MouseEvent.CLICK, instructionsButton_CLICK);
		}

		private function initMainMenuBack () : void
		{
			backButton.addEventListener(MouseEvent.CLICK, backButton_CLICK);
		}

		private function disposeMainMenuBack () : void
		{
			backButton.removeEventListener(MouseEvent.CLICK, backButton_CLICK);
		}

		private function disposeMainMenuHome () : void
		{
			startButton.removeEventListener(MouseEvent.CLICK, startButton_CLICK);
			storyButton.removeEventListener(MouseEvent.CLICK, storyButton_CLICK);
			instructionsButton.removeEventListener(MouseEvent.CLICK, instructionsButton_CLICK);
		}

		private function initLevelOne () : void
		{
			this.addChild(mazePlayer);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboard_KEY_DOWN);
		}

		private function disposeLevelOne () : void
		{
			if (this.contains(mazePlayer))
			{
				this.removeChild(mazePlayer);
			}
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyboard_KEY_DOWN);
		}

		private function initLevelTwo() : void
		{
			enemy1 = new evilsquare();
			enemy2 = new evilpentagon();
			enemy3 = new evilcircle();
			enemy4 = new evilsquare();
			
			fragment1 = new square();
			fragment2 = new square();
			fragment3 = new circle();
			fragment4 = new pentagon();
			
			this.addChild(enemy1);
			this.addChild(enemy2);
			this.addChild(enemy3);
			this.addChild(enemy4);
			this.addChild(fragment1);
			this.addChild(fragment2);
			this.addChild(fragment3);
			this.addChild(fragment4);
			this.addChild(level2Player);

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

			stage.addEventListener(MouseEvent.MOUSE_MOVE, level2_MOUSE_MOVE);	
		}

		private function disposeLevelTwo() : void
		{
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
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, level2_MOUSE_MOVE);	
		}
		
		private function disposeLevelThree() : void
		{
			if (this.contains(lightsout))
			{
				this.removeChild(lightsout);
			}
		}
		
		private function updateLevelTwo() : void
		{
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

			score.text = level2Score;

			if (level2Score >= 4)
			{
				dispose();
				gotoAndStop("level3.start");
				init();
			}
			if (fragment1.hitTestObject(level2Player))
			{
				if (this.contains(fragment1))
				{
					removeChild(fragment1);
					level2Score++;
				}

				
			}
			if (fragment2.hitTestObject(level2Player))
			{
				if (this.contains(fragment2))
				{
					removeChild(fragment2);
					level2Score++;
				}
				
			}
			if (fragment3.hitTestObject(level2Player))
			{
				if (this.contains(fragment3))
				{
					removeChild(fragment3);
					level2Score++;
				}
				
			}
			if (fragment4.hitTestObject(level2Player))
			{
				if (this.contains(fragment4))
				{
					removeChild(fragment4);
					level2Score++;
				}
				
			}

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
		
		private function updateLevelThree () : void
		{
			if(lightsout.victory)
			{
				dispose();
				gotoAndStop("level4.start");
				init();
			}
		}

		private function startButton_CLICK			(event:MouseEvent) : void
		{
			dispose();
			gotoAndStop("level1.start");
			init();
		}
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
		private function keyboard_KEY_DOWN			(event:KeyboardEvent) : void
		{
			var testPlayer = new Xerxes();
			testPlayer.x = mazePlayer.x;
			testPlayer.y = mazePlayer.y;
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
				mazePlayer.x = testPlayer.x;
				mazePlayer.y = testPlayer.y;
			}
			if (win.hitTestPoint(mazePlayer.x, mazePlayer.y, true))
			{
				dispose();
				gotoAndStop(Level2.Start);
				init();
			}
		}
		private function level2_MOUSE_MOVE			(event:MouseEvent) : void
		{
			level2Player.x = event.stageX;
			level2Player.y = event.stageY;
		}

		private function init() : void
		{
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
			}
		}

		private function update(event:Event) : void
		{
			// trace(this.currentFrameLabel);
			switch (this.currentFrameLabel)
			{
				case "level2.start":
					updateLevelTwo();
					break;
				case "level3.start":
					updateLevelThree();
					break;
			}
		}

		private function dispose() : void
		{
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

