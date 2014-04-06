package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

class PlayState extends FlxState
{
  var block = new FlxSprite();
  var player : Player;

  override public function create():Void
  {
    super.create(); 
	
	player = new Player(200, 200);
	
	block.loadGraphic("assets/images/Hero.png");
	block.x = 400;
	block.y = 200;
	add(block);
	add(player);
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
