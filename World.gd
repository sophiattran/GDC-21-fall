extends Node2D

export (PackedScene) var Trash

func _ready():
	randomize()
	

func _on_TrashTimer_timeout():
	$TrashPath/TrashSpawnLocation.offset = randi()
	var trash = Trash.instance()
	add_child(trash)
	trash.position = $TrashPath/TrashSpawnLocation.position
	
