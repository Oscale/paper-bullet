extends Node2D
signal spawn_star

func _on_timer_timeout():
	spawn_star.emit()
