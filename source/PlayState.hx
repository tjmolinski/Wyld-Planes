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
  var block = new FlxSprite();
  var speed : Float = 0;
  var acceleration : Float = 20;
  var speedDecay : Float = 0.99;
  var rotationStep : Float = 30;
  var maxSpeed : Float = 20;
  var backSpeed : Float = 10;

  override public function create():Void
  {
    super.create();
    player.loadGraphic("assets/images/Hero.png");
    player.x = 200;
    player.y = 200;
	block.loadGraphic("assets/images/Hero.png");
	block.x = 400;
	block.y = 200;
    add(player);
	add(block);
  }

  override public function destroy():Void
  {
    super.destroy();
  }

  override public function update():Void
  {
    if(speed > 0.2) {
      speed *= speedDecay;
    } else {
      speed = 0;
    }

    if(FlxG.keys.pressed.RIGHT && speed > 0.1) {
      player.angle += rotationStep * speed * FlxG.elapsed;
    }
    if(FlxG.keys.pressed.LEFT && speed > 0.1) {
      player.angle -= rotationStep * speed * FlxG.elapsed;
    }
    if(FlxG.keys.pressed.DOWN) {
      speed -= backSpeed * FlxG.elapsed;
    }
    if(FlxG.keys.pressed.UP && speed < maxSpeed) {
      speed += acceleration * FlxG.elapsed;
    }

    var speedX : Float = Math.sin(player.angle*(Math.PI/180))*speed;
    var speedY : Float = Math.cos(player.angle*(Math.PI/180))*speed * -1;

    player.x += speedX;
    player.y += speedY;

    FlxG.collide();
    super.update();
  }	
}
