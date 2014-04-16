package;
import flixel.FlxG;

class PlayerOneControls extends Controls {
  public function new() {
    super();
  }

  override public function pressingAction() : Bool {
    return FlxG.keys.pressed.SLASH;
  }

  override public function pressingTurnLeft() : Bool {
    return FlxG.keys.pressed.LEFT;
  }

  override public function pressingTurnRight() : Bool {
    return FlxG.keys.pressed.RIGHT;
  }

  override public function pressingDeccel() : Bool {
    return FlxG.keys.pressed.DOWN;
  }

  override public function pressingAccel() : Bool {
    return FlxG.keys.pressed.UP;
  }
}
