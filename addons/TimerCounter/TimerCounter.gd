tool
extends PanelContainer

onready var countTimer = $Timer
var time_now = 0
var timer_status = false
export(int)var currentTime = 1 # Start in custom time

func _ready():
	if not currentTime != 1:
		$VBoxContainer/Label.text = "START"
		$VBoxContainer/PanelContainer/button_paused.visible = true
		$Timer.stop()
	else:
		$VBoxContainer/Label.text = "CONTINUE"

func _process(delta):
	if Input.is_key_pressed(KEY_ALT) && Input.is_key_pressed(KEY_S): # If press Alt + S Start Timer
		_on_button_play_pressed()
	if Input.is_key_pressed(KEY_ALT) && Input.is_key_pressed(KEY_A): # If press Alt + S Stop Timer
		_on_button_paused_pressed()
	if timer_status:
		time_now = currentTime # Get the custom Time ( default 1 )
		var elapsed = (time_now)
		var hours = (elapsed / 60) / 60
		var minutes = (elapsed / 60)% 60
		var seconds = elapsed % 60
		var str_elapsed = "%02d:%02d:%02d" % [hours, minutes, seconds]
		$VBoxContainer/Label.text = str(str_elapsed)

func _on_Timer_timeout():
	currentTime += 1 # seconds :)

func _on_button_play_pressed():
	$Timer.stop()
	timer_status = false
	$VBoxContainer/PanelContainer/button_paused.visible = true

func _on_button_paused_pressed():
	$Timer.start()
	timer_status = true
	$VBoxContainer/PanelContainer/button_paused.visible = false
