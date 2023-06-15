extends CanvasLayer

signal start_game


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over(score):
	if score >= 26:
		show_message("You Won!")
		yield($MessageTimer, "timeout")
		$MessageLabel.text = "Love pills cure\nEVERYTHING!!!"
		$MessageLabel.show()
		yield(get_tree().create_timer(1), "timeout")		
	else:
		show_message("Game Over!")
		yield($MessageTimer, "timeout")
		$MessageLabel.text = "Dodge the Cats\nW-A-S-D\nto move\nReach to 26"
		$MessageLabel.show()
		yield(get_tree().create_timer(1), "timeout")
		$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
