extends CanvasLayer
onready var control: Control= $Control

func _on_QuitarPausa_button_up() -> void:
	get_tree().set_pause(false)
	control.visible= false
