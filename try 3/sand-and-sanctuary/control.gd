extends Control

#var traveling = true
var start_pos
var end_pos

var dist_from_event = 0.0
var event_frequincy = 0.005

var events_happened = 0
#var event_order = [$"events/river crossing", $"events/tired traveler", $"events/river crossing"]
var event_order = [0, 1, 0, 0]

var day_ended = false
#var minutes = 0
#var hours = 6
#var am = true

#possessed  from  the  first  the  art  of  disappearing  swiftly  and silently,  when  large  folk  whom  they  do  not  wish  to  meet  come blundering  by;  and  this  art  they  have  developed  until  to  Men it  may  seem  magical.  But  Hobbits  have  never,  in  fact,  studied magic  of  any  kind,  and  their  elusiveness  is  due  solely  to a  professional  skill  that  heredity  and  practice,  and  a  close friendship  with  the  earth,  have  rendered  inimitable  by  bigger and  clumsier  races. 

var timer_pause = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = %PathFollow2D.progress_ratio
	end_pos = start_pos + 0.02
	%PathFollow2D.progress_ratio = Global.progress_ratio
	#day_end() 
	match Global.day:
		24:
			events_happened = 0
		25:
			events_happened = 0
		26:
			events_happened = 2
		27:
			events_happened = 4
		28:
			events_happened = 6
		29:
			events_happened = 8
		30:
			pass
		31:
			pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.hours >= 9 and Global.am == false:
		Global.traveling = false
		if day_ended == false:
			day_end()
			day_ended = true
	
	if Global.traveling == true:
		Global.progress_ratio = %PathFollow2D.progress_ratio
		
		#if %PathFollow2D.progress_ratio < end_pos:
			#print(%PathFollow2D.progress_ratio)
			#if %PathFollow2D.progress_ratio >
		%PathFollow2D.progress_ratio += 0.001 * delta
		dist_from_event += 0.001 * delta
		if dist_from_event > event_frequincy:
			event()
			dist_from_event = 0.0
		
		if $Timer.paused == true:
			$Timer.paused = false
	else:
		$Timer.paused = true
	
	
	if Input.is_action_just_pressed("next") and %"next button".visible == true:
		if Global.cur_event != null:
			Global.cur_event.next(Global.cur_event.line_index )# + 1)


func event():
	await get_tree().create_timer(randf_range(0, 0.8)).timeout
	print("event")
	Global.traveling = false
	#event_order[events_happened].event_start()
	$events.get_children()[event_order[events_happened]].event_start()
	events_happened += 1
	#var event_num = randi_range(0, $events.get_children().size() - 1)
	#$events.get_children()[event_num].event_start()
	#for i in $events.get_children():
	#	
	#$"events/river crossing".event_start()
	
	#await get_tree().create_timer(0.8).timeout
	#traveling = true
# how should I made this?

# what do I make?

# how to make good systems? gf hf

# whats my mvp?


func _on_next_button_pressed() -> void:
	if Global.cur_event != null:
			Global.cur_event.next(Global.cur_event.line_index )# + 1)


func _on_timer_timeout() -> void:
	print("timer")
	Global.dist_traveled += 0.2
	timer_pause += 0.1
	if timer_pause >= 2.0:
		timer_pause = 0.0
		Global.hunger -= 1
		Global.energy -= 1
	
	%"dist display".text = "Distance Traveled: " + str(Global.dist_traveled) + "/100"
	if Global.minutes < 60:
		Global.minutes += 20
	else:
		Global.minutes = 0
		if Global.hours != 12:
			Global.hours += 1
		else:
			Global.hours = 1
			Global.am = false
	
	if Global.minutes > 9:
		%"clock display".text = str(Global.hours) + ":" + str(Global.minutes)
	else:
		%"clock display".text = str(Global.hours) + ":0" + str(Global.minutes)

func day_end():
	%"night fade".play("new_animation")
	var vals = ["total distance traveled: " + str(Global.dist_traveled), "Health: " + str(Global.health), "energy: " + str(Global.energy), "hunger: " + str(Global.hunger), "warmth: " + str(Global.warmth)]
	for i in vals:
		#var valuelabel = Label.new()
		#valuelabel.text = i
		#%"end stats".add_child(valuelabel)
		%RichTextLabel.append_text(i + "\n")
	%"copy button".show()
	#%"end stats".add_
	#%RichTextLabel.text = "Health:"


func _on_save_pressed() -> void:
	Global._save()


func _on_copy_button_pressed() -> void:
	#var text_to_copy = %RichTextLabel.text
	DisplayServer.clipboard_set(%RichTextLabel.get_parsed_text())
	print(%RichTextLabel.get_parsed_text())


func _on_clear_save_pressed() -> void:
	if FileAccess.file_exists(Global.save_location):
		DirAccess.remove_absolute(Global.save_location)
		Global._load()
		get_tree().reload_current_scene()
		print("reload")
