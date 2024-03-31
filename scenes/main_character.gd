extends CharacterBody2D
@onready var sprite_2d = $Sprite2D


const SPEED = 400.0
const SPEED_DELTA = 9
const JUMP_VELOCITY = -900.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	# Running Animation
	if abs(velocity.x) != 0:
		sprite_2d.animation = "running"
	else: 
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED_DELTA)

	move_and_slide()

	var isMovingTowardsLeft = velocity.x < 0
	sprite_2d.flip_h = isMovingTowardsLeft

