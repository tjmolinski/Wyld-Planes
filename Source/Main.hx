package;

import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;

class Main extends Sprite {

  public function new () {
    super ();
    var bitmapData = Assets.getBitmapData("assets/Images/logo.png");
    var bitmap = new Bitmap(bitmapData);
    addChild(bitmap);

    bitmap.x = 100;
    bitmap.y = 200;
  }
}
