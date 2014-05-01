package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	// This is a light, as seen in the Lights Out game on level three.
	public class Light extends MovieClip {
		
		// Is the light on (true) or off (false)?
		var status:Boolean = false;

		// We need to store the parent so we can refer to the parent movieclip.
		var thisParent:MovieClip;
		
		// Where is the light?
		var xCoord:int;
		var yCoord:int;
		
		// Constructor for the Light object.
		public function Light (parent:MovieClip)
		{
			// Get the parent movieclip.
			thisParent = parent;
			// Stop the light from flickering on and off.
			stop();
			// Add an event handler so that it's handled when it's clicked.
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		// This is called when the light is clicked.
		public function clickHandler (e:MouseEvent):void
		{
			// Call the flip method in the parent movieclip.
			MovieClip(thisParent).flip(this.xCoord, this.yCoord);
		}
		
		// This turns the light on or off.
		public function toggle ()
		{
			// This is a conditional statement:
			// boolean  ? what to do if true : what to do if false

			// Is the light on? If yes, turn it off. If not, turn it on.
			this.status ? gotoAndStop("off") : gotoAndStop("on");

			// Set the status to follow the light's status.
			this.status ? this.status = false : this.status = true;
		}
	}
	
}
