extends event


func _ready() -> void:
	lines = {
		1: "You recently merged onto a path much more worn than the ones prior. there are wagon wheels and footsteps littering the dirt, not yet washed away by the frequent rain.",
		2: "Ahead you see a traveler. This stranger pulls a cart behind him, the cart is covered to protect from the elements. as you get closer you see that its an older man. cheaks hollow and gaze distant the man marches on. either not noticing you, or not carring, the man doesnt ignolage you.",
		3: ["", [["Choice 1", 10], ["choice 2", 20], ["choice 3", 30]]],
		10: "this is how your choice turns out",
		11: Callable(self, "end"),
		20: "this is how your choice turns out (2)",
		21: Callable(self, "end"),
		30: "this is how your choice turns out (3)",
		31: Callable(self, "end"),
	}
