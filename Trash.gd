extends RigidBody2D

var mouse_over = false
var being_lifted = false
var applying_impulse = false



onready var player = $"../Player" #move up the node tree one level and access Player node


func _physics_process(delta):
	if position.y > 1000: queue_free() #remove self from scene after falling into the void

	if mouse_over and Input.is_action_just_pressed("left_click"):
		throw_or_lift() 
		
	if being_lifted and applying_impulse:
		update_impulse()

	
	
func throw_or_lift():
	if being_lifted:
		player.throw_trash()
	else:
		if !player.trash: #limiting player's number of controlled objects to one
			player.lift_trash(self)
			being_lifted = true
			applying_impulse = true


func free_self():
	being_lifted = false
	applying_impulse = false
	$Timer.wait_time = 1
	

func update_impulse():
	var pos = player.position
	apply_impulse(Vector2.ZERO, (pos - position))
	applying_impulse = false
	$Timer.start()


func _on_Trash_mouse_entered():
	mouse_over = true
	$mouse_over.visible = true

func _on_Trash_mouse_exited():
	mouse_over = false
	$mouse_over.visible = false


func _on_Timer_timeout():
	applying_impulse = true
	var distance = position.distance_to(player.position)	
	$Timer.wait_time = distance / 4000
	
