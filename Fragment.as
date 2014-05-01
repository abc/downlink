package  {
	
	import flash.display.MovieClip;
	
	
	// This class is used for a code fragment in level four. It can be compiled (which turns it green).
	public class Fragment extends MovieClip {
		// Has this fragment been compiled?
		var compiled:Boolean = false;
		
		// Compile the fragment.
		public function compileAndLink ()
		{
			// Set it's compiled status to true.
			compiled = true;
			// Make it turn green.
			gotoAndStop("compiled");
		}
	}
	
}
