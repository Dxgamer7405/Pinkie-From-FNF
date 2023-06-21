package;

import flixel.FlxG;
import flixel.FlxSprite;
import openfl.display.BitmapData;
import sys.FileSystem;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	public var shake:Float = 0;

	public function changeCharacter(char:String){
		
		antialiasing = true;
		if (TitleState.curDir != "assets"){
			trace(char, TitleState.curDir + '/images/icon-' + char + '.png');
			
			if(Util.exists(TitleState.curDir+'/images/icon-'+char+'.png')){
			
			loadGraphic(BitmapData.fromFile(TitleState.curDir+'/images/icon-'+char+'.png'), true, 150, 150);
			animation.add(char, [0, 1], 0, false);
			}else{
				
				loadGraphic(Paths.image('iconGrid'), true, 150, 150);
				animation.add('face', [10, 11], 0, false);
			}
			
		}else if (char == 'pinkie'){
		loadGraphic(Paths.image('icons'), true, 150, 150);

		animation.add('pinkie', [0, 1], 0, false);
		}else if (char == 'pinkie-hd'){
		loadGraphic(Paths.image('icons-hd'), true, 150, 150);

		}else if (char == 'discord'){
		loadGraphic(Paths.image('icons-discord'), true, 150, 150);

		animation.add('bloom', [0, 1], 0, false);
		}else if (char == 'bloom'){
		loadGraphic(Paths.image('icon-bloom'), true, 150, 150);

		animation.add('babs', [0, 1], 0, false);
		}else if (char == 'babs'){
		loadGraphic(Paths.image('icon-babs'), true, 150, 150);

		animation.add('pie', [0, 1], 0, false);
		}else if (char == 'pie'){
		loadGraphic(Paths.image('icon-pie'), true, 150, 150);

		animation.add('amy', [0, 1], 0, false);
		}else if (char == 'amy'){
		loadGraphic(Paths.image('icon-amy'), true, 150, 150);

		animation.add('bf_cupcakes', [0, 1], 0, false);
		}else if (char == 'bf_cupcakes'){
		loadGraphic(Paths.image('icon-bf_cupcakes'), true, 150, 150);

		animation.add('pinkie_cupcakes', [0, 1], 0, false);
		}else if (char == 'pinkie_cupcakes'){
		loadGraphic(Paths.image('icon-pinkie_cupcakes'), true, 150, 150);

		animation.add('jack', [0, 1], 0, false);
		}else if (char == 'jack'){
		loadGraphic(Paths.image('icon-jack'), true, 150, 150);

		animation.add('capt', [0, 1], 0, false);
		}else if (char == 'capt'){
		loadGraphic(Paths.image('icon-capt'), true, 150, 150);

		animation.add('pixel_bloom', [0, 1], 0, false);
		}else if (char == 'pixel_bloom'){
		loadGraphic(Paths.image('icon-pixel_bloom'), true, 150, 150);

		animation.add('threeleaf', [0, 1], 0, false);
		}else if (char == 'threeleaf'){
		loadGraphic(Paths.image('icon-threeleaf'), true, 150, 150);

		animation.add(char, [0, 1], 0, false);
		}else{
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		animation.add('bf', [0, 1], 0, false);
		animation.add('bf-car', [0, 1], 0, false);
		animation.add('bf-christmas', [0, 1], 0, false);
		animation.add('spooky', [2, 3], 0, false);
		animation.add('pico', [4, 5], 0, false);
		animation.add('mom', [6, 7], 0, false);
		animation.add('mom-car', [6, 7], 0, false);
		animation.add('tankman', [8, 9], 0, false);
		animation.add('face', [10, 11], 0, false);
		animation.add('dad', [12, 13], 0, false);
		animation.add('bf-old', [14, 15], 0, false);
		animation.add('gf', [16], 0, false);
		animation.add('lizzy', [16], 0, false);
		animation.add('parents-christmas', [17], 0, false);
		animation.add('monster', [19, 20], 0, false);
		animation.add('monster-christmas', [19, 20], 0, false);
		animation.add('bf-pixel', [21, 21], 0, false);
		animation.add('senpai', [22, 22], 0, false);
		animation.add('senpai-angry', [22, 22], 0, false);
		animation.add('spirit', [23, 23], 0, false);
		animation.add('bf-neb', [24, 25], 0, false);
		}
		if(animation.getByName(char)!=null)
			animation.play(char);
		else
			animation.play("face");
	}
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		flipX=isPlayer;
		changeCharacter(char);

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		offset.set(FlxG.random.float( -shake, shake), FlxG.random.float( -shake, shake));
		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
