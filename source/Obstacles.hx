package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.animation.FlxAnimation;
import flixel.math.FlxRandom;
import flixel.util.FlxSpriteUtil;
import flixel.math.FlxVelocity;
import flixel.math.FlxPoint;


class Obstacles extends FlxSprite
{

	public function new() 
	{
		super();
	}

    // Function uses RNG to determine which sprite gets chosen
	public function init(X:Int = 0, Y:Int = 0, VelocityX:Float = 0, VelocityY:Float = 0):Obstacles
	{
		var spriteNum = FlxG.random.int(1,4);
		if(spriteNum == 1)
		{
			loadGraphic("assets/obstacle.png");
		}
		if(spriteNum == 2)
		{
			loadGraphic("assets/obstacle2.png");
		}
		if(spriteNum == 3)
		{
			loadGraphic("assets/obstacle3.png");
		}
		if(spriteNum == 4)
		{
			loadGraphic("assets/obstacle4.png");
		}

		// Position for obstacle spawn, narrower margin for harder difficulty, also RNG
		if(MenuState.Difficulty == 3)
		{
			x = FlxG.width / 4 + FlxG.random.int(0,400);
			y = FlxG.height / 2 + FlxG.random.int(-200,200);
		}
		else
		{
			x = FlxG.width / 2 + FlxG.random.int(0,100);
			y = FlxG.height / 2 + FlxG.random.int(-200,200);
		}

        // Affect obstacle speed and direction based on difficulty
        
		// If easy mode
		if(MenuState.Difficulty == 1)
		{ 
			velocity.x = FlxG.random.int(-25,-75);
			velocity.y = 0;
		}
		// If medium mode		
		if(MenuState.Difficulty == 2)
		{ 
			velocity.x = FlxG.random.int(-50,-100);
			velocity.y = 0;
		}

		// if hard mode
		if(MenuState.Difficulty == 3)
		{ 
			velocity.x = FlxG.random.int(-400,-650);
			velocity.y = FlxG.random.int(-100, 100);
		}

		return this;
	}	
}
