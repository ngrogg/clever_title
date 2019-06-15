package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.util.FlxPool;
import flixel.util.FlxSpriteUtil;
import flixel.system.FlxSound;

class Win extends FlxSprite
{

	public function new() 
	{
		super(FlxG.width/2 + 300, 1); //FlxG.height
		loadGraphic("assets/win.png");
		updateHitbox();
	}
	override public function update(elapsed:Float):Void
	{
		// Start moving to the left 
		velocity.x = -125;
		velocity.y = 0;
		super.update(elapsed);

	}
}
