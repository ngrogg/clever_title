package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.input.gamepad.FlxGamepad;

class MenuState extends FlxState
{
	
// Difficulty Variable
public static var Difficulty:Int;


	override public function create():Void
	{
	
	// Title text
	var t:FlxText;
	t = new FlxText(0,0,FlxG.width,"CLEVER TITLE");
	t.setFormat(null, 32, FlxColor.WHITE, CENTER, OUTLINE );
	add(t);
	
	// Text to display points
	t = new FlxText(0, 40, FlxG.width, "Use Up, Down, Left, Right to avoid obstacles");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);

	// Text to display points
	t = new FlxText(0, 60, FlxG.width, "W, A, S, D are also usable");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);

	t = new FlxText(0, 80, FlxG.width, "Game ends if you hit an obstacle");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);


	t = new FlxText(0, 100, FlxG.width, "Reach the checkered flag to win");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);
	
	// Helper text
	t = new FlxText(0, 440, FlxG.width, "Difficulty:");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);
	
	// Helper text
	t = new FlxText(0, 460, FlxG.width, "E, M, or H for easy, medium or hard game");
	t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
	add(t);		

	
	// 
	}
	override public function update(elapsed:Float):Void 
	{	

		// Start Easy level
		if (FlxG.keys.pressed.E)
		{
			Difficulty = 1;
			FlxG.switchState(new PlayState());
		}

		// Start Medium level
		if (FlxG.keys.pressed.M)
		{
			Difficulty = 2;
			FlxG.switchState(new PlayState());
		}
		// Start Hard level
		if (FlxG.keys.pressed.H)
		{
			Difficulty = 3;
			FlxG.switchState(new PlayState());
		}

	}
}
