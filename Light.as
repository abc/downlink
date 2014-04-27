package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Light extends MovieClip {
		
		var status:Boolean = false;
		
		var xCoord:int;
		var yCoord:int;
		
		public function Light ()
		{
			stop();
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		public function clickHandler (e:MouseEvent):void
		{
			MovieClip(root).test(this.xCoord, this.yCoord);
		}
		
		public function toggle ()
		{
			this.status ? gotoAndStop("Off") : gotoAndStop("On");
			this.status ? this.status = false : this.status = true;
		}
	}
	
}
