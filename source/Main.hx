package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(Std.int(960 * 0.4), Std.int(540 * 0.4), PlayState));
	}
}
