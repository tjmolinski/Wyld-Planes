package;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.Assets;

class Main extends Sprite {

  var bitmap : Bitmap;

  public function new() {
    super();
    var bitmapData = Assets.getBitmapData("assets/images/logo.png");
    bitmap = new Bitmap(bitmapData);
    addChild(bitmap);

    bitmap.x = 100;
    bitmap.y = 200;
    stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
    stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
  }

  private function onMouseDown(event:MouseEvent) : Void {
    bitmap.x = event.stageX;
    bitmap.y = event.stageY;
  } 

  private function onKeyDown(event:KeyboardEvent) : Void {
    switch(event.keyCode) {
    case Keyboard.DOWN: bitmap.y += 5;
    case Keyboard.UP: bitmap.y -= 5;
    case Keyboard.LEFT: bitmap.x -= 5;
    case Keyboard.RIGHT: bitmap.x += 5;
    }
  }
}

