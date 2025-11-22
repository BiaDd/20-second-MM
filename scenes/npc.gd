extends CharacterBody2D

@export var npc_name: String
@export var is_murderer: bool = false
@export var dialogue_pool: Array = []

func interact():
	# Pick random dialogue
	var dialogue = dialogue_pool[randi() % dialogue_pool.size()]
	return dialogue
