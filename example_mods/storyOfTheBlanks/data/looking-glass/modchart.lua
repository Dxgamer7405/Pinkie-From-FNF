gladtalk = false
mittatalk = false
shouldbop = true
camzoom = 4.2
hudzoom = 1.04
phaseruby= false
ofs ={
{
-3,
0
},


{
0,
3
},


{
0,
-3
},


{
3,
0
}


}
function createPost(song)
	dad.changeCharacter(dad,'rubypov')
	dad.changeCharacter(dad,'threeleaf')


	setVar('camGame.followLerp',0.02)
	setVar('skipCountdown',true)
	vcr(true,0.01)
	setCamPos(320,180)
	setVar('assetPrefix','b_')
	
	setVar('camHUD.visible',false)
	newSprite(320,180,true,'running')
	running.loadGraphic(running,'running')
	running.setFrames(running,'running')
	running.addAnim(running,'running',{0,1,2},15,true)
	running.addAnim(running,'stop',{3,4,5,6},8,false)
	running.playAnim(running,'running')
	running.scrollFactorX = 0
	running.scrollFactorY = 0
	
	
	
	newSprite(0,0,true,'forest')
	forest.loadGraphic(forest,'forest')
	newSprite(0,0,true,'village')
	village.loadGraphic(village,'village')
	forest.antialiasing = false
	village.antialiasing = false
	dad.antialiasing = false
	dad.scrollFactorX = 1.3
	bf.antialiasing = false
	
	newSprite(328,128,false,'gladstone')
	gladstone.loadGraphic(gladstone,'gladstone')
	gladstone.setFrames(gladstone,'gladstone')
	gladstone.addAnim(gladstone,'idle',{0,1,2,3},15,false)
	gladstone.addAnim(gladstone,'talk',{4,5},8,true)
	gladstone.scrollFactorX = 1.3
	
	newSprite(416,128,true,'mitta')
	mitta.loadGraphic(mitta,'mitta')
	mitta.setFrames(mitta,'mitta')
	mitta.addAnim(mitta,'idle',{0,1,2,3},15,false)
	mitta.addAnim(mitta,'talk',{4,5},8,true)
	
	
	newSprite(0,0,false,'bars')
	bars.loadGraphic(bars,'bars')
	bars.setFrames(bars,'bars')
	bars.addAnim(bars,'bars',{0,1,2,3,4,5},0,false)
	bars.scrollFactorX = 0;
	bars.scrollFactorY = 0;
	bars.screenCenter(bars,'xy')
	
	
	newSprite(192,116,true,'zombos')
	zombos.loadGraphic(zombos,'zombos')
	zombos.setFrames(zombos,'zombos')
	zombos.addAnim(zombos,'zombos',{0,1,2,3},15,false)
	zombos.playAnim(zombos,'zombos')
	zombos.visible = false
	
	
	newSprite(64,176,true,'spawnlight')
	spawnlight.loadGraphic(spawnlight,'spawnlight')
	spawnlight.setFrames(spawnlight,'spawnlight')
	spawnlight.addAnim(spawnlight,'spawnlight',{0,1,2,3},10,true)
	spawnlight.playAnim(spawnlight,'spawnlight')
	
	newSprite(0,0,false,'run')
	run.loadGraphic(run,'run')
	run.antialiasing = false
	run.scrollFactorX = 0
	run.scrollFactorY = 0
	run.screenCenter(run,'xy')
	run.alpha = 0.01
	
	dad.x = 80
	dad.y = 96
	
trace(dad.x)
	bf.x = 336
	bf.y = 128
	
	setVar('defaultCamZoom',4)
	setVar('camGame.zoom',4)
	for i=0,getVar('unspawnNotes.length') do
		 setGroupVar('unspawnNotes',i,'antialiasing',false)
		if getGroupVar('unspawnNotes',i,'isSustainNote') then
		 setGroupVar('unspawnNotes',i,'offset.x',-40)
		 setGroupVar('unspawnNotes',i,'offset.y',-5)
		end
		if getGroupVar('unspawnNotes',i,'strumTime') > 72000 and getGroupVar('unspawnNotes',i,'mustPress') then
		 setGroupVar('unspawnNotes',i,'noAnim',true)
		end
		
	end
	
	
	
	setVar('sicksTxt.font','Equestria')
	setVar('goodsTxt.font','Equestria')
	setVar('badsTxt.font','Equestria')
	setVar('shitsTxt.font','Equestria')
	setVar('missesTxt.font','Equestria')
	setVar('deathColor','990000')
	setVar('camZoomSpeed',0.9)
	setVar('deathSound','10_SoundCaught')
	setVar('deathSong','darktown')
	setVar('deathEndSong','')
	setVar('boyf','bloom_dies')
end
function dadNoteHit(d,s,p,sus,t)
	
if getVar('health') > 0.01 then setVar('health',getVar('health')-0.02) end

if curStep >= 768 then
setCamPos(370+ofs[d+1][1],180+ofs[d+1][2])

end

end
alto = false
function goodNoteHit(d,s,p,sus,t)


	bf.holdTimer = 0
if t == 1 or curStep > 1088 then

setCamPos(373+ofs[d+1][1],180+ofs[d+1][2])

