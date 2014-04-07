package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Brian
 */
class Player extends FlxSprite
{	
	var speed : Float = 0;
	var accel : Float = 15;
	var speedDecay : Float = 0.99;
	var rotationStep : Float = 60;
	var maxSpeed : Float = 5;
	var backSpeed : Float = 10;

	public function new(X : Float, Y : Float) 
	{
		super(X, Y);
		x = X;
		y = Y;
		loadGraphic("assets/images/Hero.png");
	}
	
	override public function destroy():Void 
	{
		super.destroy();
	}
	
	override public function update():Void
	{
		if (speed > 0.2) 
		{
		  speed *= speedDecay;
		} else 
		{
		  speed = 0;
		}

		if(FlxG.keys.pressed.RIGHT && speed > 0.1) {
		  angle += rotationStep * speed * FlxG.elapsed;
		}
		if(FlxG.keys.pressed.LEFT && speed > 0.1) {
		  angle -= rotationStep * speed * FlxG.elapsed;
		}
		if(FlxG.keys.pressed.DOWN) {
		  speed -= backSpeed * FlxG.elapsed;
		}
		if(FlxG.keys.pressed.UP && speed < maxSpeed) {
		  speed += accel * FlxG.elapsed;
		}

		var speedX : Float = Math.sin(angle*(Math.PI/180))*speed;
		var speedY : Float = Math.cos(angle*(Math.PI/180))*speed * -1;

		x += speedX;
		y += speedY;
	}	
}