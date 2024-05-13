class_name HotKeyRebindButton
extends Control

@onready var label = $HBoxContainer/Label as Label
@onready var label2 = $HBoxContainer/Label2 as Label

@export var action_name : String = "UP"

func _ready():
	set_process_unhandled_key_input(false)
	set_action_name()

func set_action_name() -> void:
	label.text = "Unassigned"
	label2.text = "Unassigned"
	
	match action_name:
		"UP":
			label.text = "UP"
			label2.text = "W"
		"DOWN":
			label.text = "DOWN"
			label2.text = "S"
		"LEFT":
			label.text = "LEFT"
			label2.text = "A"
		"RIGHT":
			label.text = "RIGHT"
			label2.text = "D"
