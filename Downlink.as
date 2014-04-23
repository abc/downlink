package
{
	import flash.display.Sprite;
	
	public class Downlink extends Sprite
	{
		public function Downlink()
		{
			stt.setOutput("Establishing connection to Downlink public access server...");
			flashComputer.properties.hostname.text = "user"
			flashComputer.properties.description.text = "[localhost]"
			dlPc.gotoAndStop("Downlink");
			dlPc.properties.hostname.text = "234.773.0.666"
			dlPc.properties.description.text = "[Downlink public access server]"
			
		}
	}
}