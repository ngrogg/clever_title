package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.input.gamepad.FlxGamepad;

class FailState extends FlxState
{
	override public function create():Void
	{
	
	// Title text
	var t:FlxText;
	t = new FlxText(0,0,FlxG.width,"UH OH! Try Again...");
	t.setFormat(null, 32, FlxColor.WHITE, CENTER, OUTLINE );
	add(t);
	
	// Helper text
	t = new FlxText(0, 40, FlxG.width, "Use Up, Down, Left, Right to avoid obstacles");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);

	t = new FlxText(0, 60, FlxG.width, "W, A, S, D are also usable");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);

	t = new FlxText(0, 80, FlxG.width, "Game ends if you hit an obstacle");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);


	t = new FlxText(0, 100, FlxG.width, "Reach the checkered flag to win");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);

	t = new FlxText(0, 460, FlxG.width, "E to return to menu");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);		

	
	}

	override public function update(elapsed:Float):Void 
	{	
		// Switch to Main Menu when E is pressed
		if (FlxG.keys.pressed.E)
		{
			FlxG.switchState(new MenuState());
		}
	}
}
