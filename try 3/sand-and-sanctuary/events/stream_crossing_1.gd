extends Node

var line_index = 1

var search_time
var search_text
@onready var stream_depth = "shallow"
var stream_current = "fast"

var choice_scene = preload("res://choice.tscn")

#@export var lines: Array = []

#@export var lines: Dictionary = {
	#1: "You come across a stream dividing your path.",
	#2: "The stream appears to be "  "with a fast current"
#}

var lines: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	search_time = randi_range(0, 2)
	if search_time == 1:
		search_text = str(search_time) + " hour"
	
	Global.cur_event = self
	lines = {
		1: "As you travel through the forest you come across a stream cutting across your path.",
		2: "The stream appears to be " + stream_depth + " with a " + stream_current + " current",
		3:  ["What do you do?" ,[["Atempt to cross", 4], ["Find another way (slow)", 10]]], #show_choice("What do you do?" ,[["Atempt to cross", 4], ["Find another way (slow)", 5]])
		4: "blablabla",
		5: "another line",
		10: "after " + search_text + " hours of you come across an old delapidated bridge. Its riddled with cracks and coated in moss, but its sturdy enough to cross."
	}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if Input.is_action_just_pressed()

func event_start():
	line_index = 1
	next(line_index)

func next(next_line):
	%"next button".hide()
	if lines[next_line] is String:
		print("works")
		%"next button".show()
		%RichTextLabel.text = lines[next_line]
		line_index += 1
	if lines[next_line] is Array:
		show_choice(lines[next_line][0], lines[next_line][1])

func show_choice(main_text: String, choices: Array):
	print("event_start")
	%RichTextLabel.text = main_text
	
	var choice_number = 1
	for i in choices:
		var new_choice = choice_scene.instantiate()
		new_choice.text = str(choice_number) + ": " + i[0]
		new_choice.nextline = i[1]
		%"choices vbox".add_child(new_choice)
	#%"choices vbox".add_child()
