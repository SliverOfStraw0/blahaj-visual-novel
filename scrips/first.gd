extends Node2D

@onready var saveloadbuttons = $"CanvasLayer/saveload controll"
var shotheSaveButtons = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("blahaj interaction 1")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#test
	if shotheSaveButtons:
		saveloadbuttons.show()
	else:
		saveloadbuttons.hide()
		
	if Input.is_action_pressed("saveshow"):
		shotheSaveButtons = true
		$"CanvasLayer/press to save_load".hide()
		$CanvasLayer/stamps.hide()
	else:
		shotheSaveButtons = false


func _on_save_pressed() -> void:
	Dialogic.Save.save()


func _on_load_pressed() -> void:
	Dialogic.Save.load()


func _on_timer_timeout() -> void:
	#$"CanvasLayer/press to save_load".hide()
	var tween = get_tree().create_tween()
	tween.tween_property($"CanvasLayer/press to save_load", "modulate:a",0, 2.5)

func _on_stamps_timeout() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasLayer/stamps, "modulate:a",0, 2.5)

func _on_save_2_pressed() -> void:
	Dialogic.Save.save("2nd")


func _on_load_2_pressed() -> void:
	Dialogic.Save.load("2nd")
