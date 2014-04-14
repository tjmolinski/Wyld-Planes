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
  var player : Player;
  private var walls : FlxGroup;
  public var bullets : FlxGroup;
  
  private var bottomWall : FlxSprite;
  private var debugText : FlxText;

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
	
	bottomWall = new FlxSprite(0, 700);
	bottomWall.makeGraphic(1768, 100, FlxColor.SALMON);
	bottomWall.immovable = true;
	walls.add(bottomWall);
	
	player = new Player(0, 690);
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
    if(FlxG.keys.pressed.ESCAPE) {
      System.exit(0);
    }
    FlxG.collide(null, null, player.forceFun);
    debugText.text = player.speed + "";
    super.update();
  }	
}
