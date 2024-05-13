class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var select_level_button = $MarginContainer/HBoxContainer/VBoxContainer/Select_Level_Button as Button
@onready var options_menu = $Options_Menu as OptionsMenu
@onready var select_level_menu = $Select_Level_Menu as SelectLevelMenu
@onready var margin_container = $MarginContainer as MarginContainer

@onready var start_level = preload("res://Scenes/Level.tscn") as PackedScene

func _ready():
	handle_connecting_signals()
	
func on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	
func on_options_button_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func on_select_level_button_pressed() -> void:
	margin_container.visible = false
	select_level_menu.set_process(true)
	select_level_menu.visible = true
	
func on_exit_button_pressed() -> void:
	get_tree().quit()
	
func on_exit_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false

func on_exit_select_level_menu() -> void:
	margin_container.visible = true
	select_level_menu.visible = false

func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_button_pressed)
	select_level_button.button_down.connect(on_select_level_button_pressed)
	options_button.button_down.connect(on_options_button_pressed)
	exit_button.button_down.connect(on_exit_button_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)
	select_level_menu.exit_select_level_menu.connect(on_exit_select_level_menu)
