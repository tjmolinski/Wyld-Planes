package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
  var block = new FlxSprite();
  var player : Player;
  private var walls : FlxGroup;
  
  private var bottomWall : FlxSprite;
  private var debugText : FlxText;

  override public function create():Void
  {
    super.create(); 
	
	walls = new FlxGroup();
	
	bottomWall = new FlxSprite(0, 500);
	bottomWall.makeGraphic(1000, 200, FlxColor.SALMON);
	bottomWall.immovable = true;
	walls.add(bottomWall);
	
	player = new Player(0, 400);
	debugText = new FlxText(0,0,200, "Test");
	
	add(player);
	add(walls);
	add(debugText);
  }

  override public function destroy():Void
  {
    super.destroy();
  }

  override public function update():Void
  {
    FlxG.collide(null, null, player.forceFun);
    debugText.text = player.speed + "";
    super.update();
  }	
}
