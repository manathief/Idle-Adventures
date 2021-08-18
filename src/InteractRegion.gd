extends Area2D

var player: KinematicBody2D = null
var station: StaticBody2D = null setget set_station, get_station

#signal interactable_range_entered

func _ready():
	pass

func set_station(value):
	station = value
	
func get_station():
	return station

func _on_InteractRegion_body_entered(body):
	player = body
	print("entered")
	set_station(get_parent())

func _on_InteractRegion_body_exited(_body):
	player = null
