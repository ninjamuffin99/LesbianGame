package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author 
 */
class Person extends FlxSprite 
{

	public var isLesbian:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		isLesbian = FlxG.random.bool();
		
		if (isLesbian)
			makeGraphic(100, 100, FlxColor.PINK);
		else
			makeGraphic(100, 100, FlxColor.BLUE);
	}
	
}