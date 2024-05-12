extends Label

var time = 0
var timer_on = true

func _process(delta):
	if(timer_on):
		time += delta
	
	var milliseconds = fmod(time,1)*1000
	var seconds = fmod(time, 60)
	var minutes = fmod(time, 60*60) / 60
	#var hours = fmod(fmod(time, 3600 * 60) / 3600,24)
	
	var time_passed = "%02d : %02d : %03d" % [minutes,seconds,milliseconds]
	text = time_passed 
	pass
