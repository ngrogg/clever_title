package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;
import flixel.addons.display.FlxStarField.FlxStarField2D;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.input.gamepad.FlxGamepad;

class PlayState extends FlxState
{
	// Variables

	// Obstacle variable
	public static var obstacles:FlxTypedGroup<Obstacles>;
	
	// Used for win status
	public var count:Int;
	
	// Win Variable
	var victory:Win;

	// Player Variable
	var _player:Player;

	override public function create():Void
	{
		FlxG.mouse.visible = false;
		
		// Create background
		add(new FlxStarField2D());

		// Create player
		_player = new Player();
		add(_player);	

		// Spawn obstacles
		obstacles = new FlxTypedGroup<Obstacles>();
		add(obstacles);

		victory = new Win();
		
		// Set Count initial value
		count = 0;
	
	 	// Initialize Timers
		resetTimer(new FlxTimer());
		winTimer(new FlxTimer());

		// Helper text
		var t:FlxText;
		t = new FlxText(0, 460, FlxG.width, "Q to quit game");
		t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
		add(t);		

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		// Quit
		if(FlxG.keys.pressed.Q)
		{
			FlxG.switchState(new MenuState());
		}
		super.update(elapsed);

		// Overlap functions
		FlxG.overlap(obstacles, _player, obstacleHitsPlayer);
		FlxG.overlap(victory,_player,winHitsPlayer);
	}

	function resetTimer(Timer:FlxTimer):Void
	{	// If easy mode 2
		if(MenuState.Difficulty == 1)
		{
			Timer.start(2,resetTimer);
		}
		// If medium mode 1.5
		if(MenuState.Difficulty == 2)
		{
			Timer.start(1.5,resetTimer);
		}

		// If hard mode 1
		if(MenuState.Difficulty == 3)
		{
			Timer.start(1,resetTimer);
		}
		spawnObstacle();
	}

	function winTimer(Timer:FlxTimer):Void
	{
		// Work around for initial spawn issue
		count = count + 1;

		Timer.start(30,winTimer);
		if(count == 2)
		{
			spawnWin();
		}
	}

	function spawnObstacle():Void
	{
		var obstacles = obstacles.recycle(Obstacles.new);
		obstacles.init();
	}

	function spawnWin():Void
	{
		victory= new Win();
		add(victory);
	}

	private function obstacleHitsPlayer(Object1:FlxObject, Object2:FlxObject):Void
	{
		Object1.kill();
		Object2.kill();
		FlxG.switchState(new FailState());

	}

	private function winHitsPlayer(Object1:FlxObject, Object2:FlxObject):Void
	{
		Object1.kill();
		Object2.kill();
		FlxG.switchState(new WinState());
	}
}
