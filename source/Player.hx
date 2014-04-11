package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

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
		
		//Flying speed
		maxVelocity.x = 200;
	
		//Gravity
		acceleration.y = 400;
	
		//Deceleration
		drag.x = maxVelocity.x * 2;
		
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
		direction = 0;
		pastDirection = direction;
		
		var x_direction : Int = 0;
		var y_direction : Int = 0;
		
		acceleration.x = 0;
						
		if (FlxG.keys.pressed.RIGHT)
		{
			//Going right
			direction = dir_Right;
			//Set x direction
			x_direction = direction;
			//Since moving in direction, don't drag plane down
			velocity.y = 0;
			//Move plane faster
			acceleration.x += drag.x;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			//Going left
			direction = dir_Left;
			//Going left, set that direction
			x_direction = direction;
			//Since moving in direction, don't drag plane down
			velocity.y = 0;
			//Move plane faster
			acceleration.x -= drag.x;
		}
		if (FlxG.keys.pressed.UP)
		{
			//Only move up while pressing direction.
			if (direction != 0)
			{
				//Set direction to up
				direction = dir_Up;
				//Set y direction to up
				y_direction = direction;
				//Set the y velocity correctly to up
				velocity.y = -acceleration.y/2;
			}
		}
		if (FlxG.keys.pressed.DOWN)
		{
			//Only move down while pressing button
			if (direction != 0)
			{
				//Set direction to down.
				direction = dir_Down;
				//Set the y direction to down
				y_direction = direction;
				//set the y velocity correctly to down
				velocity.y = acceleration.y/2;	
			}
		}
		
		//OR the two directions together
		direction = x_direction | y_direction;
		
		//Set proper angle
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
		
		//Update parent class.
		super.update();
	}	
}