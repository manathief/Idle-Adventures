extends KinematicBody2D

onready var cam: Camera2D = get_parent().get_node("Camera2D") # Camera object
onready var remo: RemoteTransform2D = $RemoteTransform2D
export var max_speed: int = 100
var velocity = Vector2.ZERO # = speed * dir

func _ready():
	remo.set_remote_node(cam.get_path()) # "/root/World/Camera2D"
	cam.limit_left = -8
	cam.limit_right = 16 *12 +8

func _physics_process(_delta) -> void:
	var direction = get_direction()
	velocity = max_speed * direction
	velocity = move_and_slide(velocity)

func get_direction() -> Vector2: # returns the direction vector
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()


func _on_Zone0_body_entered(body): # body should be player
	#remo.set_remote_node(cam2)
	print("zone 0 entered", body)
