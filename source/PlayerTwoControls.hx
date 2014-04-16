package;
import flixel.FlxG;

class PlayerTwoControls extends Controls {
  public function new() {
    super();
  }

  override public function pressingAction() : Bool {
    return FlxG.keys.pressed.E;
  }

  override public function pressingTurnLeft() : Bool {
    return FlxG.keys.pressed.A;
  }

  override public function pressingTurnRight() : Bool {
    return FlxG.keys.pressed.D;
  }

  override public function pressingDeccel() : Bool {
    return FlxG.keys.pressed.S;
  }

  override public function pressingAccel() : Bool {
    return FlxG.keys.pressed.W;
  }
}
