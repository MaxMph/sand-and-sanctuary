extends Control

#var traveling = true
var start_pos
var end_pos

var dist_from_event = 0.0
var event_frequincy = 0.005

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = %PathFollow2D.progress_ratio
	end_pos = start_pos + 0.02


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.traveling == true:
		
		if %PathFollow2D.progress_ratio < end_pos:
			#print(%PathFollow2D.progress_ratio)
			#if %PathFollow2D.progress_ratio >
			%PathFollow2D.progress_ratio += 0.001 * delta
			dist_from_event += 0.001 * delta
			if dist_from_event > event_frequincy:
				event()
				dist_from_event = 0.0
	
	if Input.is_action_just_pressed("next") and %"next button".visible == true:
		if Global.cur_event != null:
			Global.cur_event.next(Global.cur_event.line_index )# + 1)
		

func event():
	print("event")
	Global.traveling = false
	var event_num = randi_range(0, $events.get_children().size())
	$events.get_children()[event_num].event_start()
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
	pass # Replace with function body.