if not alto then
setVar('bfaltAnim','-alt')
end
anims = {'LEFT','DOWN','UP','RIGHT'}
bf.playAnim(bf,'sing'..anims[d+1]..'-alt',true)

end


end
function beatHit(beat)
	for i=0,getVar('playerStrums.length') do
		 setGroupVar('playerStrums',i,'antialiasing',false)
	
	end
	for i=0,getVar('dadStrums.length') do
		 setGroupVar('dadStrums',i,'antialiasing',false)
	
	end
if shouldbop then
	setVar('camGame.zoom',camzoom)
	setVar('camHUD.zoom',hudzoom)
end









if curBeat == 192 then
trace('BAM SWITCH')
setCamPos(320,180)
	dad.changeCharacter(dad,'rubypov')
	dad.antialiasing = false
	dad.x = 192
	dad.y = 64
	bf.visible = false
	dad.alpha = 0
shouldbop = true
	setVar('camHUD.zoom',1.03)
	setVar('defaultHudZoom',1)
	village.visible = false
	forest.visible = false
	mitta.visible = false
	gladstone.visible = false
trace('BAM SWITCH AGAIN WHAT HAPPEN')
end












if phaseruby then dad.alpha = 1 end
forest.alpha = 1

	if not gladtalk then gladstone.playAnim(gladstone,'idle') else gladstone.playAnim(gladstone,'talk') end
	if not mittatalk then mitta.playAnim(mitta,'idle') else mitta.playAnim(mitta,'talk') end


	zombos.playAnim(zombos,'zombos')
	
gladtalk = beat > 170 and beat < 178
mittatalk = beat >= 178 and beat < 184
setCamPos(9999,9999)
if gladtalk then setCamPos(400,190) end
if mittatalk then setCamPos(400,150) end


end
function startSong()



end

function stepHit(step)

if step == 52 then
	bars.playAnim(bars,'bars',true,false,1)
end
if step == 92 then
	bars.playAnim(bars,'bars',true,false,2)
end
if step == 120 then
	setVar('camHUD.visible',true)
	setVar('camHUD.alpha',0.25)
end
if step == 122 then
	setVar('camHUD.alpha',0.5)
end
if step == 124 then
bars.visible = false
	setVar('camHUD.alpha',0.75)
end
if step == 126 then
	setVar('camHUD.alpha',1)
end




if step == 649 then

	setVar('camHUD.alpha',0.75)
bars.visible = true
	bars.playAnim(bars,'bars',true,false,3)
end
if step == 651 then

	setVar('camHUD.alpha',0.5)
end
if step == 653 then

	setVar('camHUD.alpha',0.25)
end
if step == 655 then

	setVar('camHUD.alpha',0)
end


if step == 684 then

	bars.playAnim(bars,'bars',true,false,4)
end

if step == 716 then

	bars.playAnim(bars,'bars',true,false,5)
end



if step == 740 then

bars.visible = false
shouldbop = false
	setVar('camHUD.alpha',1)
	run.alpha = 0.5
	
end
if step == 876 then
running.playAnim(running,'stop')
	running.tween(running,{['alpha']=1},0.4,'linear')
	dad.tween(dad,{['alpha']=1},1,'linear')
end
if step == 879 then
phaseruby = true
end
if step == 1011 then
dad.disabledDance = true
dad.playAnim(dad,'loop_talk')
end
if step == 1043 then
dad.disabledDance = false
dad.playAnim(dad,'idle')
end
if step == 1088 then
	run.visible = false
	run.alpha = 0
	zombos.visible = true
	bf.visible = true
	dad.x = 304
	dad.y = 144
	dad.changeCharacter(dad,'ruby')
	forest.visible = true
	dad.antialiasing = false
shouldbop = false
	setVar('camHUD.zoom',1.03)
	setVar('defaultHudZoom',1)
	village.visible = false
	mitta.visible = false
	gladstone.visible = false
end
if step == 1104 then
shouldbop = true
camzoom = 4.5
hudzoom = 1.07
end
if step == 1104 then
camzoom = 4.4
hudzoom = 1.05
end


if step == 1576 then
	playSound('6_SoundOrb',0.8)
	
	spawnlight.tween(spawnlight,{['x']=340},1,'circOut')
	spawnlight.tween(spawnlight,{['y']=130},1.5,'circInOut')
end

if step == 1592 then
	gameCam.shake(gameCam,0.01,10,true)
end
if step == 1600 then
	fadeCam('game')
end

if step == 1632 then

	fadeCam('hud',1.2)
end
end

function dadTurn()

end
function bfTurn()

end

f = 0
function update(elapsed)
	
f = f + 1
if f < 3 then
	setVar('deathColor','990000')
	setVar('camZoomSpeed',0.9)
	setVar('deathSound','10_SoundCaught')
	setVar('deathSong','darktown')
	setVar('deathEndSong','')
	setVar('boyf','bloom_dies')	
	
end

if curBeat > 192 then
	run.visible = false
	run.alpha = 0
end

if curStep > 768 then
	run.visible = false
	run.alpha = 0
end
if forest.alpha > 0.6 then
forest.alpha = forest.alpha - 0.02
end
if dad.alpha > 0.6 and not village.visible and phaseruby then
dad.alpha = dad.alpha - 0.02
end

end
