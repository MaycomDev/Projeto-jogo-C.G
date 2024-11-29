extends Area2D

# Nome do personagem que pode interagir com o portal
const PLAYER_NAME = "Player"

# Caminho da próxima cena
@export var next_scene_path: String = "res://menu_final"

# Flag para saber se o personagem está na área do portal
var player_in_area: bool = false

# Sinal de entrada na área de interação
func _on_body_entered(body: Node) -> void:
	if body.name == PLAYER_NAME:
		player_in_area = true
		print("Pressione 'Enter' para trocar de fase.")

# Sinal de saída da área de interação
func _on_body_exited(body: Node) -> void:
	if body.name == PLAYER_NAME:
		player_in_area = false
		print("Personagem saiu da área do portal.")

# Detecta a tecla de interação e troca a cena
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("ui_accept"):
		print("Trocando de fase...")
		get_tree().change_scene_to_file(next_scene_path)
