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
		
		var enemy1 = new evilsquare();
		var enemy2 = new evilpentagon();
		var enemy3 = new evilcircle();
		var enemy4 = new evilsquare();
		
		var fragment1 = new square();
		var fragment2 = new square();
		var fragment3 = new circle();
		var fragment4 = new pentagon();
		
		var level2Score = 0;
		
		var runOnce = true;
		
		public function Main()
		{
			level2Player.x = 400;
			level2Player.y = 300;
			scene_MAIN();
		}
			
		private function scene_MAIN()
		{
			stage.addEventListener(Event.ENTER_FRAME, stage_ENTER_FRAME);
		}
		
		private function stage_ENTER_FRAME(event:Event)
		{
			addEventListeners();
			
		}
		
		private function removeEventListeners()
		{
			
			if (this.currentFrameLabel == "mainmenu.home")
			{
				startButton.removeEventListener(MouseEvent.CLICK, startButton_CLICK);
				storyButton.removeEventListener(MouseEvent.CLICK, storyButton_CLICK);
				instructionsButton.removeEventListener(MouseEvent.CLICK, instructionsButton_CLICK);
			}
			else if (this.currentFrameLabel == "mainmenu.story")
			{
				backButton.removeEventListener(MouseEvent.CLICK, backButton_CLICK);
			}
			else if (this.currentFrameLabel == "mainmenu.instructions")
			{
				backButton.removeEventListener(MouseEvent.CLICK, backButton_CLICK);
			}
			else if (this.currentFrameLabel == Level1.Start)
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyboard_KEY_DOWN);
			}
			else if (this.currentFrameLabel == Level2.Start)
			{
				this.removeChild(enemy1);
				this.removeChild(enemy2);
				this.removeChild(enemy3);
				this.removeChild(enemy4);
				this.removeChild(fragment1);
				this.removeChild(fragment2);
				this.removeChild(fragment3);
				this.removeChild(fragment4);
				this.removeChild(level2Player);
				
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, level2_KEY_DOWN);	
			}
			else if (this.currentFrameLabel == "level3.start")
			{
				trace("woo!");
			}
			else
			{
				trace("What.");
			}
		}
		
		private function addEventListeners() : void
		{
			if (this.currentFrameLabel == "mainmenu.home")
			{
				startButton.addEventListener(MouseEvent.CLICK, startButton_CLICK);
				storyButton.addEventListener(MouseEvent.CLICK, storyButton_CLICK);
				instructionsButton.addEventListener(MouseEvent.CLICK, instructionsButton_CLICK);
			}
			else if (this.currentFrameLabel == "mainmenu.story")
			{
				backButton.addEventListener(MouseEvent.CLICK, backButton_CLICK);
			}
			else if (this.currentFrameLabel == "mainmenu.instructions")
			{
				trace(this.currentFrame);
				// backButton.addEventListener(MouseEvent.CLICK, backButton_CLICK);
			}
			else if (this.currentFrameLabel == "level1.start")
			{
				this.addChild(mazePlayer);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboard_KEY_DOWN);
			}
			else if (this.currentFrameLabel == "level2.start")
			{
				trace("at level 2");
				
				if (runOnce)
				{
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
					
					runOnce = false;
				}
				
				stage.addEventListener(MouseEvent.MOUSE_MOVE, level2_KEY_DOWN);	
					
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
					removeEventListeners();
					gotoAndStop("level3.start");
				}
				
			}
			else
			{
				trace("what");
			}
		}
		
		private function level2_KEY_DOWN (event:MouseEvent)
		{
			level2Player.x = event.stageX;
			level2Player.y = event.stageY;
			
			if (fragment1.hitTestObject(level2Player))
			{
				removeChild(fragment1);
				level2Score++;
			}
			if (fragment2.hitTestObject(level2Player))
			{
				removeChild(fragment2);
				level2Score++;
			}
			if (fragment3.hitTestObject(level2Player))
			{
				removeChild(fragment3);
				level2Score++;
			}
			if (fragment4.hitTestObject(level2Player))
			{
				removeChild(fragment4);
				level2Score++;
			}
			if (enemy1.hitTestObject(level2Player))
			{
				removeEventListeners();
				gotoAndStop("gameover");
			}
			if (enemy2.hitTestObject(level2Player))
			{
				removeEventListeners();
				gotoAndStop("gameover");
			}
			if (enemy3.hitTestObject(level2Player))
			{
				removeEventListeners();
				gotoAndStop("gameover");
			}
			if (enemy4.hitTestObject(level2Player))
			{
				removeEventListeners();
				gotoAndStop("gameover");
			}
		}
		
		private function keyboard_KEY_DOWN (event:KeyboardEvent) : void
		{
			
			var testPlayer = new Xerxes();
			testPlayer.x = mazePlayer.x;
			testPlayer.y = mazePlayer.y
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
				trace("hit");
				mazePlayer.x += 1;
				mazePlayer.y += 1;
			}
			else if(maze.hitTestPoint(mazePlayer.x + 15, mazePlayer.y, true))
			{
				trace("hit");
				mazePlayer.x -=1;
				mazePlayer.y += 1;
			}
			else if(maze.hitTestPoint(mazePlayer.x, mazePlayer.y + 15, true))
			{
				mazePlayer.x += 1;
				mazePlayer.y -= 1;
				trace("hit");
			}
			else if(maze.hitTestPoint(mazePlayer.x + 15, mazePlayer.y + 15, true))
			{
				mazePlayer.x -= 1;
				mazePlayer.y -= 1;
				trace("hit");
			}
			else
			{
				mazePlayer.x = testPlayer.x;
				mazePlayer.y = testPlayer.y;
			}
			if (win.hitTestPoint(mazePlayer.x, mazePlayer.y, true))
			{
				removeEventListeners();
				this.removeChild(mazePlayer);
				gotoAndStop(Level2.Start);
			}
		}
		
		private function startButton_CLICK (event:MouseEvent) : void
		{
			gotoAndStop(Level1.Start);
		}
		
		private function storyButton_CLICK (event:MouseEvent) : void
		{
			gotoAndStop("mainmenu.story");
		}
		
		private function instructionsButton_CLICK (event:MouseEvent) : void
		{
			gotoAndStop("mainmenu.instructions");
		}
		
		private function backButton_CLICK (event:MouseEvent) : void
		{
			gotoAndStop("mainmenu.home");
		}
	}
	
}
