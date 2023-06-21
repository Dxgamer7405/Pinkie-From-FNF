local bloodshit = false;
local gettingcut = false;
local camshake = 0;
local followchar = false
local bfturn = false

local trauma = false

ext = 800;

local px = 440-ext/2
local py = 360-ext/2

local bx = 590-ext/2
local by = 360-ext/2

local ofs = 30

local enabled = false
function createPost()


	newSprite(0,0, true, 'versionLock','other')
	versionLock.loadGraphic(versionLock,'versionLock')

trace(GameVersion >= 1.2)
versionLock.visible = false
enabled = true

dad.x = -31
dad.y = 128
bf.x = 733
bf.y = 205
gf.x = 352
gf.y = 18
setCamPos(px,py)
setVar('camGame.scroll.x',(px)-ext/2)
setVar('camGame.scroll.y',(py)-ext/2)
		gf.changeCharacter(gf,'gf_cupcakes')
		gf.changeCharacter(gf,'gf_normal')
dad.scrollFactorX = 0.95
bf.scrollFactorX = 0.95
dad.scrollFactorY = 0.95
bf.scrollFactorY = 0.95


	newSprite(0, 253, true, 'bg')
	bg.loadGraphic(bg,'bg')
	bg.scrollFactorX = 0.5
	bg.scrollFactorY = 0
	bg.antialiasing = true



	newSprite(-824.3,-556.15, true, 'cupkbg')
	cupkbg.loadGraphic(cupkbg,'cupcakebg')
cupkbg.scrollFactorX = 0.6
cupkbg.scrollFactorY = 0.6
cupkbg.setScale(cupkbg,1.3)
	cupkbg.antialiasing = true
	
	
	newSprite(31, 481, false, 'table')
	table.loadGraphic(table,'table')
	table.setFrames(table,'table')
	table.addAnim(table,'table',{0,1,2},0,false)
	table.antialiasing = true

	newSprite(0,0, false, 'bloodsplatter','hud')
	bloodsplatter.loadGraphic(bloodsplatter,'bloodsplatter')
	bloodsplatter.setFrames(bloodsplatter,'bloodsplatter')
	bloodsplatter.addAnimByPrefix(bloodsplatter,'bloodsplatter','bloodsplatter',0,false)
	bloodsplatter.antialiasing = true
	bloodsplatter.visible = false
	bloodsplatter.setBlendMode(bloodsplatter,'multiply')

	newSprite(412,252, false, 'bowl')
	bowl.loadGraphic(bowl,'bowl')
	bowl.setFrames(bowl,'bowl')
	bowl.addAnimByPrefix(bowl,'bowl','bowlanim',24,false)
	bowl.antialiasing = true
	
	
	newSprite(-481.9,-114.95, false, 'light')
	light.loadGraphic(light,'light')
	light.antialiasing = true
	light.visible = false
	
	
	newSprite(112.4,-93.55, false, 'light2')
	light2.loadGraphic(light2,'shine')
	light2.antialiasing = true
	light2.visible = false
	light2.alpha = 0.4
	light2.setBlendMode(light2,'add')
	
	
	newSprite(445.3,235.75, false, 'cupcakes')
	cupcakes.loadGraphic(cupcakes,'cupcakes')
	cupcakes.antialiasing = true
	cupcakes.visible = false


	setVar('camGame.width',1280 + ext)
	setVar('camGame.height',720+ext)
	setVar('camGame.x',(-ext)/2)
	setVar('camGame.y',(-ext)/2)
	

	newSprite(120,170, false, 'sequence')
	sequence.loadGraphic(sequence,'sequence')
	sequence.setFrames(sequence,'sequence')
	sequence.addAnimByIndices(sequence,'sequence1','sequence',{0,1,2},24,true)
	sequence.addAnimByIndices(sequence,'sequence2','sequence',{3},24,false)
	sequence.addAnimByIndices(sequence,'sequence3','sequence',{4},24,false)
	sequence.antialiasing = true
	sequence.scrollFactorX = 0
	sequence.scrollFactorY = 0
	sequence.visible = false
	for i=0,getVar('unspawnNotes.length') do
		if getGroupVar('unspawnNotes',i,'noteType') > 1 and not getGroupVar('unspawnNotes',i,'mustPress') then
		 setGroupVar('unspawnNotes',i,'noAnim',true)
		end
		
	end





end

function update(elapsed)

if not enabled then
setVar('vocals.volume',0)
setVar('vocals.time',0)
end

	if gettingcut then
		gf.playAnim(gf,'cut')
	end


	if camshake > 0 then
	gameCam.shake(gameCam,camshake*0.001,0.1)
	end
	

end
function beatHit(curbeat)
	if curbeat == 30 then
		gameCam.alpha = 0;
		setVar('defaultCamZoom',1.4)
		gameCam.zoom = 1.4
		followchar = false
		cupkbg.visible = false
		light.visible = true
		light2.visible = true
	end
	if curbeat == 32 then
		trauma = true
		gameCam.zoom = 1.5

	setCamPos(304-ext/2, 236-ext/2)
		setVar('camGame.angle',-10)
		
		camshake = 3

		gameCam.alpha = 1;
		dad.playAnim(dad,'chainsaw')
		dad.disabledDance = true
	--	setVar('dadaltAnim','-chainsaw')
		gf.changeCharacter(gf,'gf_cupcakes')
