extends Node
class_name event

var line_index = 1
var choice_scene = preload("res://choice.tscn")
var lines: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#Global.cur_event = self
	#lines = {
		#1: "As you travel through the forest you come across a stream cutting across your path.",
		#}


func event_start():
	Global.cur_event = self
	line_index = 1
	next(line_index)

func next(next_line):
	if lines.has(next_line): #lines[next_line] != null:
		#reset to base
		%"next button".hide()
		%RichTextLabel.text = ""
		for i in %"choices vbox".get_children():
			i.queue_free()

		#if normal text
		if lines[next_line] is String:
			%"next button".show()
			%RichTextLabel.text = lines[next_line]
			line_index += 1

		#if choice or call
		if lines[next_line] is Array: 
			if lines[next_line][1] is Callable: #call
				%RichTextLabel.text = lines[next_line][0]
				lines[next_line][1].call()
				line_index = lines[next_line][2]
				%"next button".show()
			else: #choice
				show_choice(lines[next_line][0], lines[next_line][1])
		
		if lines[next_line] is Callable:
			lines[next_line].call()

func show_choice(main_text: String, choices: Array):
	%RichTextLabel.text = main_text
	
	var choice_number = 1
	for i in choices:
		var new_choice = choice_scene.instantiate()
		new_choice.text = str(choice_number) + ": " + i[0]
		new_choice.nextline = i[1]
		%"choices vbox".add_child(new_choice)

func end():
	Global.cur_event = null
	Global.traveling = true
	%"next button".hide()
	%RichTextLabel.text = ""
	for i in %"choices vbox".get_children():
		i.queue_free()
	Global._save()
