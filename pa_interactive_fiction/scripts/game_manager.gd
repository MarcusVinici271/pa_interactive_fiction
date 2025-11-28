extends Control

@export var command_processor: Node
@export var input_node: LineEdit
@export var history_rows_node: VBoxContainer
@export var input_response_scene: PackedScene
@export var room_scene: PackedScene
@export var scroll: ScrollContainer
@export var max_lines_remembered: int = 10
@export var player: Node

var _scroll_bar: VScrollBar
var _max_scroll_length: float = 0.0
var _interacao_inicial_feita = false
var _audio_habilitado: bool = false
var _estado_jogo: String = "menu"
const SAVE_FILE_PATH = "user://savegame.dat"

# --- [ AUDIO/INTERAÇÃO DE INÍCIO ] ---

func _tentar_iniciar_audio() -> void:
	if not _interacao_inicial_feita and _audio_habilitado:
		var starting_room = command_processor.get_starting_room_data()
		if starting_room and starting_room.has("Nome"):
			AudioPlayer.tocar_audio_da_sala(player.localizacao)

			if AudioPlayer.playing:
				_interacao_inicial_feita = true
				
func _tocar_audio_sala_atual() -> void:
	if _audio_habilitado and player.localizacao:
		var nome_audio = player.localizacao
		AudioPlayer.tocar_audio_da_sala(nome_audio)
				
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_tentar_iniciar_audio()
		
# --- [ VARIÁVEIS DE CONFIGURAÇÃO DE UI ] ---

var _current_font_size: int = 30
const _FONT_SIZE_MIN: int = 16
const _FONT_SIZE_MAX: int = 48
const _FONT_SIZE_STEP: int = 2
var _primary_color: Color = Color.WHITE
var _secondary_color: Color = Color("#00f7a8")
var fonts: Dictionary = {
	"Fonte Padrao" : preload("res://assets/fonts/fonte_1/Exo_2/Exo2-Italic-VariableFont_wght.ttf"),
	"Fonte Sono" : preload("res://assets/fonts/fonte_1/Sono/static/Sono-Bold.ttf"),
	"Fonte Outfit": preload("res://assets/fonts/fonte_1/Outfit/static/Outfit-Bold.ttf")
}
var _selected_font: Font = fonts["Fonte Padrao"]

# --- [ REFERÊNCIAS ONREADY ] ---

@onready var _caret_label: Label = $Interface/MarginContainer/HBoxContainer/Rows/HBoxContainer/InputArea/HBoxContainer/Caret
@onready var _config_title_label: RichTextLabel = $Interface/MarginContainer/HBoxContainer/VBoxContainer/Config/MarginContainer2/VBoxContainer/PanelContainer/RichTextLabel
@onready var _config_font_label: RichTextLabel = $Interface/MarginContainer/HBoxContainer/VBoxContainer/Config/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/HBoxContainer/RichTextLabel
@onready var _audio_on_button: Button = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/Audio/On_audio
@onready var _audio_off_button: Button = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/Audio/Off_audio
@onready var cpb2: ColorPickerButton = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/CorFonte2/ColorPickerButton
@onready var cpb1: ColorPickerButton = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/CorFonte/ColorPickerButton
@onready var color_buttons: =[cpb1, cpb2]
@onready var font_selector: OptionButton = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/TrocarFonte/FontSelector

# --- [ FUNÇÕES BÁSICAS DE CICLO DE VIDA ] ---

func _exibir_menu_principal() -> void:
	
	var menu_text = """
[b]CRÔNICAS DA LÁGRIMA NEGRA[/b]

Por favor, digite uma opção para começar:

- [b]TUTORIAL[/b] (Aprender a jogar)
- [b]JOGAR[/b] (Começar a aventura principal)
- [b]CARREGAR[/b] (Continuar jogo salvo)
"""
	
	var menu_instance = input_response_scene.instantiate()
	menu_instance.set_text("", menu_text)
	_add_response_to_game(menu_instance)


