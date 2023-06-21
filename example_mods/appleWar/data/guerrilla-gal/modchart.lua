camx = 640
camy = 420
bonce = true
duet = false
function createPost()

dad.x = 393.25
dad.y = 246.05

bf.x = 674.55
bf.y = 249.45

gameCam.zoom = 0.9
setVar('defaultCamZoom',0.9)
setVar('camGame.followLerp',0.03)


gf.visible = false

newSprite(-140.35,-316.1,true,'sky')
sky.loadGraphic(sky,'sky')
sky.scrollFactorX = 0
sky.scrollFactorY = 0.3

sky.setScale(sky,1.2)


newSprite(-452,-51.5,true,'cloud')
cloud.loadGraphic(cloud,'cloud')
cloud.scrollFactorX = 0.2
cloud.scrollFactorY = 0.2
cloud.antialiasing = true




newSprite(-300,-280.4,true,'twiballoon')
twiballoon.loadGraphic(twiballoon,'twiballoon')
twiballoon.setFrames(twiballoon,'twiballoon')
twiballoon.addAnimByPrefix(twiballoon,'twiballoon','twiballoons',24,false)
twiballoon.scrollFactorX = 0.3
twiballoon.scrollFactorY = 0.3
twiballoon.antialiasing = true
twiballoon.visible = false










newSprite(-2881.55,47,true,'mountains')
mountains.loadGraphic(mountains,'mountains')
mountains.scrollFactorX = 0.6
mountains.scrollFactorY = 0.6
mountains.antialiasing = true


newSprite(-3182.6,543,true,'groundf')
groundf.loadGraphic(groundf,'groundf')
groundf.scrollFactorX = 0.8
groundf.scrollFactorY = 0.8
groundf.antialiasing = true

cloud.tween(cloud,{['x']=-99.9},180,'linear')

newSprite(-189.25,174.8,false,'tank')
tank.loadGraphic(tank,'tank')
tank.setFrames(tank,'tank')
tank.addAnimByPrefix(tank,'tank','TANK',24,true)
tank.playAnim(tank,'tank')
tank.scrollFactorX = 1.1
tank.scrollFactorY = 1.1
tank.antialiasing = true
setCamPos(camx,camy)
end

function bfTurn()

camx = 700
if duet then camx = 670 end
end
function dadTurn()

camx = 640
if duet then camx = 670 end


end



function update(elapsed)
lapd = elapsed/0.016


mountains.x = mountains.x + 2*lapd
if mountains.x > -690 then
mountains.x = -2881.55
end

twiballoon.x = twiballoon.x + 1*lapd


groundf.x = groundf.x + 4*lapd
if groundf.x > -686 then
groundf.x = -3182.6
end


end






function beatHit(beat)

if beat == 33 then
duet = false
setVar('defaultCamZoom',1.1)
end

if beat == 128 or beat == 336 then
duet = true
setVar('defaultCamZoom',0.9)
end

if beat == 161 then
duet = false
setVar('defaultCamZoom',1.1)
end


if beat == 220 then
twiballoon.visible = true
twiballoon.x = -400
end

if beat == 224 then
setVar('defaultCamZoom',0.9)
end


if beat == 231 then
bonce = false

setVar('anotherPoint',true)
tweenVar('camFollow.y',0,2,'sineInOut')
twiballoon.playAnim(twiballoon,'twiballoon')
end
if beat == 232 then
gameCam.shake(gameCam,0.01,0.4)
tweenVar('defaultCamZoom',0.8,1,'sineInOut')
end

if beat == 238 then
dad.disabledDance = false;
bf.disabledDance = false;
gameCam.shake(gameCam,0.02,1)
end



if beat == 240 then
bonce = true
camy = 420
setVar('defaultCamZoom',1.1)
end



if beat == 374 then
cameraFade('hud',1,'000000')
end









end




function stepHit(step)
if bonce then
if step % 4 == 0 then

setCamPos(camx,camy)

end
if step % 4 == 2 then

setCamPos(camx,camy-20)

end
end

if step == 910 then
dad.disabledDance = true;
bf.disabledDance = true;
dad.playAnim(dad,'look')
bf.playAnim(bf,'twi')

end



end