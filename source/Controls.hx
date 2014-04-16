package;
import flixel.FlxG;

class Controls {
  public function new() {
  }

  public function pressingAction() : Bool {
    //Overwrite this in inherited class
    return false;
  }

  public function pressingTurnLeft() : Bool {
    //Overwrite this in inherited class
    return false;
  }

  public function pressingTurnRight() : Bool {
    //Overwrite this in inherited class
    return false;
  }

  public function pressingDeccel() : Bool {
    //Overwrite this in inherited class
    return false;
  }

  public function pressingAccel() : Bool {
    //Overwrite this in inherited class
    return false;
  }
}
