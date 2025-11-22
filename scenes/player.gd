extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	velocity = velocity.normalized() * speed
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("interact"): # e.g., space
		var space_state = get_world_2d().direct_space_state
		var result = space_state.intersect_shape(get_collision_shape().shape, Transform2D(global_position))
		for hit in result:
			if hit.collider.is_in_group("NPC"):
				var dialogue = hit.collider.interact()
				get_tree().current_scene.get_node("DialogueLabel").text = dialogue
