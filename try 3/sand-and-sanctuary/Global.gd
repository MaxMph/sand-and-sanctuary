extends Node

var health = 80
var energy = 80
var hunger = 80
var warmth = 80

var traveling = true
var cur_event = null
var progress_ratio = 0.0

var clock_time = 6.00
var dist_traveled = 0

var minutes = 0
var hours = 6
var am = true

var time = Time.get_datetime_dict_from_system()
var day = time["day"]
var date = [time["year"], time["month"], time["day"]]
var past_days = []

var save_version = 0

func _ready() -> void:
	_load()
	#print(day)
	#print(Time.get_datetime_dict_from_system())
	print(date)


func _process(delta: float) -> void:
	pass


const save_location = "user://savefile.json"

var staff_guys: Array = []
var npc_info: Array = []

var save_data: Dictionary = {
	"save_version": 0,
	
	"health": false,
	"energy": false,
	"hunger": false,
	"warmth": false,
	"past_days": [],
	"dist_traveled": 0.0,
	"minutes": 0,
	"hours:": 0,
	"am": true,
	"progress_ratio": 0.0,
}

func _exit_tree() -> void:
	#_save()
	pass


func _save():
	save_data.save_version = 0
	save_data.health = health
	save_data.energy = energy
	save_data.hunger = hunger
	save_data.warmth = warmth
	save_data.past_days = past_days
	save_data.dist_traveled = dist_traveled
	save_data.minutes = minutes
	save_data.hours = hours
	save_data.am = am
	save_data.progress_ratio = progress_ratio
	
	
	
	var savefile = FileAccess.open(save_location, FileAccess.WRITE)
	savefile.store_var(save_data.duplicate())
	savefile.close()

func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open(save_location, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var loaded_save_data = data.duplicate()
		
		save_version = loaded_save_data.save_version
		health = loaded_save_data.health
		energy = loaded_save_data.energy
		hunger = loaded_save_data.hunger
		warmth = loaded_save_data.warmth
		past_days = loaded_save_data.past_days
		dist_traveled = loaded_save_data.dist_traveled
		minutes = loaded_save_data.minutes
		hours = loaded_save_data.hours
		am = loaded_save_data.am
		progress_ratio = loaded_save_data.progress_ratio
