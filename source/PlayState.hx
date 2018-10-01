package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var player:Player;
	private var grpPeople:FlxTypedGroup<Person>;
	
	private var txtPoints:FlxText;
	private var points:Int = 0;
	
	override public function create():Void
	{
		grpPeople = new FlxTypedGroup<Person>();
		add(grpPeople);
		
		player = new Player(FlxG.width / 2, FlxG.height / 2);
		player.x -= player.width / 2;
		player.y -= player.width / 2;
		add(player);
		
		newRound();
		
		txtPoints = new FlxText(10, 10, 0, "Points", 8);
		add(txtPoints);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		grpPeople.forEachAlive(function(p:Person)
		{
			if (FlxG.overlap(p, player))
			{
				if (player.headbutting)
				{
					if (p.isLesbian)
					{
						points -= 3;
					}
					else
					{
						points -= 0;
					}
				}
				else
				{
					if (p.isLesbian)
					{
						points += 1;
					}
					else
					{
						points -= 2;
					}
				}
				
				grpPeople.remove(p, true);
			}
		});
		
		txtPoints.text = "Points: " + points;
		
		if (grpPeople.length == 0 && player.kissAble)
			newRound();
		
		super.update(elapsed);
	}
	
	private function newRound():Void
	{
		var numPeople = 0;
		while (numPeople != 2)
		{
			var newPerson:Person = new Person(0, 100);
			
			if (numPeople == 0)
				newPerson.x = -25;
			else
				newPerson.x = FlxG.width - 75;
			
			grpPeople.add(newPerson);
			
			numPeople += 1;
		}
	}
}
