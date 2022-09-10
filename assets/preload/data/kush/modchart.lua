
function createPost(song)
	
	dad.x = -22
	dad.y = 175
	dad.disabledDance = true
	bf.x = 820
	bf.y = 152
	bf.disabledDance = true
	newSprite(-294.05, -101.55, true, 'bg','bg')
	bg.loadGraphic(bg,'bg')
	bg.antialiasing = true
	HUDCam.alpha = 0
	gameCam.alpha = 0.001
	setVar('defaultCamZoom',0.001)
	gameCam.zoom = 0.001
	gf.alpha = 0
	setVar('skipCountdown',true)


	
	
end
function dadNoteHit(d,s,p,sus,t)
	



end
function startSong()

	gameCam.zoom = 1.5
		setVar('defaultCamZoom',1.5)
		gameCam.alpha = 1
		dad.playAnim(dad,'wait')


end

function stepHit(curStep)
	if curStep == 208 then
		dad.disabledDance = false
	end
	if curStep == 81 then
		bf.playAnim(bf,'what')
	end
	if curStep == 233 then
		bf.playAnim(bf,'dude')
	end
	if curStep == 1289 then
		bf.disabledDance = true
		bf.playAnim(bf,'dude')
	end
	if curStep == 256 then
		bf.disabledDance = false
		setVar('defaultCamZoom',1.1)
		HUDCam.alpha = 1
	end

end

function dadTurn()

	setCamPos(360.95, 324.1)
	trace('fart')

end
function bfTurn()

	setCamPos(757.7, 360.9)
	trace('cum')
end


function update(elapsed)
	


end