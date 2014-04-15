package;
import flixel.FlxG;

class Controls {

  var id : Int;

  public function new(newId : Int) {
    id = newId;
  }

  public function pressingAction() : Bool {
    switch(id) {
      case 0:
	return FlxG.keys.pressed.SLASH;
      case 1:
	return FlxG.keys.pressed.E;
    }
    return false;
  }

  public function pressingTurnLeft() : Bool {
    switch(id) {
      case 0:
	return FlxG.keys.pressed.LEFT;
      case 1:
	return FlxG.keys.pressed.A;
    }
    return false;
  }

  public function pressingTurnRight() : Bool {
    switch(id) {
      case 0:
	return FlxG.keys.pressed.RIGHT;
      case 1:
	return FlxG.keys.pressed.D;
    }
    return false;
  }

  public function pressingDeccel() : Bool {
    switch(id) {
      case 0:
	return FlxG.keys.pressed.DOWN;
      case 1:
	return FlxG.keys.pressed.S;
    }
    return false;
  }

  public function pressingAccel() : Bool {
    switch(id) {
      case 0:
	return FlxG.keys.pressed.UP;
      case 1:
	return FlxG.keys.pressed.W;
    }
    return false;
  }
}
