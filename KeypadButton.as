package
{
	import flash.display.MovieClip;
	
	public class KeypadButton extends MovieClip
	{
		var keypadCharacter:String;
		
		public function KeypadButton(character:String)
		{
			super();
			this.character.text = character.charAt(0);
			this.width = 35;
			this.height = 35;
		}
	}
}