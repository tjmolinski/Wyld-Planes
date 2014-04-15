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
import flash.system.System;

class PlayState extends FlxState
{
  var block = new FlxSprite();
  private var walls : FlxGroup;
  public var bullets : FlxGroup;
  public var players : FlxGroup;

  private var bottomWall : FlxSprite;

  override public function create():Void
  {
    super.create(); 

    walls = new FlxGroup();
    var numOfBullets : Int = 175;
    bullets = new FlxGroup(numOfBullets);
    var bulletSprite : FlxSprite;
    for(i in 0...numOfBullets) {
      bulletSprite = new FlxSprite(-200, -200);
      bulletSprite.makeGraphic(4, 4);
      bulletSprite.exists = false;
      bullets.add(bulletSprite);
    }
    add(bullets);

    players = new FlxGroup(2);
    players.add(new Player(0, 0, 690));
    players.add(new Player(1, 1356, 690));
    add(players);

    bottomWall = new FlxSprite(0, 700);
    bottomWall.makeGraphic(1768, 100, FlxColor.SALMON);
    bottomWall.immovable = true;
    walls.add(bottomWall);
    add(walls);
  }

  override public function destroy():Void
  {
    super.destroy();
  }

  override public function update():Void
  {
    if(FlxG.keys.pressed.ESCAPE) {
      System.exit(0);
    }
    FlxG.collide();
    super.update();
  }	
}
