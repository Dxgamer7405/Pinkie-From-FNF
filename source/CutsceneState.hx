package;
import flixel.*;
import flixel.FlxState;
import hxcodec.flixel.FlxVideo;

class CutsceneState extends MusicBeatState
{
	var video:String = "mods/introMod/_append/Twi End Cutscene.mp4";
	var next:Void->Void;
	public function new(video:String = "mods/introMod/_append/Twi End Cutscene.mp4",next:Void->Void) 
	{
		super();
		this.video = video;
		this.next = next;
	}
	
	override function create() 
	{
		super.create();
		FlxG.sound.music.stop();
		
		var video:FlxVideo = new FlxVideo(video);
		video.onEndReached.add(function()
  {
    video.dispose();
    end();
    });
		
		FlxG.camera.flash(0xff000000, 0.2);
	}
	
	public static function end(){
		Conductor.changeBPM(110);
		FlxG.switchState(new StoryMenuState());
	}
}