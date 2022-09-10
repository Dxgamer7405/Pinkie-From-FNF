singTimer = {0,0,0}
function createPost()

dad.x = 90
dad.y = -69.2
bf.x = 991.75
bf.y = 202
bf.angle = 8.6937
gf.x = 352
gf.y = 18
		gf.visible = false
		--gf.changeCharacter(gf,'gf')
dad.scrollFactorX = 1.1
dad.scrollFactorY = 1.1
bf.scrollFactorX = 0.7
bf.scrollFactorY = 0.7
setVar('health',0.01)
	newSprite(0, -532, true, 'sky')
	sky.loadGraphic(sky,'sky')
	sky.antialiasing = true
	sky.scrollFactorX = 0
	sky.scrollFactorY = 0.3

	newSprite(830.25, -56, true, 'treebg')
	treebg.loadGraphic(treebg,'treesbg')
	treebg.antialiasing = true
	treebg.scrollFactorX = 0.5
	treebg.scrollFactorY = 0.5

	newSprite(-122.65, -62.2, true, 'ground')
	ground.loadGraphic(ground,'ground')
	ground.antialiasing = true
	ground.scrollFactorX = 0.7
	ground.scrollFactorY = 0.7

	newSprite(-128, -500, true, 'trees')
	trees.loadGraphic(trees,'trees')
	trees.antialiasing = true
	trees.scrollFactorX = 0.7
	trees.scrollFactorY = 0.7

	newSprite(1088, 253, false, 'sweetiebelle')
	sweetiebelle.setFrames(sweetiebelle,'sweetiebelle')
	sweetiebelle.addAnimByPrefix(sweetiebelle,'idle','sweetiebelle',24,false)
	sweetiebelle.antialiasing = true
	sweetiebelle.scrollFactorX = 0.7
	sweetiebelle.scrollFactorY = 0.7
	sweetiebelle.angle = 8.6937

	newSprite(-199, 282, true, 'house')
	house.loadGraphic(house,'house')
	house.antialiasing = true
	house.scrollFactorX = 1.1
	house.scrollFactorY = 1.1

newCharacter(855.55,198,'scootaloo',true,true)
scootaloo.angle = 8.6937
scootaloo.scrollFactorX = 0.7
scootaloo.scrollFactorY = 0.7
newCharacter(-102,25,'tiara',false,true)
newCharacter(129.3,54.85,'spoon',false,true)
spoon.setScale(spoon,0.88)
tiara.visible = false
spoon.visible = false
for i=0, getVar('unspawnNotes.length') do

	if getGroupVar('unspawnNotes',i,'noteType') == 1 or getGroupVar('unspawnNotes',i,'noteType') == 2 then
		setGroupVar('unspawnNotes',i,'noAnim',true)
	end
	if getGroupVar('unspawnNotes',i,'noteType') == 3 or getGroupVar('unspawnNotes',i,'noteType') == 4 then
		setGroupVar('unspawnNotes',i,'noAnim',true)
		setGroupVar('unspawnNotes',i,'alpha',0)
	end

	if getGroupVar('unspawnNotes',i,'noteType') == 3 or getGroupVar('unspawnNotes',i,'noteType') == 4 or getGroupVar('unspawnNotes',i,'noteType') == 5 or getGroupVar('unspawnNotes',i,'noteType') == 6 then
		setGroupVar('unspawnNotes',i,'noAnim',true)
		setGroupVar('unspawnNotes',i,'alpha',0)
	end

end



end
laps = 1
function update(elapsed)
laps = 0.016/elapsed
	singTimer[1] = singTimer[1] - 1
	singTimer[2] = singTimer[2] - 1
	singTimer[3] = singTimer[3] - 1
	if singTimer[1] == 1 then
		scootaloo.playAnim(scootaloo,'idle',true)
	end
	if singTimer[2] == 1 then
		tiara.disabledDance = false
		tiara.playAnim(tiara,'idle',true)
	end
	if singTimer[3] == 1 then
		spoon.playAnim(spoon,'idle',true)
	end
for i=0, getVar('hittableNotes.length') do



end
end
function beatHit(curbeat)

	sweetiebelle.playAnim(sweetiebelle,'idle',true)
	if scootaloo.curAnim == 'idle' and singTimer[1] < 0 then scootaloo.playAnim(scootaloo,'idle',true) end
	if spoon.curAnim == 'idle' and singTimer[3] < 0 then spoon.playAnim(spoon,'idle',true) end
	if tiara.curAnim == 'idle' and singTimer[2] < 0 then tiara.playAnim(tiara,'idle',true) end
	
	if curbeat == 208 then
		dad.disabledDance = true
setVar('defaultCamZoom',1.2)
		dad.playAnim(dad,'goback')
	end
	if curbeat == 301 then
		dad.x = 90
		dad.playAnim(dad,'jumpin')
	end
	if curbeat == 303 then
		dad.disabledDance = false
	end
	if curbeat == 264 then
		tiara.visible = true
		spoon.visible = true
	end
	if curbeat == 267 then
		setVar('defaultCamZoom',1)
		dad.x = -30
	end
	if curbeat == 268 then
		tiara.playAnim(tiara,'blank1')
		spoon.playAnim(spoon,'blank1')
		
	end
	if curbeat == 272 then
		spoon.playAnim(spoon,'idle')
		
	end


	if curbeat == 16*4 then
		setVar('camBoomSpeed',1)
	end
	if curbeat == 35*4 then
		setVar('camBoomSpeed',4)
	end
	if curbeat == 36*4 then
		setVar('camBoomSpeed',1)
	end
	if curbeat == 67*4 then
		setVar('camBoomSpeed',4)
	end
	if curbeat == 68*4 then
		setVar('camBoomSpeed',1)
	end
	if curbeat == 92*4 then
		setVar('camBoomSpeed',60)
	end
end

function dadNoteHit(data,strum,pos,sus,type)
	if type == 2 then
	tiara.disabledDance = true
	singTimer[2] = math.floor(30*laps)
	if data == 0 then tiara.playAnim(tiara,'singLEFT',true) end
	if data == 1 then tiara.playAnim(tiara,'singDOWN',true) end
	if data == 2 then tiara.playAnim(tiara,'singUP',true) end
	if data == 3 then tiara.playAnim(tiara,'singRIGHT',true) end

	end
	if type == 3 then
	singTimer[2] = math.floor(60*laps)
	singTimer[3] = math.floor(60*laps)
		tiara.playAnim(tiara,'blank2')
		spoon.playAnim(spoon,'blank2')

	end
	if type == 4 then
	singTimer[2] = math.floor(120*laps)
	singTimer[3] = math.floor(120*laps)
		tiara.playAnim(tiara,'blank1')
		spoon.playAnim(spoon,'blank1')

	end
	if type == 5 then
		singTimer[3] = math.floor(100*laps)
		spoon.playAnim(spoon,'mine')

	end
	if type == 6 then
		singTimer[2] = math.floor(100*laps)
		tiara.playAnim(tiara,'mine')

	end
end

function goodNoteHit(data,strum,pos,sus,type)

	if type == 1 then
	singTimer[1] = math.floor(30*laps)
	if data == 0 then scootaloo.playAnim(scootaloo,'singLEFT',true) end
	if data == 1 then scootaloo.playAnim(scootaloo,'singDOWN',true) end
	if data == 2 then scootaloo.playAnim(scootaloo,'singUP',true) end
	if data == 3 then scootaloo.playAnim(scootaloo,'singRIGHT',true) end

	end
	

end
function dadTurn()

		setVar('defaultCamZoom',1)
end
function bfTurn()

		setVar('defaultCamZoom',1.3)

end