func _ready() -> void:
	if input_node:
		input_node.text_submitted.connect(_on_input_submitted)
	else:
		printerr("Erro: 'input_node' não foi atribuído no GameManager.")

	if scroll:
		_scroll_bar = scroll.get_v_scroll_bar()
		_scroll_bar.changed.connect(_handle_scrollbar_changed)
		_max_scroll_length = _scroll_bar.max_value
	else:
		printerr("Erro: 'Scroll' não foi atribuído no GameManager.")

	if not player: printerr("Erro: 'Player' não foi atribuído no GameManager.")
	if not command_processor: printerr("Erro: 'CommandProcessor' não foi atribuído.")
	if not room_scene: printerr("Erro: 'Room' não foi atribuído.")
	if not input_response_scene: printerr("Erro: 'InputScene' não foi atribuído.")

	if player and command_processor:
		command_processor.set_player(player)
	else:
		printerr("Falha ao injetar Player no CommandProcessor. O jogo não pode começar.")
		return

	_exibir_menu_principal()
	
	_update_all_font_sizes()
	_color_change()
	_update_all_fonts(_selected_font)

	if _audio_on_button and _audio_off_button:
		_audio_on_button.pressed.connect(_on_audio_on_pressed)
		_audio_off_button.pressed.connect(_on_audio_off_pressed)
		
func _start_game() -> void:
	_clear_history()
	if command_processor and room_scene:
		var starting_room = command_processor.get_starting_room_data()
		if not starting_room.is_empty():
			_add_room_node_to_game(starting_room)
		else:
			printerr("Erro: Não foi possível obter a sala inicial.")
	else:
		printerr("Erro ao iniciar o jogo: CommandProcessor ou RoomScene não estão definidos.")

# --- [ LÓGICA DE TUTORIAL E ESTADO ] ---

func _iniciar_tutorial():
	_clear_history()
	_estado_jogo = "tutorial"
	
	command_processor.set_tutorial_mode(true) 
	
	var sala_inicial = "tutorial_inicio"
	
	player.localizacao = sala_inicial
	
	var starting_room_data = command_processor.get_room_data(sala_inicial) 
	
	if not starting_room_data.is_empty():
		_add_room_node_to_game(starting_room_data)
		_tocar_audio_sala_atual()
	else:
		printerr("Erro: Não foi possível carregar a sala inicial do tutorial.")
		
func _finalizar_tutorial() -> void:
	_clear_history()
	
	_estado_jogo = "principal"
	
	_start_game()

# --- [ PROCESSAMENTO DE INPUT E COMANDOS ] ---

func _on_input_submitted(new_text: String) -> void:
	if not input_response_scene or not history_rows_node or not input_node or not command_processor or not player:
		printerr("Erro: nós não atribuídos.")
		return

	if new_text.is_empty():
		return

	var comando_limpo = new_text.to_lower().strip_edges()
	var response_instance: Control
	var load_success: bool
	var new_room_data: Dictionary

	# --- [ ESTADO: TUTORIAL (Comando 'tutorial') ] ---
	if _estado_jogo == "tutorial":
		if comando_limpo == "tutorial":
			_finalizar_tutorial()
			input_node.text = ""
			return

	# --- [ ESTADO: MENU (Comandos de MODO) ] ---
	if _estado_jogo == "menu":
		match comando_limpo:
			"tutorial":
				_iniciar_tutorial()
				input_node.text = ""
				return

			"jogar":
				_estado_jogo = "principal"
				_start_game()
				input_node.text = ""
				return

			"carregar":
				load_success = _load_game()
				response_instance = input_response_scene.instantiate()

				if load_success:
					_clear_history() # Limpa o menu da tela
					_estado_jogo = "principal"
					response_instance.set_text(new_text, "Jogo carregado com sucesso. Bem-vindo de volta!")
					_add_response_to_game(response_instance)

					new_room_data = command_processor.get_room_data(player.localizacao)
					_add_room_node_to_game(new_room_data)
					_tocar_audio_sala_atual()
				else:
					response_instance.set_text(new_text, "Falha ao carregar: nenhum jogo salvo encontrado.")
					_add_response_to_game(response_instance)
				
				input_node.text = ""
				return

			_:
				response_instance = input_response_scene.instantiate()
				response_instance.set_text(new_text, "Comando inválido. Digite 'tutorial', 'jogar' ou 'carregar'.")
				_add_response_to_game(response_instance)
				input_node.text = ""
				return

	# --- [ ESTADO: PRINCIPAL / TUTORIAL (Comandos do Jogo) ] ---
	
	var result = command_processor.process_command(comando_limpo)
	
	if result.type == command_processor.ResultType.META and result.command == "clear":
		_clear_history()
		input_node.text = ""
		return

	response_instance = input_response_scene.instantiate()
	_add_response_to_game(response_instance)

	match result.type:
		command_processor.ResultType.ROOM:
			response_instance.set_text(new_text, result.message)
			_add_room_node_to_game(result.room)
			_tocar_audio_sala_atual()
			
		command_processor.ResultType.MESSAGE:
			response_instance.set_text(new_text, result.message)
			
		command_processor.ResultType.META:
			if result.command == "save":
				_save_game()
				response_instance.set_text(new_text, result.message)
				
			elif result.command == "load":
				load_success = _load_game()
				
				if load_success:
					response_instance.set_text(new_text, result.message)
					new_room_data = command_processor.get_room_data(player.localizacao)
					_add_room_node_to_game(new_room_data)
					_tocar_audio_sala_atual()
				else:
					response_instance.set_text(new_text, "Falha ao carregar: nenhum jogo salvo encontrado.")

	input_node.text = ""

