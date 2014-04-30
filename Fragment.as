package  {
	
	import flash.display.MovieClip;
	
	
	
	public class Fragment extends MovieClip {
		var compiled:Boolean = false;
		
		public function Fragment()
		{
		}
		
		public function compileAndLink ()
		{
			compiled = true;
			gotoAndStop("compiled");
		}
	}
	
}
