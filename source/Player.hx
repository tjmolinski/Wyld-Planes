package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;

class Player extends FlxSprite
{	
  public var speed : Float = 0;
  var velX : Float = 0;
  var velY : Float = 0;
  var lastRadX : Float = 0;
  var lastRadY : Float = 0;
  var accel : Float = 2;
  var deccel : Float = 2;
  var speedDecay : Float = 0.995;
  var rotationStep : Float = 1;
  var maxSpeed : Float = 300;
  var onGround : Bool = false;
  public var forceFun : Dynamic -> Dynamic -> Void;

  public function new(X : Float, Y : Float) 
  {
    super(X, Y);
    x = X;
    y = Y;
    angle = 90;
    loadGraphic("assets/images/Hero.png", false, false, 10, 10, false);
    forceFun = force;
  }

  override public function destroy():Void 
  {
    super.destroy();
  }

  override public function update():Void
  {
    if (speed > 0.2) {
      speed *= speedDecay;
    } else {
      speed = 0;
    }

    if(FlxG.keys.pressed.RIGHT) {
      angle += (rotationStep * speed) * FlxG.elapsed;
    }
    if(FlxG.keys.pressed.LEFT) {
      angle -= (rotationStep * speed) * FlxG.elapsed;
    }
    if(FlxG.keys.pressed.DOWN && speed > 0) {
      speed -= deccel;
    }
    if(FlxG.keys.pressed.UP && speed < maxSpeed) {
      speed += accel;
    }

    var xRad : Float = Math.sin(angle*(Math.PI/180));
    var yRad : Float = Math.cos(angle*(Math.PI/180)) * -1;
    var speedX : Float = xRad*speed;
    var speedY : Float = yRad*speed;

    if(FlxG.keys.pressed.SPACE) {
      var playerState : PlayState = cast(FlxG.state, PlayState);
      var bullet : FlxSprite = cast(playerState.bullets.recycle(), FlxSprite);
      bullet.reset(x+(width/2)-2, y+(height/2)-2); 
      bullet.solid = false;
      var norm : Float = Math.sqrt((xRad*xRad) + (yRad*yRad));
      if(norm != 0) {
	bullet.velocity.x = (xRad/norm) * 500;
	bullet.velocity.y = (yRad/norm) * 500;
	lastRadX = xRad;
	lastRadY = yRad;
      } else {
	bullet.velocity.x = (lastRadX/norm) * 500;
	bullet.velocity.y = (lastRadY/norm) * 500;
      }
    }

    if (speed < 100) {
      if (velY < maxSpeed) {
	velY += 20 * FlxG.elapsed;
      }
    } else {
      velY = 0;
    }

    if(onGround && speed < 100) {
      angle = 90;
      speedY = 0;
    } else {
      speedY += velY;
    }

    x += speedX * FlxG.elapsed;
    y += speedY * FlxG.elapsed;

    onGround = false;
  }	

  public function force(a: FlxObject, b:FlxObject) : Void {
    onGround = true;
  }
}
