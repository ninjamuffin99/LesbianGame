package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Player extends FlxSprite 
{

	public var kissAble:Bool = true;
	public var headbutting:Bool = false;
	private var bounceBack:Bool = false;
	private var speed:Float = 3500;
	private var queueTimer:Float = 0;
	private var headbuttQueue:Bool = false;
	/**
	   Next direction in queue, 0 for left, 1 for right
	**/
	private var nextDir:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(100, 100);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		// LOL THIS CODE IS SO GOD AWFUL AND REDUNDANT AND A MESS
		if (FlxG.keys.justPressed.A)
		{
			nextDir = 0;
		}
		else if (FlxG.keys.justPressed.D)
		{
			nextDir = 1;
		}

		if (kissAble)
		{
			
			if (FlxG.keys.justPressed.A || FlxG.keys.justPressed.D || queueTimer > 0)
			{
				if (FlxG.keys.justPressed.A || nextDir == 0)
				{
					velocity.x = -speed;
				}
				else if (FlxG.keys.justPressed.D || nextDir == 1)
				{
					velocity.x = speed;
				}
				
				kissAble = false;
				
				if (FlxG.keys.pressed.SHIFT || headbuttQueue)
				{
					headbutting = true;
					headbuttQueue = false;
				}
			}
		}
		else
		{
			var timerMax:Float = 0.1;
			
			if (FlxG.keys.justPressed.A)
			{
				queueTimer = timerMax;
				
				if (FlxG.keys.pressed.SHIFT)
				{
					headbuttQueue = true;
				}
			}
			else if (FlxG.keys.justPressed.D)
			{
				queueTimer = timerMax;
				
				if (FlxG.keys.pressed.SHIFT)
				{
					headbuttQueue = true;
				}
				
			}
		}
		
		if (queueTimer > 0)
			queueTimer -= FlxG.elapsed;
		
		
		if (x < 0 || x > FlxG.width - width )
		{
			// reverses direction
			velocity.x *= -1;
			
			bounceBack = true;
		}
		
		if (bounceBack && FlxMath.isDistanceToPointWithin(this, FlxPoint.get(FlxG.width / 2, FlxG.height / 2), 10))
		{
			bounceBack = false;
			kissAble = true;
			headbutting = false;
			velocity.x = 0;
		}
		
		
		super.update(elapsed);
	}
	
}