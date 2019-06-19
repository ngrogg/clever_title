package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;


class WinState extends FlxState
{

	override public function create():Void
	{
	
	// Title text
	var t:FlxText;
	t = new FlxText(0,0,FlxG.width,"CONGRATULATIONS!");
	t.setFormat(null, 32, FlxColor.WHITE, CENTER, OUTLINE );
	add(t);
	
    // Helper text, text variable t can be re-used.
	t = new FlxText(0, 40, FlxG.width, "YOU WIN!!!");
	t.setFormat(null, 24, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);

	// Helper text
	t = new FlxText(0, 440, FlxG.width, "Press Q to return to menu");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);		

	}
	override public function update(elapsed:Float):Void 
	{	
	// Return to Main Menu
		if (FlxG.keys.pressed.Q)
		{
			FlxG.switchState(new MenuState());
		}
	}
}
