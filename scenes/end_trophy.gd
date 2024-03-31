extends Area2D

@onready var game_manager = %GameManager

func _on_body_entered(body):
	if body.name == "MainCharcater":
		queue_free()
		game_manager.change_game_completion_status("completed")
