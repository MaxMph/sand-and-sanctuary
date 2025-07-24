extends event


func _ready() -> void:
	lines = {
		1: "You recently merged onto a path much more worn than the ones prior. there are wagon wheels and footsteps littering the dirt, not yet washed away by the frequent rain.",
		2: "Ahead you see a traveler. This stranger pulls a cart behind him, the cart is covered to protect its cargo, either from weather, or prying eyes. as you get closer you see that its an older man. cheaks hollow and gaze distant the man marches on. either not noticing you, or not carring, the man doesnt acknowledge you.",
		3: ["", [["Ignore him", 10], ["Ask him about the weather", 20], ["Rob him with (primary weapon)", 30]]],
		10: "You continue walking, choosing to focus on the trail ahead.",
		11: Callable(self, "end"),
		20: "The man looks up at your question.",
		21: "Traveler:
			around here its not so bad, but a few days down the trail and it will start to grow colder. the snowstorms are more frequent the farther you travel.",
		22: "You and the man continue walking in oposite directions, he slowly beconmes indistinguishable from the surrounding trees.",
		23: Callable(self, "end"),
		30: "Having only your fists as a weapon, you take a swing at the elderly man. The man, startled by your sudden movement tries to move away, causing your blow to brush him, dealing little damage.",
		31: "the man looks fearful, clearly not looking for a fight. He draws a knife from his belt, holding it between him and yourself.",
		32: ["", [["Run", 40], ["Apoligize", 45], ["Fight", 50]]],
		34: Callable(self, "end"),
		40: ["Seeing that your decision might have been rash, you sprint down the path, glancing over your shoulder until the man is decently far away. He doesnt give chase. (-15 energy)", Callable(self, "energy_loss"), 34],
		45: "You tell the man that you dont know what got into you, and that your sorry for the outburst. He seems far from convinced by your sudden change of pace. He doesnt lower his knife, but he does begin moving away from you, draging his cart with one hand, holding his knife with the other",
		46: Callable(self, "end"),
		50: ["You lunge at the man, and try to push the knife out of the way. you and your fellow traveler tumble to the ground, but the man still holds the knife. He tries to swing at you and it catches your arm, slicing into your flesh and drawing blood. trying to ignore the pain in your arm you punch at the mans head. (-15 health)", Callable(self, "hurt"), 51],
		51: ["The man, hurt from your strikes tries to get away.", [["Let him go", 55], ["Finish what you started", 60]]],
		55: [ "The man scurries off into the woods, abandoning his bellongings. His cart is full of unprocessed wheat... not much use to you. But the man also had some more edible food. (+20 hunger)", Callable(self, "fight_won"), 34],
		60: ["you dont let the man escape. You strike at the man in any way you can, fists, elbows, knees. the man drops the knife and curls up, instintively attempting to shield his vitals, but its no use against your barrage. it doesnt take long for the fight to be over, you stand from the ground and look around at his bellongings. His cart is full of unprocessed wheat... not much use to you. But the man also had some more edible food. (+20 hunger)", Callable(self, "fight_won"), 34]
	}

func energy_loss():
	Global.energy -= 15

func fight_won():
	Global.hunger += 20

func hurt():
	Global.health -= 15
