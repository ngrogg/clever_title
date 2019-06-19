package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.util.FlxPool;
import flixel.util.FlxSpriteUtil;
import flixel.system.FlxSound;
import flixel.input.gamepad.FlxGamepad;

class Player extends FlxSprite
{
    // Create player object with sprite as defined
	public function new()
	{
		super(FlxG.width/2 - 300, FlxG.height/2);
		loadGraphic("assets/player.png");
		setGraphicSize(20,20);
		updateHitbox();
	}

	override public function update(elapsed:Float):Void
	{
		// Start Stationary
		velocity.x = 0;
		velocity.y = 0;

		// Movement keys, allows for WASD or Up Down Left Right
		if (FlxG.keys.anyPressed([UP, W]))
		{
			velocity.y -= 200;	
		}

		if (FlxG.keys.anyPressed([DOWN, S]))
		{
			velocity.y += 200;	

		}

		if (FlxG.keys.anyPressed([LEFT, A]))
		{
			velocity.x -= 200;	

		}

		if (FlxG.keys.anyPressed([RIGHT, D]))
		{
			velocity.x += 200;	

		}
		// Making the velocity too high makes the controls twitchy

		super.update(elapsed);

		// Boundaries, so player doesn't leave the screen
		if (x > FlxG.width - width - 20)
		{
			x = FlxG.width - width - 20;
		}		
			
		if (x < 4)
		{
			x = 4;
		}
		if (y > FlxG.height - height - 4)
		{
			y = FlxG.height - height - 4;
		}
		if ( y < 4)
		{
			y = 4;
		}

	}
}
