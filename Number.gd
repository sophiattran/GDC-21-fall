extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_text():
	var val=int(self.get_text())
	if val >= 100:
		val = 100
	else:
		self.set_text(str(val+10))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
