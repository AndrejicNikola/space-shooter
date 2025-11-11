extends CanvasLayer

static var image = load("res://Graphics/lives/playerLife1_blue.png")
var time_elapsed := 0
func set_health(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in amount:
		var text_react = TextureRect.new()
		text_react.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_react)
		text_react.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	print(time_elapsed)
	$MarginContainer/Label.text = str(time_elapsed)
	Global.score = time_elapsed