# --- [ LÓGICA DE SALVAR/CARREGAR ] ---

func _save_game() -> void:
	if not player:
		printerr("Player não encontrado, impossível salvar.")
		return

	var save_data = {
		"nome": player.nome,
		"raca": player.raca,
		"sexo": player.sexo,
		"idade": player.idade,
		"descricao": player.descricao,
		"localizacao": player.localizacao
	}

	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	if file == null:
		printerr("Erro ao tentar abrir arquivo para salvar: ", FileAccess.get_open_error())
		return

	file.store_var(save_data)
	file.close()

func _load_game() -> bool:
	if not player:
		printerr("Player não encontrado, impossível carregar.")
		return false

	if not FileAccess.file_exists(SAVE_FILE_PATH):
		return false

	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	if file == null:
		printerr("Erro ao tentar abrir arquivo para carregar: ", FileAccess.get_open_error())
		return false

	var save_data = file.get_var()
	file.close()

	player.nome = save_data.nome
	player.raca = int(save_data.raca)
	player.sexo = save_data.sexo
	player.idade = save_data.idade
	player.descricao = save_data.descricao
	player.localizacao = save_data.localizacao
	
	return true

# --- [ MANIPULAÇÃO DE TELA E HISTÓRICO ] ---

func _add_room_node_to_game(data) -> void:
	if not room_scene: return

	var room_node = room_scene.instantiate()

	var objects_text = "Não há objetos nesta sala."
	room_node.set_text(
		data.Nome,
		data.Descricao,

		data.DescricaoSaidas,
		objects_text
	)

	_add_response_to_game(room_node)

func _add_response_to_game(response: Control) -> void:
	_apply_font_size_to_node(response, _current_font_size)
	_apply_color_to_node(response)
	history_rows_node.add_child(response)
	_delete_input_beyond_limit()

func _delete_input_beyond_limit() -> void:
	if history_rows_node.get_child_count() > max_lines_remembered:
		var rows_to_forget = history_rows_node.get_child_count() - max_lines_remembered
		for i in range(rows_to_forget):
			history_rows_node.get_child(i).queue_free()
			
func _clear_history() -> void:
	for child in history_rows_node.get_children():
		child.queue_free()

func _handle_scrollbar_changed() -> void:
	if _max_scroll_length != _scroll_bar.max_value:
		_max_scroll_length = _scroll_bar.max_value
		scroll.scroll_vertical = int(_max_scroll_length)

# --- [ FUNÇÕES DE CUSTOMIZAÇÃO: FONTE/COR ] ---

func _apply_font_size_to_node(node: Control, size: int) -> void:
	var rich_text_labels = node.find_children("", "RichTextLabel", true, false)
	for label in rich_text_labels:
		label.set("theme_override_font_sizes/normal_font_size", size)
		label.set("theme_override_font_sizes/bold_font_size", size)
	
	var simple_labels = node.find_children("", "Label", true, false)
	for label in simple_labels:
		label.set("theme_override_font_sizes/font_size", size)

func _update_all_font_sizes() -> void:
	if input_node:
		input_node.set("theme_override_font_sizes/font_size", _current_font_size)
	if _caret_label:
		_caret_label.set("theme_override_font_sizes/font_size", _current_font_size)
	
	if _config_title_label:
		_config_title_label.set("theme_override_font_sizes/normal_font_size", _current_font_size)
	if _config_font_label:
		_config_font_label.set("theme_override_font_sizes/normal_font_size", _current_font_size)
	
	if history_rows_node:
		for child in history_rows_node.get_children():
			_apply_font_size_to_node(child, _current_font_size)

