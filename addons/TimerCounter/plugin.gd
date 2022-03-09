tool
extends EditorPlugin

const main_scene = preload("res://addons/TimerCounter/TimerCounter.tscn")


var on_screen
var container = CONTAINER_TOOLBAR


func _enter_tree():
	on_screen = main_scene.instance()
	add_control_to_container(container, on_screen)


func _exit_tree():
	remove_control_from_container(container, on_screen)
	on_screen.queue_free()
