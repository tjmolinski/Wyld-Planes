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
  public var walls : FlxGroup;

  public var MAX_NUM_OF_BULLETS : Int = 175;
  public var bullets : FlxGroup;

  public var NUM_OF_PLAYERS : Int = 2;
  public var players : FlxGroup;

  override public function create():Void
  {
    super.create(); 

    createBulletPool();
    createPlayerPool();
    createWallsPool();
  }

  override public function destroy():Void
  {
    super.destroy();
  }

  override public function update():Void
  {
    if(FlxG.keys.pressed.ESCAPE) {
      //Close the game
      System.exit(0);
    }

    //I really have no idea how this works
    FlxG.collide();

    super.update();
  }	

  private function createBulletPool():Void {
    //Maximum number of bullets allowed within the game
    bullets = new FlxGroup(MAX_NUM_OF_BULLETS);

    for(i in 0...MAX_NUM_OF_BULLETS) {
      //Create the bullet offscreen
      var bulletSprite : FlxSprite = new FlxSprite(-200, -200);
      bulletSprite.makeGraphic(4, 4);
      bulletSprite.exists = false;

      //Add the bullet to the pool
      bullets.add(bulletSprite);
    }

    //Add the pool to the scene
    add(bullets);
  }

  private function createPlayerPool():Void {
    //Create the number of players for the game
    players = new FlxGroup(NUM_OF_PLAYERS);

    //Add each player to the pool 
    players.add(new Player(0, 0, 690));
    players.add(new Player(1, 1356, 690));

    //Add the pool to the scene
    add(players);
  }

  private function createWallsPool():Void {
    //Create a pool for the walls
    walls = new FlxGroup();

    //Creating a wall
    var bottomWall : FlxSprite = new FlxSprite(0, 700);
    bottomWall.makeGraphic(1768, 100, FlxColor.SALMON);
    bottomWall.immovable = true;

    //Add the wall to the pool
    walls.add(bottomWall);

    //Add the pool to the scene
    add(walls);
  }
}
