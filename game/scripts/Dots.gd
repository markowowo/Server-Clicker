extends Node2D


# cursor dots
func _on_cursor_dots_info_hover_mouse_entered() -> void:
	$CPUDots/CPUDotsInfo.visible = true
	
func _on_cursor_dots_info_hover_mouse_exited() -> void:
	$CPUDots/CPUDotsInfo.visible = false


func _on_rxamz_dots_info_hover_mouse_entered() -> void:
	$CoolerDots/CoolerDotsInfo.visible = true


func _on_rxamz_dots_info_hover_mouse_exited() -> void:
	$CoolerDots/CoolerDotsInfo.visible = false


func _on_zoltar_dots_info_hover_mouse_entered() -> void:
	$RAMDots/RAMDotsInfo.visible = true


func _on_zoltar_dots_info_hover_mouse_exited() -> void:
	$RAMDots/RAMDotsInfo.visible = false


func _on_oi_dots_info_hover_mouse_entered():
	$HDDDots/HDDDotsInfoHover.visible = true


func _on_oi_dots_info_hover_mouse_exited():
	$HDDDots/HDDDotsInfoHover.visible = false


func _on_hitman_dots_info_hover_mouse_entered():
	$GPUDots/GPUDotsInfo.visible = true


func _on_hitman_dots_info_hover_mouse_exited():
	$GPUDots/GPUDotsInfo.visible = false
