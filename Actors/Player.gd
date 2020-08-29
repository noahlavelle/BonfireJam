extends KinematicBody2D

var velocity = Vector2.ZERO

var speed = Vector2(300, 300)
var gravity = 1000

func _physics_process(_delta):
	var isJumpInterrupted = Input.is_action_just_released("move_jump") and velocity.y < 0.0
	var moveVector = getMoveVector()
	handleAnimations(moveVector)
	velocity = calculate_move_velocity(velocity, moveVector, speed, isJumpInterrupted)
	velocity = move_and_slide(velocity, Vector2.UP)

func getMoveVector():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("move_jump") and is_on_floor() else 1.0
		)

func calculate_move_velocity(
		linearVelocity: Vector2, moveVector: Vector2, moveSpeed: Vector2, isJumpInterrupted: bool
	) -> Vector2:
	var out = Vector2(moveSpeed.x * moveVector.x, linearVelocity.y + gravity * get_physics_process_delta_time())
	if moveVector.y < 0:
		out.y = moveSpeed.y * moveVector.y
	if isJumpInterrupted:
		out.y = 0
	return out

func handleAnimations(moveVector):
	if moveVector.y != 0 and not is_on_floor():
		$AnimatedSprite.animation = "jump"
		if moveVector.x != 0:
			$AnimatedSprite.flip_h = clamp(moveVector.x * -1, 0, 1)
		return
	if moveVector.x == 0:
		$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = clamp(moveVector.x * -1, 0, 1)
