package
{
	import flash.display.Sprite;
	
	public class Downlink extends Sprite
	{
		public function Downlink()
		{
			flashComputer.properties.hostname.text = "user"
			flashComputer.properties.description.text = "[localhost]"
				
			downlinkComputer.properties.hostname.text = "234.773.0.666"
			downlinkComputer.properties.description.text = "[Downlink public access server]"
			downlinkComputer.gotoAndStop("Downlink");
		}
	}
}