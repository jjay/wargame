
extends Control

signal action_changed(action)

onready var buttons = get_node("buttons")
var current_action = null

var actions = ["move", "attack", "special"]

func _ready():
	var index = 0
	for idx in range(actions.size()):
		var btn = buttons.get_child(idx)
		btn.get_node("label").set_text(actions[idx])
		btn.connect("pressed", self, "_pressed", [actions[idx]])

func _pressed(name):
	for btn in buttons.get_children():
		if btn.get_name() == name:
			call_deferred("emit_signal", "action_changed", name)
			continue
		btn.set_pressed(false)

