package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;

class Player extends FlxSprite {	
  var id : Int = -1;
  var speed : Float = 0;
  var velX : Float = 0;
  var velY : Float = 0;
  var accel : Float = 2;
  var deccel : Float = 2;
  var speedDecay : Float = 0.995;
  var rotationStep : Float = 1;
  var maxSpeed : Float = 300;
  var bulletSpeed : Float = 500;
  var controls : Controls;

  public function new(newId : Int, newX : Float, newY : Float) {
    super(newX, newY);
    id = newId;
    x = newX;
    y = newY;
    angle = newId == 0 ? 90: -90; //Little hack to have players face each other
    loadGraphic("assets/images/Hero.png", false, false, 10, 10, false);
    controls = getPlayerController(newId); //Instantiate a controller object for the player
  }

  override public function destroy():Void {
    super.destroy();
  }

  override public function update():Void {
    //If we are traveling at a speed greater then the threshold apply friction
    if (speed > 0.2) {
      speed *= speedDecay;
    } else {
      speed = 0;
    }

    if(controls.pressingTurnRight()) {
      angle += (rotationStep * speed) * FlxG.elapsed; //Effect how much we can turn depending on speed
    }
    if(controls.pressingTurnLeft()) {
      angle -= (rotationStep * speed) * FlxG.elapsed; //Effect how much we can turn depending on speed
    }
    if(controls.pressingDeccel() && speed > 0) {
      speed -= deccel;	//Start slowing down
    }
    if(controls.pressingAccel() && speed < maxSpeed) {
      speed += accel;	//Start speeding up
    }

    var xRad : Float = Math.sin(angle*(Math.PI/180)); //x angle in radians
    var yRad : Float = Math.cos(angle*(Math.PI/180)) * -1; //y angle in radians
    var speedX : Float = xRad*speed;
    var speedY : Float = yRad*speed;

    if(controls.pressingAction()) {
      shootBullet(xRad, yRad);
    }

    if (speed < 100) { //Don't allow take the plane to change pitch if it doesn't have enough speed
      if (velY < maxSpeed) {
	velY += 20 * FlxG.elapsed;
      }
    } else {
      velY = 0;
    }

    speedY += velY;

    //Apply the velocity to the plane
    x += speedX * FlxG.elapsed;
    y += speedY * FlxG.elapsed;
  }	

  private function shootBullet(xRad : Float, yRad : Float):Void {
    var playerState : PlayState = cast(FlxG.state, PlayState); //Grabbing a handle to the PlayState so we can access the bullet pool

    var bullet : FlxSprite = cast(playerState.bullets.recycle(), FlxSprite); //Grab a bullet from the pool
    bullet.reset(x+(width/2)-2, y+(height/2)-2); //Position the bullet to be at the center of the plane
    bullet.solid = false; //Temporary solution so bullets would not effect the plane

    //Apply the velocity to the bullet
    bullet.velocity.x = xRad * bulletSpeed;
    bullet.velocity.y = yRad * bulletSpeed;
  }

  //There must be a better place for this...
  private function getPlayerController(playerId : Int) : Controls {
    switch(playerId) {
      case 0:
	return (new PlayerOneControls());
      case 1:
	return (new PlayerTwoControls());
    }

    //Return empty controls
    return new Controls();
  }
}
