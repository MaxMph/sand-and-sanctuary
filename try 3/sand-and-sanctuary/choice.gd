extends Button

var nextline

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if Global.cur_event != null:
		Global.cur_event.line_index = nextline
		Global.cur_event.next(nextline)
