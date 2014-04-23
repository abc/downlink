package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class SelfTypingText extends MovieClip {
		
		public var output:String;
		var pos:int = 0;
		
		public function setOutput (textToType:String)
		{
			this.output = textToType;
			this.value.text = "";
			var timer:Timer = new Timer(50, output.length);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
		}
		
		public function SelfTypingText()
		{
			setOutput("ERROR: SELF-TYPING TEXT NOT VALID...");		
		}
		
		private function timerHandler(e:TimerEvent):void{
            this.value.appendText(output.charAt(pos));
			pos++;
        }
	}
	
}
