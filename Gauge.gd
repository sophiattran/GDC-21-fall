extends TextureProgress


# Declare member variables here. Examples:
var health = 0
onready var number = $'/root/World/GUI/HBoxContainer/Bar/Count/Background/Number'

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func update_energy_bar():
	health += 10
	get_node('/root/World/GUI/HBoxContainer/Bar/Gauge').set_value(health)
	number.update_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
