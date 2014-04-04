package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

class PlayState extends FlxState
{
  var player = new FlxSprite();
  var SPEED : Float = 50;

  override public function create():Void
  {
    super.create();
    player.loadGraphic("assets/images/Hero.png");
    player.x = 200;
    player.y = 200;
    add(player);
  }

  override public function destroy():Void
  {
    super.destroy();
  }

  override public function update():Void
  {
    if(FlxG.keys.pressed.RIGHT) {
      player.x += FlxG.elapsed * SPEED;
    }
    if(FlxG.keys.pressed.LEFT) {
      player.x -= FlxG.elapsed * SPEED;
    }
    if(FlxG.keys.pressed.DOWN) {
      player.y += FlxG.elapsed * SPEED;
    }
    if(FlxG.keys.pressed.UP) {
      player.y -= FlxG.elapsed * SPEED;
    }
    super.update();
  }	
}