func _on_diminuir_button_down() -> void:
	_current_font_size = max(_FONT_SIZE_MIN, _current_font_size - _FONT_SIZE_STEP)
	_update_all_font_sizes()

func _on_aumentar_button_down() -> void:
	_current_font_size = min(_FONT_SIZE_MAX, _current_font_size + _FONT_SIZE_STEP)
	_update_all_font_sizes()

func _color_change():
	call_deferred("iniciar_conexoes")
func iniciar_conexoes():
	for b in color_buttons:
		if b:
			b.picker_created.connect(_on_picker_created.bind(b))
			b.color_changed.connect(_on_color_selected.bind(b))

func _on_picker_created(button: ColorPickerButton):
	var picker = button.get_picker()
	if picker:
		
		picker.sliders_visible = false
		picker.color_modes_visible = false
		picker.presets_visible = false
		picker.sampler_visible = false
		picker.hex_visible = false
		picker.edit_alpha = false
		picker.edit_intensity = false

func _on_color_selected(color: Color, button: ColorPickerButton):
	if button == cpb1:
		_primary_color = color
	elif button == cpb2:
		_secondary_color = color

	_update_all_text_colors()
	
func _update_all_text_colors():
	if input_node:
		input_node.set("theme_override_colors/font_color", _primary_color)

	if _caret_label:
		_caret_label.set("theme_override_colors/font_color", _primary_color)

	if _config_title_label:
		_config_title_label.set("theme_override_colors/default_color", _primary_color)
	if _config_font_label:
		_config_font_label.set("theme_override_colors/default_color", _primary_color)

	if history_rows_node:
		for child in history_rows_node.get_children():
			_apply_color_to_node(child)
func _apply_color_to_node(node: Control):
	var rich_text_labels = node.find_children("", "RichTextLabel", true, false)
	for label in rich_text_labels:
		if label.name in ["Name", "Exits"]:
			label.set("theme_override_colors/default_color", _secondary_color)
			label.set("theme_override_colors/font_color", _secondary_color)
		else:
			label.set("theme_override_colors/default_color", _primary_color)
			label.set("theme_override_colors/font_color", _primary_color)
		
	var labels = node.find_children("", "Label", true, false)
	for label in labels:
		if label.name in ["NameLabel", "Exits"]:
			label.set("theme_override_colors/font_color", _secondary_color)
		else:
			label.set("theme_override_colors/font_color", _primary_color)
		
func _fontes():
	for nome in fonts.keys():
		font_selector.add_item(nome)

	font_selector.item_selected.connect(_on_font_selected)
	
func _on_font_selected(index: int) -> void:
	var selected_name = font_selector.get_item_text(index)
	var _selected_font = fonts[selected_name]
	
	_update_all_fonts(_selected_font)
	
func _update_all_fonts(new_font_file: FontFile) -> void:
	if input_node:
		input_node.add_theme_font_override("font", new_font_file)

	if _caret_label:
		_caret_label.add_theme_font_override("font", new_font_file)

	if _config_title_label:
		_config_title_label.add_theme_font_override("font", new_font_file)
	if _config_font_label:
		_config_font_label.add_theme_font_override("font", new_font_file)

	if history_rows_node:
		for child in history_rows_node.get_children():
			_apply_font_to_node(child, new_font_file)


			
func _apply_font_to_node(node: Control, new_font: FontFile) -> void:
	for label in node.find_children("", "Label", true, false):
		label.add_theme_font_override("font", new_font)
	for rlabel in node.find_children("", "RichTextLabel", true, false):
		rlabel.add_theme_font_override("font", new_font)
		
# --- [ FUNÇÕES DE ÁUDIO ON/OFF ] ---

func _on_audio_on_pressed() -> void:
	_audio_habilitado = true
	_tocar_audio_sala_atual()
	_tentar_iniciar_audio()
	#_update_audio_buttons_ui() 

func _on_audio_off_pressed() -> void:
	_audio_habilitado = false
	AudioPlayer.parar_audio()
	#_update_audio_buttons_ui()
