extends CharacterBody3D

# Gravity settings
var gravity = -9.8

func _ready():
	pass


func _physics_process(delta):
	# Apply gravity
	velocity.y += gravity * delta

	# Move the character and handle collision

	# If the character is on the floor, stop the downward movement
	if is_on_floor():
		velocity.y = 0


	
		
		


	

