package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

class MenuState extends FlxState
{
  override public function create():Void
  {
	FlxG.mouse.visible = false;  
	  
    var logo = new FlxSprite();
    logo.loadGraphic("assets/images/WyldStagzLogo.jpg");
    logo.x = 0;
    logo.y = 0;
    add(logo);
	
    add(new FlxText(0, 0, 100, "Press Enter To Start"));
	
    super.create();
  }

  override public function destroy():Void
  {
    super.destroy();
  }

  override public function update():Void
  {
    if(FlxG.keys.pressed.ENTER) {
      FlxG.switchState(new PlayState());
    }
    super.update();
  }	
}
