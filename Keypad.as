package
{
	import flash.display.MovieClip;
	
	public class Keypad extends MovieClip
	{
		public var buttons:Array = new Array(9);
		
		public function Keypad()
		{
			super();
			
			for (var i = 1; i <= 9; i++)
			{
				var newButton = new KeypadButton(i.toString());
				newButton.width = 35;
				newButton.height = 35;
				
				newButton.x = i * 50;
				if (newButton.x > 150)
				{
					
					newButton.y = 50;
					newButton.x -= 150;
					
					if (newButton.x > 150)
					{
						newButton.y = 100;
						newButton.x -= 150;
					}
				}
				buttons[i] = newButton;
				this.addChild(buttons[i]);
			}
		}
		
		public function keyPress (key:String)
		{
			switch (key.charAt(0))
			{
				case '1':
					buttons[0].gotoAndStop("off");
			}
		}
	}
}