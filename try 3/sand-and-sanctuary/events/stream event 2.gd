extends event


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lines = {
		1: "As you travel through the forest you aproach a stream cutting across your path.",
		2: ["what do?", [["wade though the water", 10], ["find another way (+time)", 20], ["test", 30]]],
		10: "the whater is cold, the current pulls at you but you dont give way. You make it to the other side of the river, but the chill from the cold water doesnt leave.",
		11: Callable(self, "end"),
		20: "it takes a while but you eventualy find an old delapidated bridge. moss and vines climb up its base, but the bridge is sturdy and allows you to cross, avoiding the cold water of the stream.",
		21: Callable(self, "end"),
		30: ["this is a test, it should call a function now :3", Callable(self, "test"), 100],
		100: Callable(self, "end"),
	}

func test():
	print("test function called")
