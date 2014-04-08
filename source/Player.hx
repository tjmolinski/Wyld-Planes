package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

class Player extends FlxSprite
{	
  public var speed : Float = 0;
  var velX : Float = 0;
  var velY : Float = 0;
  var accel : Float = 2;
  var deccel : Float = 2;
  var speedDecay : Float = 0.995;
  var rotationStep : Float = 0.5;
  var maxSpeed : Float = 300;
  var onGround : Bool = false;
  public var forceFun : Dynamic -> Dynamic -> Void;

  public function new(X : Float, Y : Float) 
  {
    super(X, Y);
    x = X;
    y = Y;
    angle = 90;
    loadGraphic("assets/images/Hero.png");
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

    var speedX : Float = Math.sin(angle*(Math.PI/180))*speed;
    var speedY : Float = Math.cos(angle*(Math.PI/180))*speed * -1;

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
