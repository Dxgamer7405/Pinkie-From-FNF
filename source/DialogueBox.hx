package;

import flixel.FlxGame;
import flixel.system.FlxSound;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Lib;
import openfl.display.BitmapData;
import openfl.media.Sound;
import sys.io.File;
import sys.io.Process;




using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	static inline final GF_DEFAULT = 'gf default';

	var box:FlxSprite;
	var skipText:FlxText;
	var curCharacter:String = '';

	var curAnim:String = '';
	var prevChar:String = '';
	var preText:String = '';
	
	var wasHidden:Bool = true;

	var effectQue:Array<String> = [""];
	var effectParamQue:Array<String> = [""];

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];
	
	var textShake:Float = 0;
	var boxShake:Float = 0;
	var bgShake:Float = 0;
	var textSpeed:Float = 0.04;
	
	var arrow:FlxSprite;

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???/
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;
	//Cutscene shit, HAS TO LOAD ON EVERY STAGE IDIOT
	var cutsceneImage:FlxSprite;
	var sound:FlxSound;

	public var finishThing:Void->Void;
	public var portraitList:Array<String> = [];
	public var portraitNameList:Array<String> = [];
	public var portraits:Array<Portrait> = [];

	
	var portraitBF:Portrait;
	var portraitGF:Portrait;
	var portraitDAD:Portrait;
	var portraitSPOOKY:Portrait;
	var portraitMONSTER:Portrait;
	var portraitPICO:Portrait;
	var portraitDARNELL:Portrait;
	var portraitNENE:Portrait;
	var portraitMOM:Portrait;
	var portraitIMPS:Portrait;
	var portraitNOCHAR:Portrait;
	var portraitPINKIE:Portrait;
	

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	
	//var handSelect:FlxSprite;
	var bgFade:FlxSprite;
	var blackBG:FlxSprite;

	
	var canAdvance = false;
	var canSkip = false;
	var inAutoText:Bool = false;
	
	var timeBeforeSkip:FlxTimer;
	var fadeMusic:Bool = true;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>,fadeMusic:Bool=true)
	{
		super();
		this.fadeMusic = fadeMusic;
		arrow = new FlxSprite(1091.1, 641.75);
		arrow.frames = Paths.getSparrowAtlas("pinkie/arrow", "shared");
		arrow.animation.addByIndices("arrow", "arrow", [0,1,2], "", 8);
		arrow.animation.play("arrow",true);

		timeBeforeSkip = new FlxTimer();
		new FlxTimer().start(0.5, function(tmr:FlxTimer)
		{
				canAdvance = true;
		});

		blackBG = new FlxSprite(-256, -256).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
		add(blackBG);
	
		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		cutsceneImage = new FlxSprite(0, 0);
		cutsceneImage.visible = false;
		add(cutsceneImage);	

		//if (PlayState.SONG.song.toLowerCase() == 'tutorial')
		//bgFade.visible = false;

		FlxTween.tween(bgFade, {alpha: 0.7}, 1, {ease: FlxEase.circOut});

		box = new FlxSprite(-20, 45);
		//REPOSITIONING, NEW ANIMATIONS AND MUSIC SHIT IDIOTS
		var hasDialog = false;
			
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('pinkie/txtbox', 'shared');
				box.animation.addByPrefix('normalOpen', 'textbox', 24, false);
				box.animation.addByIndices('normal', 'textbox',[15],"", 24, true);
				box.y = 415.9;
				box.x = 0;
				////trace("loaded "+)
		this.dialogueList = dialogueList;

		if (!hasDialog)
			return;
		
			portraitList = CoolUtil.coolTextFile(Paths.txt("portraitList"));
			for (i in portraitList){
				var shit:Array<String> = i.split(" ");
				//trace(shit);
				var name = shit[0];
				var xx = Std.parseInt(shit[1]);
				var yy = Std.parseInt(shit[2]);
				var p:Portrait = new Portrait(xx, yy, name);
				
				portraits.push(p);
				portraitNameList.push(shit[0]);
				
				add(p);
				
			}

		
		box.animation.play('normalOpen');
		//box.setGraphicSize(Std.int(box.width * 0.9));
		//box.updateHitbox();
		add(box);
	
		box.screenCenter(X);
	

		//handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('hand_textbox', 'shared'));
		//add(handSelect);

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(190, 484, 900, "", 48);
		dropText.font = 'Equestria';
		//dropText.setFormat(Paths.font("Equestria.otf"), 48);
		dropText.color = 0x00000000;
		dropText.alpha = 0;
		dropText.alignment = 'center';
		add(dropText);
		skipText = new FlxText(5, 695, 640, "Press SPACE to skip the dialogue.\n", 40);
		skipText.scrollFactor.set(0, 0);
		skipText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		skipText.borderSize = 2;
		skipText.borderQuality = 1;
		add(skipText);

		swagDialogue = new FlxTypeText(188, 482,900, "", 48);
		swagDialogue.font = 'Equestria';
		//swagDialogue.setFormat(Paths.font("PressStart2P.ttf"), 48);
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.alignment = 'center';
		swagDialogue.finishSounds = true;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

				swagDialogue.completeCallback = doAdvance;
		add(arrow);
		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		
		arrow.visible =  !canAdvance;//keep it on hide frame till can advance
		
		
		dropText.text = swagDialogue.text;

		dropText.offset.x = FlxG.random.float( -textShake, textShake);
		dropText.offset.y = FlxG.random.float( -textShake, textShake);

		swagDialogue.offset.x = FlxG.random.float( -textShake, textShake);
		swagDialogue.offset.y = FlxG.random.float( -textShake, textShake);

		box.offset.x = FlxG.random.float( -boxShake, boxShake);
		box.offset.y = FlxG.random.float( -boxShake, boxShake);

		cutsceneImage.offset.x = FlxG.random.float( -bgShake, bgShake);
		cutsceneImage.offset.y = FlxG.random.float( -bgShake, bgShake);
		
#if android
var justTouched:Bool = false;

for (touch in FlxG.touches.list)
{
        if (touch.justPressed)
        {
               justTouched = true;
        }
}
#end
		
		if (bgShake > 0) bgShake-= 1;
		if (textShake > 0) textShake-= 1;
		if (boxShake > 0) boxShake-= 1;
		
		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}
		//portraitIMPS.y = 205;
		//if (curAnim == "imps") portraitIMPS.y = 220;
		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if(FlxG.keys.justPressed.SPACE && !isEnding){

			isEnding = true;
			endDialogue();

		}

		if (FlxG.keys.justPressed.SHIFT && !inAutoText && dialogueStarted == true && !canAdvance && !isEnding)
		{
			timeBeforeSkip.cancel();
			canAdvance = true;
			swagDialogue.skip();
		}
		if (FlxG.keys.justPressed.ENTER && dialogueStarted #if android || justTouched #end == true && canAdvance && !isEnding)
		{
			if (wasHidden){
				wasHidden = false;
				box.animation.play("normalOpen");
			}
			nextShit();
			FlxG.sound.play(Paths.sound('clickText'), 0.8);
		}

		super.update(elapsed);
	}

	function nextShit(){
				preText = "";
		remove(dialogue);
			canAdvance = false;

			//new FlxTimer().start(0.15, function(tmr:FlxTimer)
			//{
			//	canAdvance = true;
			//});


			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;
					endDialogue();
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
	}
	
	
	var isEnding:Bool = false;

	function endDialogue(speed = 1.2){


		hideAll();
		if (this.sound != null) this.sound.stop();
		FlxTween.tween(box, {alpha: 0}, speed, {ease: FlxEase.linear});
		FlxTween.tween(bgFade, {alpha: 0}, speed, {ease: FlxEase.linear});
		FlxTween.tween(cutsceneImage, {alpha: 0}, speed, {ease: FlxEase.linear});
		FlxTween.tween(swagDialogue, {alpha: 0}, speed, {ease: FlxEase.linear});
		FlxTween.tween(blackBG, {alpha: 0}, speed, {ease: FlxEase.linear});
		FlxTween.tween(dropText, {alpha: 0}, speed, {ease: FlxEase.linear});
		FlxTween.tween(skipText, {alpha: 0}, speed, {ease: FlxEase.linear});
		if(fadeMusic)FlxG.sound.music.fadeOut(speed, 0);


		new FlxTimer().start(speed, function(tmr:FlxTimer)
		{
			finishThing();
			kill();
			if(fadeMusic)FlxG.sound.music.stop();
		});

	}

	
	function startDialogue():Void
	{

		var setDialogue = false;
		var skipDialogue = false;
		cleanDialog();
		hideAll();
		box.visible = true;
		box.flipX = true;
		swagDialogue.visible = true;
		dropText.visible = true;
		//trace(curCharacter,curAnim,dialogueList[0]);
		if (portraitNameList.contains(curCharacter)){// if the first thing is a character in the list
				//changeSound('beat',0.6);
				portraits[portraitNameList.indexOf(curCharacter)].playFrame(curAnim);
		}else{//if not do special shit

			switch (curCharacter)
			{
				case "alert":
					var p:Array<String> = dialogueList[0].split(",");
					Application.current.window.alert(p[1],p[0]);
					
					skipDialogue = curAnim == "true";
				case "noChar":
					hideAll();
				case "hideCharacters":
					skipDialogue = true;
					hideAll();
				case "fastEnd":
					endDialogue(0.01);
				case "hideBox":
					wasHidden = true;
					skipDialogue = true;
					box.visible = false;
				case "text":
							skipDialogue = true;
					switch(curAnim){
						case "shake":
							textShake = Std.parseFloat(dialogueList[0]);
						case "speed":
							textSpeed = Std.parseFloat(dialogueList[0]);
						case "variation":
							swagDialogue.setTypingVariation(Std.parseFloat(dialogueList[0]));
						case "pretext":
							if (dialogueList[0] == "`current"){
							preText = swagDialogue.text;
							}else{
							preText = dialogueList[0];
							}
					}
				case "window":
							skipDialogue = true;
					switch(curAnim){
						case "moveX":
							FlxTween.tween(Lib.application.window, {x: Lib.application.window.x + Std.parseInt(dialogueList[0])}, 0.3);
						case "moveY":
							FlxTween.tween(Lib.application.window, {y: Lib.application.window.y + Std.parseInt(dialogueList[0])}, 0.3);
						case "x":
							Lib.application.window.x = Std.parseInt(dialogueList[0]);
						case "y":
							Lib.application.window.y = Std.parseInt(dialogueList[0]);
					}
				case "font":
					skipDialogue = true;
					switch(curAnim){
						case "style":
						swagDialogue.font = Paths.font(dialogueList[0]);
						dropText.font = Paths.font(dialogueList[0]);
						case "color":
						swagDialogue.color = Std.parseInt(dialogueList[0]);
						case "size":
						swagDialogue.size = Std.parseInt(dialogueList[0]);
						dropText.size = Std.parseInt(dialogueList[0]);
					}
				case "box":
					skipDialogue = true;
					switch(curAnim){
						case "shake":
							boxShake = Std.parseFloat(dialogueList[0]);
					}
				case "camEffect":
					skipDialogue = true;
					switch(curAnim){
						case "flash":
							FlxG.camera.flash(FlxColor.WHITE, Std.parseFloat(dialogueList[0]));
					}
				case "effect":
					switch(curAnim){
						case "hidden":
							doAdvance();
							wasHidden = true;
							swagDialogue.visible = false;
							dropText.visible = false;
							box.visible = false;
							setDialogue = true;
							swagDialogue.resetText("");
						default:
							effectQue.push(curAnim);
							effectParamQue.push(dialogueList[0]);
							skipDialogue = true;
					}
				case "bg":
					skipDialogue = true;
					switch(curAnim){
						case "shake":
							bgShake = Std.parseFloat(dialogueList[0]);
						case "hide":
							cutsceneImage.visible = false;
						case "hidefade":
							bgFade.visible = dialogueList[0] == "true";
						default:
							cutsceneImage.visible = true;
							cutsceneImage.loadGraphic(BitmapData.fromFile("assets/shared/images/portrait/bg/" + curAnim + ".png"));
					}
				case "sound":
					skipDialogue = true;
					if (this.sound != null) this.sound.stop();
					switch(curAnim){
						case "stop":
							this.sound.stop();
						default:
						sound = new FlxSound().loadEmbedded(Paths.sound(curAnim));
						sound.play();
						this.sound.looped = (Std.parseInt(dialogueList[0]) == 1);
					}
				case "autoskip":
					skipDialogue = true;
					inAutoText = true;
					canSkip = false;
					new FlxTimer().start(0.16, function(tmr:FlxTimer)
					{
						canAdvance = false;
					});
					switch(curAnim){
						case "during":
								new FlxTimer().start(Std.parseFloat(dialogueList[0]), function(e:FlxTimer){
									inAutoText = false;
									canAdvance = true;
									canSkip = true;
									nextShit();
									
								});
						case "after":
								//trace("doesn't work currently");
								new FlxTimer().start(Std.parseFloat(dialogueList[0]), function(e:FlxTimer){
									inAutoText = false;
									canAdvance = true;
									canSkip = true;
									nextShit();
								});
					}
				case "music":
					skipDialogue = true;
					switch(curAnim){
						case "stop":
							FlxG.sound.music.stop();
						case "fadeIn":
							FlxG.sound.music.fadeIn(1.5, 0, Std.parseFloat(dialogueList[0]));
						case "fadeOut":
							FlxG.sound.music.fadeOut(1.5, 0);
						case "fadeInFull":
							FlxG.sound.music.fadeIn(Std.parseFloat(dialogueList[0]), 0, 1);
						case "fadeOutFull":
							FlxG.sound.music.fadeOut(Std.parseFloat(dialogueList[0]), 0);
						default:
							FlxG.sound.playMusic(Sound.fromFile("assets/music/" + curAnim + ".ogg"), Std.parseFloat(dialogueList[0]));
					}
					
				default:
					//trace("default dialogue event");
					//portraitBF.playFrame();
			}
		}

		prevChar = curCharacter;

		if(!skipDialogue){
			if (!setDialogue){
				swagDialogue.delay = textSpeed;
				swagDialogue.prefix = preText;
				swagDialogue.resetText(dialogueList[0]);
				
				if(!inAutoText){
				timeBeforeSkip.start(swagDialogue.delay*dialogueList[0].length, function(tmr:FlxTimer)
					{
						canAdvance = true;
					});
				}
					
			}

			swagDialogue.start(textSpeed, true);
			runEffectsQue();
		}
		else{

			dialogueList.remove(dialogueList[0]);
			startDialogue();
			
		}

	}
	
	public function doAdvance() 
	{
		
		new FlxTimer().start(0.5, function(tmr:FlxTimer)
		{
				canAdvance = true;
		});
	}

	function cleanDialog():Void
	{
		while(dialogueList[0] == ""){
			dialogueList.remove(dialogueList[0]);
		}

		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		curAnim = splitName[2];
	
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + splitName[2].length  + 3).trim();
		
		
	}

	function runEffectsQue(){
	
		for(i in 0...effectQue.length){

			switch(effectQue[i]){

				case "addX":
					effectAddX(Std.parseFloat(effectParamQue[i]));
				case "addY":
					effectAddY(Std.parseFloat(effectParamQue[i]));
				case "toX":
					effectAddX(Std.parseFloat(effectParamQue[i]));
				case "toY":
					effectAddY(Std.parseFloat(effectParamQue[i]));
				case "fromX":
					effectFromX(Std.parseFloat(effectParamQue[i]));
				case "fromY":
					effectFromY(Std.parseFloat(effectParamQue[i]));
				case "fadeOut":
					effectFadeOut(Std.parseFloat(effectParamQue[i]));
				case "fadeIn":
					effectFadeIn(Std.parseFloat(effectParamQue[i]));
				case "exitStageLeft":
					effectExitStageLeft(Std.parseFloat(effectParamQue[i]));
				case "exitStageRight":
					effectExitStageRight(Std.parseFloat(effectParamQue[i]));
				case "enterStageLeft":
					effectEnterStageLeft(Std.parseFloat(effectParamQue[i]));
				case "enterStageRight":
					effectEnterStageRight(Std.parseFloat(effectParamQue[i]));
				case "rightSide":
					effectFlipRight();
				case "flip":
					effectFlipDirection();
				case "toLeft":
					effectToLeft();
				case "toRight":
					effectToRight();
				case "shake":
					effectShake(Std.parseFloat(effectParamQue[i]));
				default:

			}

		}

		effectQue = [""];
		effectParamQue = [""];

	}

	function changeSound(sound:String, volume:Float){
	swagDialogue.sounds = [FlxG.sound.load(Paths.sound(sound, 'dialogue'), volume)];
	
	}

	function portraitArray(){
	//Why? i don't know, i was bored and hey it's easier to work with
	//var portraitArray = [portraitBF,portraitGF,portraitDAD,portraitSPOOKY,portraitMONSTER,portraitDARNELL,portraitNENE,portraitMOM,portraitPICO,portraitIMPS];
	
	return portraits;
	}
	
	


	function hideAll():Void{
		
		for(i in 0...portraitArray().length){
		portraitArray()[i].hide();
		}
	}

     function effectAddY(?Y:Float = 1){
        
		for(i in 0...portraitArray().length){
		portraitArray()[i].effectAddY(Y);
		}
    }
     function effectAddX(?X:Float = 1){
        
		for(i in 0...portraitArray().length){
		portraitArray()[i].effectFromX(X);
		}
    }
     function effectFromY(?Y:Float = 1){
        
		for(i in 0...portraitArray().length){
		portraitArray()[i].effectFromY(Y);
		}
    }
     function effectFromX(?X:Float = 1){
        
		for(i in 0...portraitArray().length){
		portraitArray()[i].effectAddX(X);
		}
    }
	function effectFadeOut(?time:Float = 1):Void{
		for(i in 0...portraitArray().length){
		portraitArray()[i].effectFadeOut(time);
		}
	}

	function effectFadeIn(?time:Float = 1):Void{
		for(i in 0...portraitArray().length){
		portraitArray()[i].effectFadeIn(time);
		}
	}

	function effectExitStageLeft(?time:Float = 1):Void{
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectExitStageLeft(time);
			}
	}

	function effectExitStageRight(?time:Float = 1):Void{
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectExitStageRight(time);
			}
	}

	function effectFlipRight(){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectFlipRight();
			}
			box.flipX = false;
		
	}
	
	function effectFlipDirection(){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectFlipDirection();
			}
		
	}

	function effectEnterStageLeft(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectEnterStageLeft(time);
			}
		
	}

	function effectEnterStageRight(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectEnterStageRight(time);
			}
	
	}

	function effectToRight(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectToRight(time);
			}
		
		box.flipX = false;
	}

	function effectToLeft(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectToLeft(time);
			}
		
	}
	function effectShake(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectShake(time);
		}
		
	}


	
}
