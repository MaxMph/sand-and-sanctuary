extends PanelContainer

@export var bar_name: String = "Energy"
@export var global_value: String = "energy"

func _ready() -> void:
	$HBoxContainer/Label.text = bar_name
	#print(Global.get(global_value))


func _process(delta: float) -> void:
	$HBoxContainer/MarginContainer/ProgressBar.value = Global.get(global_value)
