local followchar = false
mustHit = false

local px = 500
local py = 280
multgame = 1
multhud = 1
local bx = 800
local by = 360
slap = false
local ofs = 20
camspeed = 1
local watchALT = '_left'
local watchANIM = ''
walkaway = false
function createPost()
setVar('camHUD.visible',false)
	dad.x = 320
	dad.y = 13

	bf.x = 631
	bf.y = 110

	dad.disabledDance = true
	bf.disabledDance = true
	gf.visible = false
setVar('defaultCamZoom',1.3)
setVar('skipCountdown',true)
setVar('camPos.x',1280)
setVar('camPos.y',720)
setVar('camFollow.x',640)
setVar('camFollow.y',360)
setCamPos(511.5,293.7)


newSprite(-144,-164,true,'sky')
sky.loadGraphic(sky,'sky')
sky.antialiasing = true
sky.scrollFactorX = 0.1
sky.scrollFactorY = 0.1
sky.setScale(sky,1.2)


newSprite(-1371,169.8,true,'hills')
hills.loadGraphic(hills,'hills')
hills.antialiasing = true
hills.scrollFactorX = 0.3
hills.scrollFactorY = 0.3

newSprite(-1025.5,73.1,true,'houses')
houses.loadGraphic(houses,'houses')
houses.antialiasing = true
houses.scrollFactorX = 0.6
houses.scrollFactorY = 0.6


newSprite(325.05,118.5,true,'house')
house.loadGraphic(house,'house')
house.antialiasing = true
house.scrollFactorX = 0.6
house.scrollFactorY = 0.6


newSprite(-1121.7,491.65,true,'road')
road.loadGraphic(road,'road')
road.antialiasing = true
road.scrollFactorX = 0.9
road.scrollFactorY = 0.9




newSprite(561,333,true,'sonic')
sonic.loadGraphic(sonic,'sonic')
sonic.setFrames(sonic,'sonic')
sonic.addAnim(sonic,'idle_left',{0},0)
sonic.addAnim(sonic,'blink_left',{1},0)
sonic.addAnim(sonic,'idle_left-surprised',{2},0)
sonic.addAnim(sonic,'idle_left-bored',{3},0)

sonic.addAnim(sonic,'idle_right',{4},0)
sonic.addAnim(sonic,'blink_right',{5},0)
sonic.addAnim(sonic,'idle_right-surprised',{6},0)
sonic.addAnim(sonic,'idle_right-bored',{7},0)

sonic.addAnim(sonic,'look',{8},0)
sonic.addAnim(sonic,'walkaway',{9,10,11,12},4,true)
sonic.playAnim(sonic,'idle_left')
sonic.antialiasing = true




newSprite(631,380,true,'rainbowdash')
rainbowdash.loadGraphic(rainbowdash,'rainbowdash')
rainbowdash.setFrames(rainbowdash,'rainbowdash')
rainbowdash.addAnim(rainbowdash,'idle_left',{0},0)
rainbowdash.addAnim(rainbowdash,'blink_left',{1},0)
rainbowdash.addAnim(rainbowdash,'idle_left-surprised',{2},0)
rainbowdash.addAnim(rainbowdash,'idle_left-bored',{3},0)

rainbowdash.addAnim(rainbowdash,'idle_right',{4},0)
rainbowdash.addAnim(rainbowdash,'blink_right',{5},0)
rainbowdash.addAnim(rainbowdash,'idle_right-surprised',{6},0)
rainbowdash.addAnim(rainbowdash,'idle_right-bored',{7},0)

rainbowdash.addAnim(rainbowdash,'look',{8},0)
rainbowdash.addAnim(rainbowdash,'walkaway',{9,10,11,12},4,true)
rainbowdash.playAnim(rainbowdash,'idle_left')
rainbowdash.antialiasing = true

rainbowdash.scrollFactorX = 0.87
rainbowdash.scrollFactorY = 0.87
sonic.scrollFactorX = 0.87
sonic.scrollFactorY = 0.87


newSprite(-752.2,709.1,true,'roadF')
roadF.loadGraphic(roadF,'roadF')
roadF.antialiasing = true
roadF.scrollFactorX = 1.2
roadF.scrollFactorY = 1.2


newSprite(270.55-133,631.95-3,true,'shadow')
shadow.loadGraphic(shadow,'shadow')
shadow.antialiasing = true
shadow.scrollFactorX = 1
shadow.scrollFactorY = 1


newSprite(-2006,-131.4,true,'pinkiewhistle','other')
pinkiewhistle.loadGraphic(pinkiewhistle,'pinkiewhistle')
pinkiewhistle.setFrames(pinkiewhistle,'pinkiewhistle')
pinkiewhistle.addAnim(pinkiewhistle,'pinkiewhistle',{0,1,2,3,4,5},24,true)
pinkiewhistle.playAnim(pinkiewhistle,'pinkiewhistle')
pinkiewhistle.antialiasing = true



