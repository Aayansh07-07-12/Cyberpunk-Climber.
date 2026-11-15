extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var starting_position: Vector2
func _ready( ):
	starting_position = global_position
func _physics_process( delta: float ) -> void:
	if not is_on_floor( ):
		velocity += get_gravity( ) * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor( ):
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide( )
	if global_position.y > 2000:
		respawn( )
func respawn( ):
	global_position = starting_position
	velocity = Vector2.ZERO
