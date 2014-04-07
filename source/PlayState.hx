package;

import flixel.FlxG;
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

  override public function create():Void
  {
    super.create(); 
	
	walls = new FlxGroup();
	
	bottomWall = new FlxSprite(0, 500);
	bottomWall.makeGraphic(1000, 200, FlxColor.SALMON);
	bottomWall.immovable = true;
	walls.add(bottomWall);
	
	player = new Player(0, 200);
	
	add(player);
	add(walls);
  }

  override public function destroy():Void
  {
    super.destroy();
  }

  override public function update():Void
  {
    FlxG.collide();
    super.update();
  }	
}
