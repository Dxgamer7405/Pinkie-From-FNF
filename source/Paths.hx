package;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxAssets.FlxSoundAsset;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import openfl.media.Sound;
import openfl.utils.Assets as OpenFlAssets;
import sys.FileSystem;

using StringTools;
class Paths
{
	inline public static var SOUND_EXT = #if web "mp3" #else "ogg" #end;

	static var currentLevel:String;
	static var imgCache:Map<String,FlxGraphic> = new Map<String,FlxGraphic>();
	static public function setCurrentLevel(name:String)
	{
		currentLevel = name.toLowerCase();
	}

	static function getPath(file:String, type:AssetType, library:Null<String>)
	{
		if (TitleState.curDir != "assets")
		{
			var path = TitleState.curDir + "/" + file;
			
			if(FileSystem.exists(path)){
				return path;
			}
			
		}
		if (library != null)
			return getLibraryPath(file, library);

		if (currentLevel != null)
		{
			var levelPath = getLibraryPathForce(file, currentLevel);
			if (OpenFlAssets.exists(levelPath, type))
				return levelPath;

			levelPath = getLibraryPathForce(file, "shared");
			if (OpenFlAssets.exists(levelPath, type))
				return levelPath;
		}
		

		return getPreloadPath(file);
	}
	static public function getLibraryPath(file:String, library = "preload")
	{
		return if (library == "preload" || library == "default") getPreloadPath(file); else getLibraryPathForce(file, library);
	}

	inline static function getLibraryPathForce(file:String, library:String)
	{
		return '$library:assets/$library/$file';
	}

	inline static function getPreloadPath(file:String)
	{
		return 'assets/$file';
	}

	inline static public function file(file:String, type:AssetType = TEXT, ?library:String)
	{
		
		return getPath(file, type, library);
	}

	inline static public function txt(key:String, ?library:String)
	{
		return getPath('data/$key.txt', TEXT, library);
	}

	inline static public function txtImages(key:String, ?library:String)
	{
		return getPath('images/$key.txt', TEXT, library);
	}

	inline static public function xml(key:String, ?library:String)
	{
		return getPath('data/$key.xml', TEXT, library);
	}

	inline static public function json(key:String, ?library:String)
	{
		
		return getPath('data/$key.json', TEXT, library);
	}

	static public function sound(key:String, ?library:String)
	{
		
		
		
		return getPath('sounds/$key.$SOUND_EXT', SOUND, library);
	}

	inline static public function soundRandom(key:String, min:Int, max:Int, ?library:String)
	{
		return sound(key + FlxG.random.int(min, max), library);
	}

	inline static public function music(key:String, ?library:String)
	{
		return getPath('music/$key.$SOUND_EXT', MUSIC, library);
	}

	inline static public function voices(song:String):Any
	{
		var file:Sound = returnSongFile(TitleState.curDir+"/songs/"+(song.toLowerCase().replace(' ', '-') + '/Voices.ogg'));
		if(file != null) {
			return file;
		}
		
		return 'songs:assets/songs/${song.toLowerCase()}/Voices.$SOUND_EXT';
	}

	inline static public function inst(song:String):Any
	{
		//if (TitleState.curDir != "assets") return Sound.fromFile(TitleState.curDir + "/songs/${song.toLowerCase()}/Inst.$SOUND_EXT");
		
		
		var file:Sound = returnSongFile(TitleState.curDir+"/songs/"+(song.toLowerCase().replace(' ', '-') + '/Inst.ogg'));
		if(file != null) {
			return file;
		}
		
		return 'songs:assets/songs/${song.toLowerCase()}/Inst.$SOUND_EXT';
	}
	inline static private function returnSongFile(file:String):Sound
	{
		if(FileSystem.exists(file)) {
			return Sound.fromFile(file);
		}
		return null;
	}
	
	inline static public function lua(script:String,?library:String){
			return getPath('data/$script.lua',TEXT,library);
	}

	inline static public function modchart(song:String,?library:String){
		return getPath('data/$song/modchart.lua',TEXT,library);
	}

	inline static public function image(key:String, ?library:String)
	{
		
		
		return getPath('images/$key.png', IMAGE, library);
	}

	inline static public function font(key:String)
	{
		return 'assets/fonts/$key';
	}
	
	
	
	static public function getbmp(key:String):FlxGraphic{
		
		if (!imgCache.exists(key)){
			
			var path = "";
			var balls:Array<String> = [TitleState.curDir,"assets"];
			for (i in balls){
				
				if (FileSystem.exists(i + "/shared/images/"+key+".png")){
					path = i + "/shared/images/"+key+".png";
					break;
				}
				if (FileSystem.exists("mods/"+ i + "/shared/images/"+key+".png")){
					path = "mods/" + i + "/shared/images/"+key+".png";
					break;
				}
			}
			var gra:FlxGraphic;
			var bmp = BitmapData.fromFile(path);
			gra = FlxGraphic.fromBitmapData(bmp, false, key);
			gra.persist = true;
			imgCache.set(key, gra);
		}
		return imgCache.get(key);
	}
	

	inline static public function getSparrowAtlas(key:String, ?library:String)
	{
		
		
		
		

		return FlxAtlasFrames.fromSparrow(image(key, library), file('images/$key.xml', library));
	}

	inline static public function getPackerAtlas(key:String, ?library:String)
	{
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key, library), file('images/$key.txt', library));
	}
}
