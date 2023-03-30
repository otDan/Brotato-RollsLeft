extends "res://ui/menus/shop/shop.gd"


var rolls_left_panel


func _ready():
	var reroll_button = find_node("RerollButton")
	rolls_left_panel = preload("res://mods-unpacked/otDan-RollsLeft/ui/menus/shop/rolls_left_panel.tscn").instance()
	var parent = reroll_button.get_parent()
	parent.add_child(rolls_left_panel)
	parent.move_child(rolls_left_panel, parent.get_child_count() - 2)
	update_free_rerolls()


func _on_RerollButton_pressed()->void:
	._on_RerollButton_pressed()
	update_free_rerolls()


func update_free_rerolls():
	rolls_left_panel.visible = _free_rerolls > 0
	rolls_left_panel.get_node("%Label").text = tr("MENU_ROLLS_LEFT").replace("{0}", _free_rerolls)
