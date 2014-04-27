package 
{
	import flash.events.MouseEvent;
	
	public class MainMenu
	{
		var clip;
		static var Home:String = "mainmenu.home";
		static var Instructions:String = "mainmenu.instructions";
		static var Story:String = "mainmenu.story";
		
		public static function destroy () : void
		{
			
		}
		
		public function Scene1(clip)
		{
			this.clip = clip;
		}
		
		public function addEventListeners () : void
		{
			if (clip.currentFrameLabel == "main")
			{
				clip.startButton.addEventListener(MouseEvent.CLICK, startButton_CLICK);
				clip.storyButton.addEventListener(MouseEvent.CLICK, storyButton_CLICK);
				clip.instructionsButton.addEventListener(MouseEvent.CLICK, instructionsButton_CLICK);
			}
			else if (clip.currentFrameLabel == "story")
			{
				clip.backButton.addEventListener(MouseEvent.CLICK, backButton_CLICK);
			}
			else if (clip.currentFrameLabel == "instructions")
			{
				clip.backButton.addEventListener(MouseEvent.CLICK, backButton_CLICK);
			}
		}
		
		private function startButton_CLICK (event:MouseEvent) : void
		{
			clip.gotoAndPlay(1, "Part 1");
		}
		
		private function storyButton_CLICK (event:MouseEvent) : void
		{
			clip.gotoAndStop("story");
		}
		
		private function instructionsButton_CLICK (event:MouseEvent) : void
		{
			clip.gotoAndStop("instructions");
		}
		
		private function backButton_CLICK (event:MouseEvent) : void
		{
			clip.gotoAndStop("main");
		}
	}
	
}
