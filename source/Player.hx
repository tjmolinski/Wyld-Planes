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
	//Direction
	var dir_Right : Int = 90;
	var dir_Left : Int = 270;
	var dir_Up : Int = 45;
	var dir_Down : Int = 135;
	
	var dir_UpRight : Int;
	var dir_DownRight : Int;
	var dir_UpLeft : Int;
	var dir_DownLeft : Int;
	
	//Direction var
	var pastDirection : Int;
	var direction : Int;
	
	//Movement
	var max_speed : Int = 150;
	var _acceleration : Int = 25;
	var _drag : Int = 25;
	
	public function new(X : Float, Y : Float) 
	{
		super(X, Y);
		x = X;
		y = Y;
		
		dir_UpRight = dir_Right | dir_Up;
		dir_DownRight = dir_Right | dir_Down;
		dir_UpLeft = dir_Left | dir_Up;
		dir_DownLeft = dir_Left | dir_Down;
		
		//Initial angle
		angle = dir_Right;
		
		//Graphics
		loadGraphic("assets/images/Hero.png");
	}
	
	override public function destroy():Void 
	{
		super.destroy();
	}
	
	override public function update():Void
	{
		velocity.x = 0;
		velocity.y = 0;
		direction = 0;
		pastDirection = direction;
		
		var x_direction : Int = 0;
		var y_direction : Int = 0;
						
		if (FlxG.keys.pressed.RIGHT && velocity.x < max_speed)
		{
			direction = dir_Right;
			x_direction = direction;
			velocity.x += _acceleration;
		}
		if (FlxG.keys.pressed.LEFT && velocity.x < max_speed)
		{
			direction = dir_Left;
			x_direction = direction;
			velocity.x += -_acceleration;
		}
		if (FlxG.keys.pressed.UP)
		{
			if (direction != 0)
			{
				direction = dir_Up;
				y_direction = direction;
				velocity.y = -_acceleration;
			}
		}
		if (FlxG.keys.pressed.DOWN)
		{
			if (direction != 0)
			{
				direction = dir_Down;
				y_direction = direction;
				velocity.y = _acceleration;	
			}
		}
		
		direction = x_direction | y_direction;
		
		if(direction == dir_Right)
			angle = 90;
		else if(direction == dir_Left)
			angle = 270;
		else if (direction == dir_UpRight)
			angle = 45;
		else if (direction == dir_DownRight)
			angle = 135;
		else if (direction == dir_UpLeft)
			angle = 315;
		else if (direction == dir_DownLeft)
			angle = 225;
		
		super.update();
	}	
}
