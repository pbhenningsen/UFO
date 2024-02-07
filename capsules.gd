extends CharacterBody3D

var wander_range: int = 300
#var change_direction_interval: float = 2.0  # Change direction every 2 seconds
#var time_since_last_change: float = 0.0
var target_vector: Vector3
var speed: float = 5.0  # Speed at which the player moves

@onready var timer: Timer = $change_direction 

func _ready():
	randomize()  # Initialize random number generator
	update_target_position()

func _process(delta):
	if is_on_floor():
		velocity.y = 0
		move_towards_target(delta)
		velocity = transform.basis.z * speed
	else:
		velocity.y -= 9.8 * delta  # Apply gravity
	move_and_slide()



func _on_change_direction_timeout():
	update_target_angle()
	update_target_position()

func update_target_position():
	var random_z = randf_range(-wander_range, wander_range)
	target_vector = position + transform.basis.z * random_z

func update_target_angle():
	rotate(Vector3.UP, randf_range(PI/2,PI/8))

	
func move_towards_target(delta):
	look_at(target_vector, Vector3.UP)
