extends Node

const MOD_NAME = "otDan-RollsLeft"

var mod_loader
var dir = ""
var translations_dir = ""
var extensions_dir = ""


func _init(mod_loader = ModLoader):
	ModLoaderUtils.log_info("Init", MOD_NAME)
	self.mod_loader = mod_loader

	dir = mod_loader.UNPACKED_DIR + MOD_NAME + "/"
	translations_dir = dir + "translations/"
	extensions_dir = dir + "extensions/"

	_install_translations()
	_install_script_extensions()
	_add_child_classes()


func _ready():
	ModLoaderUtils.log_success("Loaded", MOD_NAME)


func _install_translations()->void:
	mod_loader.add_translation_from_resource(translations_dir + "rollsleft_translation.en.translation")


func _physics_process(delta):
	_try_install_shop_extension()


func _install_script_extensions():
#	mod_loader.install_script_extension(extensions_dir + "singletons/run_data.gd")
#	mod_loader.install_script_extension(extensions_dir + "ui/menus/ingame/ingame_main_menu.gd")
	pass


func _try_install_shop_extension():
	var run_data = get_node_or_null("/root/RunData")
	if is_instance_valid(run_data):
		if RunData.effects.has("free_rerolls"):
			mod_loader.install_script_extension(extensions_dir + "ui/menus/shop/shop.gd")
			set_physics_process(false)


func _add_child_classes():
#	var ItemExplorer = load(dir + "item_explorer.gd").new()
#	ItemExplorer.name = "ItemExplorer"
#	add_child(ItemExplorer)
#
#	var StringComparer = load(dir + "global/string_comparer.gd").new()
#	StringComparer.name = "StringComparer"
#	add_child(StringComparer)
	pass