gf.x = 352
gf.y = 18
	end
	if curbeat == 35 then
		dad.playAnim(dad,'saw')
	--	setVar('dadaltAnim','-chainsaw')
		gf.changeCharacter(gf,'gf_cupcakes')
	end
	if curbeat == 37 then
		gameCam.tween(gameCam,{['angle']=15},0.4,'backOut')
		camshake = 8
		setCamPos(597-ext/2, 316-ext/2)
		gettingcut = true;
		bloodshit = true
		gf.disabledDance = true;
		table.playAnim(table,'table',true,false,1)
		gf.playAnim(gf,'cut')
	bloodsplatter.visible = true
		dad.disabledDance = true
	--	setVar('dadaltAnim','-chainsaw')
	end
	if curbeat == 40 then
		gameCam.tween(gameCam,{['angle']=10},0.4,'backOut')
		setCamPos(597-ext/2, 276-ext/2)
		setVar('defaultCamZoom',1.8)
	bloodsplatter.playAnim(bloodsplatter,'bloodsplatter',true,false,1)
		table.playAnim(table,'table',true,false,2)
	end
	if curbeat == 42 then
		bloodsplatter.playAnim(bloodsplatter,'bloodsplatter',true,false,2)
	end
	if curbeat == 44 then
		gameCam.tween(gameCam,{['angle']=0},0.4,'sineInOut')
		followchar = true
		setVar('defaultCamZoom',1.1)
		camshake = 2
		gettingcut = false;
		setVar('gfaltAnim','-blood')
		dad.disabledDance = false
		gf.disabledDance = false
	end
	if curbeat == 107 then
		dad.disabledDance = false
	--	setVar('dadaltAnim','-blood')
	end
	if curbeat == 348 then
		playSound('pinkie_gut',1)
		setVar('defaultCamZoom',1.3)
		dad.disabledDance = true
		gf.disabledDance = true
		dad.playAnim(dad,'grab')
		bowl.playAnim(bowl,'bowl')
		gf.playAnim(gf,'gut')
		trauma = false
		setVar('gfaltAnim','-gut')
		setVar('dadaltAnim','-bloody')
		
	end
	if curbeat == 361 then
		setVar('defaultCamZoom',1.2)
		dad.disabledDance = false
		gf.disabledDance = false
		trauma = true
	end
	if curbeat == 256 then
		setVar('dadaltAnim','-chainsaw')
		dad.playAnim(dad,'chainsaw-bloody')
		dad.disabledDance = true
	end
	if curbeat == 266 then
		setVar('dadaltAnim','-chainsaw')
		dad.playAnim(dad,'saw')
	end
	if curbeat == 268 then
		dad.disabledDance = false
	end







	if curbeat == 420 then
		setVar('camGame.visible',false)
		sequence.visible = true
		sequence.playAnim(sequence,'sequence1')
	end

	if curbeat == 421 then
		setVar('camGame.visible',true)
		setVar('camGame.zoom',1.6)
		tweenVar('camGame.zoom',1,0.2,'elasticOut')
		setVar('defaultCamZoom',1.6)
		tweenVar('defaultCamZoom',1,0.2,'elasticOut')
	end

	if curbeat == 422 then
		setVar('camGame.visible',false)
		sequence.playAnim(sequence,'sequence2')
	end

	if curbeat == 423 then
		setVar('camGame.visible',true)
		setVar('camGame.zoom',1.6)
		tweenVar('camGame.zoom',1,0.2,'elasticOut')
		setVar('defaultCamZoom',1.6)
		tweenVar('defaultCamZoom',1,0.2,'elasticOut')
	end

	if curbeat == 424 then
		setVar('camGame.visible',false)
		sequence.playAnim(sequence,'sequence3')
	end

	if curbeat == 425 then
		setVar('camGame.visible',true)
		setVar('camGame.zoom',1.6)
		tweenVar('camGame.zoom',1,0.2,'elasticOut')
		setVar('defaultCamZoom',1.6)
		tweenVar('defaultCamZoom',1,0.2,'elasticOut')
	end


	if curbeat == 426 then
		cupcakes.visible = true
		bowl.visible = false
		setVar('camGame.visible',false)
		sequence.visible = false;
		gf.playAnim(gf,'empty')
		gf.disabledDance = true
		dad.playAnim(dad,'saw')
	end

	if curbeat == 427 then
		setVar('camGame.zoom',1.6)
		tweenVar('camGame.zoom',0.9,0.2,'elasticOut')
		cupcakes.tween(cupcakes,{['y']=434},(crochet/1000),'bounceOut')
		playSound('ding')
		setVar('camGame.visible',true)
	end
	if curbeat == 428 then
		playSound('panfall',0.8)
	end








--[[
	if not gettingcut and bloodshit then 
			gf.playAnim(gf,'danceRight-blood')
		if curbeat % 2 == 0 then
			gf.playAnim(gf,'danceLeft-blood')
		end
	end
	]]

end

function dadNoteHit(data,strum,pos,sus,type)

	if type == 0 then
		camshake = 0
		dadAnim(data,'')
		setVar('dadaltAnim','-blood')
		if curBeat > 348 then setVar('dadaltAnim','-bloody') end
	end

	if type == 1 then
camshake = 2
		setVar('dadaltAnim','-chainsaw')
		dadAnim(data,'-chainsaw')
	end
	if type == 2 then
		setVar('dadaltAnim','')
		dadAnim(data,'')
	end
	if type == 3 then
		dadAnim(data,'-laugh')
	end




	if followchar and not bfturn then

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
function dadAnim(data,alt)

	
anims = {'LEFT','DOWN','UP','RIGHT'}
dad.playAnim(dad,'sing'..anims[data+1]..alt,true)



end
function goodNoteHit(data,strum,pos)


	if followchar and bfturn then

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
function dadTurn()
bfturn  = false
	if not trauma then
		setCamPos(640-ext/2, 360-ext/2)
	end


end
function bfTurn()
bfturn  = true
	if not trauma then
		setCamPos(640-ext/2, 360-ext/2)
	end

end
