extends PanelContainer

enum screens {main, stats}
var screen = screens.main

@export var main: Control
@export var stats: Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_main_pressed() -> void:
	change_screen(screens.main)
	#screen = screens.main

func _on_stats_pressed() -> void:
	change_screen(screens.stats)
	#screen = screens.stats

func _on_inventory_pressed() -> void:
	pass

func change_screen(new_screen: screens):
	main.hide()
	stats.hide()
	screen = new_screen
	print(screen)
	
	match screen:
		0:
			main.show()
		1:
			stats.show()
