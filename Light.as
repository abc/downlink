package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Light extends MovieClip {
		
		var status:Boolean = false;
		var thisParent:MovieClip;
		
		
		var xCoord:int;
		var yCoord:int;
		
		public function Light (parent:MovieClip)
		{
			thisParent = parent;
			stop();
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		public function clickHandler (e:MouseEvent):void
		{
			MovieClip(thisParent).flip(this.xCoord, this.yCoord);
		}
		
		public function toggle ()
		{
			this.status ? gotoAndStop("off") : gotoAndStop("on");
			this.status ? this.status = false : this.status = true;
		}
	}
	
}