newSprite(1428.75,2,true,'pinkieGroup')
pinkieGroup.loadGraphic(pinkieGroup,'pinkieGroup')
pinkieGroup.setFrames(pinkieGroup,'pinkieGroup')
pinkieGroup.addAnimByPrefix(pinkieGroup,'pinkieGroup','pinkieGroup0',24,false)
pinkieGroup.addAnimByPrefix(pinkieGroup,'idle','pinkieGroupBounce',12,false)
pinkieGroup.playAnim(pinkieGroup,'pinkieGroup')
pinkieGroup.antialiasing = true
pinkieGroup.scrollFactorX = 0.95
pinkieGroup.scrollFactorY = 0.95
pinkieGroup.setOrigin(pinkieGroup,0,0)
pinkieGroup.visible = false


newSprite(1395.1,-234.35,false,'pinkieGroup2')
pinkieGroup2.loadGraphic(pinkieGroup2,'pinkieGroup')
pinkieGroup2.setFrames(pinkieGroup2,'pinkieGroup')
pinkieGroup2.addAnimByPrefix(pinkieGroup2,'pinkieGroup','pinkieGroup0',24,false)
pinkieGroup2.addAnimByPrefix(pinkieGroup2,'idle','pinkieGroupBounce',12,false)
pinkieGroup2.playAnim(pinkieGroup2,'pinkieGroup')
pinkieGroup2.antialiasing = true
pinkieGroup2.setScale(pinkieGroup2,1.64)
pinkieGroup2.scrollFactorX = 1.2
pinkieGroup2.scrollFactorY = 1.2
pinkieGroup2.setOrigin(pinkieGroup2,0,0)
pinkieGroup2.visible = false



newSprite(-3367.05,-30,true,'amyGroup')
amyGroup.loadGraphic(amyGroup,'amyGroup')
amyGroup.setFrames(amyGroup,'amyGroup')
amyGroup.addAnimByPrefix(amyGroup,'amyGroup','amycrowd',24,false)
amyGroup.addAnimByPrefix(amyGroup,'idle','amybounce',12,false)
amyGroup.playAnim(amyGroup,'amyGroup')
amyGroup.antialiasing = true
amyGroup.scrollFactorX = 0.95
amyGroup.scrollFactorY = 0.95
amyGroup.setOrigin(amyGroup,0,0)
amyGroup.visible = false


newSprite(-3098.9,-240.45,false,'amyGroup2')
amyGroup2.loadGraphic(amyGroup2,'amyGroup')
amyGroup2.setFrames(amyGroup2,'amyGroup')
amyGroup2.addAnimByPrefix(amyGroup2,'amyGroup','amycrowd',24,false)
amyGroup2.addAnimByPrefix(amyGroup2,'idle','amybounce',12,false)
amyGroup2.playAnim(amyGroup2,'amyGroup')
amyGroup2.antialiasing = true
amyGroup2.setScale(amyGroup2,1.64)
amyGroup2.scrollFactorX = 1.2
amyGroup2.scrollFactorY = 1.2
amyGroup2.setOrigin(amyGroup2,0,0)
amyGroup2.visible = false



end
local frames = 0
function startSong()

bf.playAnim(bf,'talk1')
dad.playAnim(dad,'talk1')

end
function beatHit(curbeat)

	followchar = curbeat >= 20


	if curbeat >= 52 and curbeat % camspeed == 0 then
		beatCam(0.03*multgame,0.06*multhud)
	end

	if curbeat == 22 then

setCamPos(808,276,true)
	dad.disabledDance = false
	end
	if curbeat == 32 then

	bf.disabledDance = false
	end



	if curbeat > 244 then
	camspeed = 4
	setVar('dad.danceSpeed',4)
	setVar('boyfriend.danceSpeed',4)
	setVar('bfaltAnim','-alt')
	setVar('dadaltAnim','-alt')
	end

	if curbeat == 276 then
	slap = false
		tweenVar('camHUD.alpha',0,0.4)
		tweenVar('defaultCamZoom',1.2,1.2)
		setCamPos(421.5,253.7)

	end

	if curbeat == 283 then
		dad.disabledDance = true
		bf.disabledDance = true
		dad.playAnim(dad,'talk2')
		bf.playAnim(bf,'talk2')
	end
	if curbeat == 293 then
		setCamPos(648,276)
	end
	if curbeat == 302 then
		setCamPos(848,276)
		setVar('defaultCamZoom',1.4)
		setVar('camGame.zoom',1.6)
	end
	if curbeat == 305 then
		setVar('defaultCamZoom',1.2)
	end
	if curbeat == 307 then
		pinkiewhistle.tween(pinkiewhistle,{['x']=-206},0.3,'sineOut')
		setVar('defaultCamZoom',1.4)
	end
	if curbeat == 310 then
		pinkiewhistle.tween(pinkiewhistle,{['x']=2000},0.8,'sineIn')
		setVar('defaultCamZoom',0.8)
	end
	if curbeat == 312 then
