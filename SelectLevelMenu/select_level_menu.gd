class_name SelectLevelMenu
extends Control

@onready var level1_button = $MarginContainer/HBoxContainer/VBoxContainer/Level1_Button as Button
@onready var level_1 = preload("res://Scenes/Level.tscn") as PackedScene

@onready var level2_button = $MarginContainer/HBoxContainer/VBoxContainer/Level2_Button as Button
@onready var level_2 = preload("res://Scenes/Level2.tscn") as PackedScene

@onready var exit_select_level_button = $MarginContainer/HBoxContainer/VBoxContainer/Select_Menu_Exit_Button as Button

signal exit_select_level_menu

func _ready():
	level1_button.button_down.connect(on_level1_button_pressed)
	level2_button.button_down.connect(on_level2_button_pressed)
	exit_select_level_button.button_down.connect(on_exit_select_level_button_pressed)
	set_process(false)

func on_level1_button_pressed() -> void:
	get_tree().change_scene_to_packed(level_1)

func on_level2_button_pressed() -> void:
	get_tree().change_scene_to_packed(level_2)

func on_exit_select_level_button_pressed() -> void:
	exit_select_level_menu.emit()
	set_process(false)