pinkieGroup.visible = true
pinkieGroup2.visible = true
pinkieGroup.tween(pinkieGroup,{['x']=492},1,'circInOut')
pinkieGroup2.tween(pinkieGroup2,{['x']=726},1,'circOut')
pinkieGroup.playAnim(pinkieGroup,'pinkieGroup')
pinkieGroup2.playAnim(pinkieGroup2,'pinkieGroup')
		gameCam.shake(gameCam,0.01,1.4)
	end
	if curbeat == 321 then
		tweenVar('camFollow.x',420,1.2)
		tweenVar('camFollow.y',290,1.2)
	end

	if curbeat == 344 then
amyGroup.visible = true
amyGroup2.visible = true
amyGroup.tween(amyGroup,{['x']=-367.05},1,'circInOut')
amyGroup2.tween(amyGroup2,{['x']=-1198},1,'circOut')
amyGroup.playAnim(amyGroup,'amyGroup',true)
amyGroup2.playAnim(amyGroup2,'amyGroup',true)
		gameCam.shake(gameCam,0.01,1.4)
end
	if curbeat == 89*4 then
camspeed = 1
multgame = 1.3
	setVar('dad.danceSpeed',1)
	setVar('camBoomSpeed',1)
	setVar('boyfriend.danceSpeed',1)
	dad.disabledDance = false
	bf.disabledDance = false
amyGroup.playAnim(amyGroup,'idle',true)
amyGroup2.playAnim(amyGroup2,'idle',true)
pinkieGroup.playAnim(pinkieGroup,'idle',true)
pinkieGroup2.playAnim(pinkieGroup2,'idle',true)
		tweenVar('camHUD.alpha',1,0.2)
		setVar('defaultCamZoom',0.9)
	end

	if curbeat > 89*4 then
	
amyGroup.playAnim(amyGroup,'idle',true)
amyGroup2.playAnim(amyGroup2,'idle',true)
pinkieGroup.playAnim(pinkieGroup,'idle',true)
pinkieGroup2.playAnim(pinkieGroup2,'idle',true)
	
	end


end


function stepHit(step)
if step == 0 then


setCamPos(721.5,293.7)

end
if step == 25 then


setCamPos(969,282)

end

if step == 31 then


setVar('defaultCamZoom',1.3)
setVar('camGame.zoom',1.5)
setCamPos(508,276)

end

if step == 33 then


setCamPos(648,276)

end




if step == 80 then
gameCam.shake(gameCam,0.02,0.4)
end
if step == 81 then

setVar('camHUD.visible',true)

setVar('camGame.zoom',1)
setVar('defaultCamZoom',0.8)
slap = true

watchANIM = '-surprised'
dashsonic()
end

if step == 164 then

watchANIM = ''
dashsonic()
end


if step == 454 then

watchANIM = '-bored'
dashsonic()
end

if step == 494 then
walkaway = true
rainbowdash.playAnim(rainbowdash,'look')
sonic.playAnim(sonic,'look')
end

if step == 534 then
rainbowdash.playAnim(rainbowdash,'walkaway')
sonic.playAnim(sonic,'walkaway')
rainbowdash.setVelocity(rainbowdash,100,0)
sonic.setVelocity(sonic,100,0)
end


end


function dashsonic()


if not walkaway then
rainbowdash.playAnim(rainbowdash,'idle'..watchALT..watchANIM)
sonic.playAnim(sonic,'idle'..watchALT..watchANIM)
end

end


function dadTurn()
watchALT = '_left'
dashsonic()

	if not followchar and slap then
		setCamPos(px, py)
	end
mustHit = false

end
function bfTurn()
watchALT = '_right'
dashsonic()

	if not followchar and slap  then
		setCamPos(bx, by)
	end
mustHit = true
end

function update(elapsed)
frames = frames + (elapsed/0.016)
if curStep < 80 and curStep > 0 then --sync animation
setVar('dad.animation.curAnim.curFrame',math.floor(24*getVar('vocals.time')/1000))
setVar('boyfriend.animation.curAnim.curFrame',math.floor(24*getVar('vocals.time')/1000))
end

if frames > 190 then
if not walkaway then
rainbowdash.playAnim(rainbowdash,'blink'..watchALT)
sonic.playAnim(sonic,'blink'..watchALT)
end
end

if frames > 194 then
frames = 0
dashsonic()
end
end
function dadNoteHit(data,strum,pos)

	if followchar and not mustHit then

		if data == 0 then
			
			setCamPos(px-ofs, py)
		end
		if data == 1 then
			
			setCamPos(px, py+ofs)
		end
		if data == 2 then
			
			setCamPos(px, py-ofs)
		end
		if data == 3 then
			
			setCamPos(px+ofs, py)
		end


	end


end

function goodNoteHit(data,strum,pos)


	if followchar and mustHit then

		if data == 0 then
			
			setCamPos(bx-ofs, by)
		end
		if data == 1 then
			
			setCamPos(bx, by+ofs)
		end
		if data == 2 then
			
			setCamPos(bx, by-ofs)
		end
		if data == 3 then
			
			setCamPos(bx+ofs, by)
		end


	end

end