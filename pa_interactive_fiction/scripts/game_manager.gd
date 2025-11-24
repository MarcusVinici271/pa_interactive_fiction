extends Control

@export var command_processor: Node
@export var input_node: LineEdit
@export var history_rows_node: VBoxContainer
@export var input_response_scene: PackedScene

@export var room_scene: PackedScene
@export var scroll: ScrollContainer
@export var max_lines_remembered: int = 10

@export var player: Node

const SAVE_FILE_PATH = "user://savegame.dat"

var _scroll_bar: VScrollBar
var _max_scroll_length: float = 0.0
var _interacao_inicial_feita = false
var _audio_habilitado: bool = false
func _tentar_iniciar_audio() -> void:
	if not _interacao_inicial_feita and _audio_habilitado:
		# O restante da lógica de interação inicial (mouse/teclado)
		var starting_room = command_processor.get_starting_room_data()
		if starting_room and starting_room.has("Nome"):
			AudioPlayer.tocar_audio_da_sala(player.localizacao)

			if AudioPlayer.playing:
				_interacao_inicial_feita = true
				
func _tocar_audio_sala_atual() -> void:
	# Esta função só checa o flag de preferência do jogador
	if _audio_habilitado and player.localizacao:
		var nome_audio = player.localizacao
		AudioPlayer.tocar_audio_da_sala(nome_audio)
				
func _gui_input(event: InputEvent) -> void:
	# Captura eventos GUI (mouse, toque) dentro do limite do GameManager (Control)
	if event is InputEventMouseButton:
		_tentar_iniciar_audio()
# --- INÍCIO: Adições para Tamanho da Fonte ---
# Rastreia o tamanho da fonte atual
var _current_font_size: int = 30
const _FONT_SIZE_MIN: int = 16
const _FONT_SIZE_MAX: int = 48
const _FONT_SIZE_STEP: int = 2
# --- INÍCIO: CORES DE FONTE ---
var _primary_color: Color = Color.WHITE  
var _secondary_color: Color = Color("#00f7a8")
# --- INÍCIO: FONTE ---
var fonts: Dictionary = {
	"Fonte Padrao" : preload("res://assets/fonts/fonte_1/Exo_2/Exo2-Italic-VariableFont_wght.ttf"),
	"Fonte Sono" : preload("res://assets/fonts/fonte_1/Sono/static/Sono-Bold.ttf"),
	"Fonte Outfit": preload("res://assets/fonts/fonte_1/Outfit/static/Outfit-Bold.ttf")
}
var _selected_font: Font = fonts["Fonte Padrao"]

# Referências para os labels que precisam ser atualizados
@onready var _caret_label: Label = $Interface/MarginContainer/HBoxContainer/Rows/HBoxContainer/InputArea/HBoxContainer/Caret
@onready var _config_title_label: RichTextLabel = $Interface/MarginContainer/HBoxContainer/VBoxContainer/Config/MarginContainer2/VBoxContainer/PanelContainer/RichTextLabel
@onready var _config_font_label: RichTextLabel = $Interface/MarginContainer/HBoxContainer/VBoxContainer/Config/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/HBoxContainer/RichTextLabel
# --- FIM: Adições para Tamanho da Fonte ---
@onready var _audio_on_button: Button = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/Audio/On_audio
@onready var _audio_off_button: Button = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/Audio/Off_audio
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
		printerr("Falha ao injetar Player no CommandProcessor.
O jogo não pode começar.")
		return

	_start_game()
	
	# --- INÍCIO: Adição para Tamanho da Fonte ---
	# Define o tamanho da fonte inicial para todos os elementos
	_update_all_font_sizes()
	# --- FIM: Adição para Tamanho da Fonte ---
	# --- INÍCIO: Troca de Cores dos textos ---
	_color_change()
	# --- FIM: Troca de Cores dos textos ---
	# --- INÍCIO: Troca de Fontes dos textos ---
	_update_all_fonts(_selected_font)
	# --- FIM: Troca de Cores dos textos ---
	# --- INÍCIO: Audio on e off ---
	if _audio_on_button and _audio_off_button:
		_audio_on_button.pressed.connect(_on_audio_on_pressed)
		_audio_off_button.pressed.connect(_on_audio_off_pressed)
#_update_audio_buttons_ui()
# --- FIM: Audio on e off ---
func _start_game() -> void:
	if command_processor and room_scene:
		var starting_room = command_processor.get_starting_room_data()
		if not starting_room.is_empty():
			_add_room_node_to_game(starting_room)
			#if player.localizacao:
				#var nome_audio = player.localizacao
				#AudioPlayer.tocar_audio_da_sala(nome_audio)
		else:
			printerr("Erro: Não foi possível obter a sala inicial.")
	else:
		printerr("Erro ao iniciar o jogo: CommandProcessor ou RoomScene não estão definidos.")

func _on_input_submitted(new_text: String) -> void:
	# --- 1. VERIFICAÇÕES DE PRÉ-REQUISITOS E INPUT ---
	if not input_response_scene or not history_rows_node or not input_node or not command_processor or not player:
		printerr("Erro: verifique se todos os nós (Input, History, Scene, CommandProcessor, Player) estão atribuídos.")
		return

	if new_text.is_empty():
		return

	var result = command_processor.process_command(new_text)
	
	if result.type == command_processor.ResultType.META and result.command == "clear":
		_clear_history()
		input_node.text = ""
		return

	var input_response_instance = input_response_scene.instantiate()
	_add_response_to_game(input_response_instance)

	# --- 2. PROCESSAMENTO DE COMANDO ---
	
	match result.type:
		command_processor.ResultType.ROOM:
			# Comando de movimento: atualiza a sala e toca o áudio
			input_response_instance.set_text(new_text, result.message)
			_add_room_node_to_game(result.room)
			_tocar_audio_sala_atual()
			
		command_processor.ResultType.MESSAGE:
			# Comando que retorna apenas uma mensagem (ex: olhar)
			input_response_instance.set_text(new_text, result.message)
			
		command_processor.ResultType.META:
			if result.command == "save":
				_save_game()
				input_response_instance.set_text(new_text, result.message)
				
			elif result.command == "load":
				var load_success = _load_game()
				
				if load_success:
					input_response_instance.set_text(new_text, result.message)
					
					# Recarrega a sala após o load
					var new_room_data = command_processor.get_room_data(player.localizacao)
					_add_room_node_to_game(new_room_data)
					
					
					_tocar_audio_sala_atual()
				else:
					input_response_instance.set_text(new_text, "Falha ao carregar: nenhum jogo salvo encontrado.")

	input_node.text = ""

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
	# --- INÍCIO: Adição para Tamanho da Fonte ---
	# Aplica o tamanho da fonte atual ao novo nó ANTES de adicioná-lo
	_apply_font_size_to_node(response, _current_font_size)
	# --- FIM: Adição para Tamanho da Fonte ---
	# --- INÍCIO: Adição para Cor da Fonte ---
	_apply_color_to_node(response)
	# --- FIM: Adição para Cor da Fonte ---
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

# --- INÍCIO: Implementação dos Botões de Fonte ---

# Função auxiliar para aplicar o tamanho da fonte recursivamente
# aos nós RichTextLabel e Label dentro de um nó de cena (Room ou InputResponse)
func _apply_font_size_to_node(node: Control, size: int) -> void:
	# Encontra todos os RichTextLabels na cena filha
	var rich_text_labels = node.find_children("", "RichTextLabel", true, false)
	for label in rich_text_labels:
		label.set("theme_override_font_sizes/normal_font_size", size)
		label.set("theme_override_font_sizes/bold_font_size", size)
	
	# Encontra todos os Labels simples na cena filha
	var simple_labels = node.find_children("", "Label", true, false)
	for label in simple_labels:
		label.set("theme_override_font_sizes/font_size", size)

# Função auxiliar para atualizar TODOS os elementos de texto na tela
func _update_all_font_sizes() -> void:
	# 1. Atualiza o campo de input e o caret
	if input_node:
		input_node.set("theme_override_font_sizes/font_size", _current_font_size)
	if _caret_label:
		_caret_label.set("theme_override_font_sizes/font_size", _current_font_size)
	
	# 2. Atualiza os labels no painel de Configurações
	if _config_title_label:
		_config_title_label.set("theme_override_font_sizes/normal_font_size", _current_font_size)
	if _config_font_label:
		_config_font_label.set("theme_override_font_sizes/normal_font_size", _current_font_size)
	
	# 3. Atualiza todos os nós de histórico existentes
	if history_rows_node:
		for child in history_rows_node.get_children():
			_apply_font_size_to_node(child, _current_font_size)

func _on_diminuir_button_down() -> void:
	# Diminui o tamanho da fonte, respeitando o limite mínimo
	_current_font_size = max(_FONT_SIZE_MIN, _current_font_size - _FONT_SIZE_STEP)
	_update_all_font_sizes()

func _on_aumentar_button_down() -> void:
	# Aumenta o tamanho da fonte, respeitando o limite máximo
	_current_font_size = min(_FONT_SIZE_MAX, _current_font_size + _FONT_SIZE_STEP)
	_update_all_font_sizes()
# --- FIM: Implementação dos Botões de Fonte ---

@onready var cpb2: ColorPickerButton = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/CorFonte2/ColorPickerButton
@onready var cpb1: ColorPickerButton = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/CorFonte/ColorPickerButton
@onready var color_buttons: =[cpb1, cpb2]
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
	# 1. Input e caret
	if input_node:
		input_node.set("theme_override_colors/font_color", _primary_color)

	if _caret_label:
		_caret_label.set("theme_override_colors/font_color", _primary_color)

	# 2. Textos da Config
	if _config_title_label:
		_config_title_label.set("theme_override_colors/default_color", _primary_color)
	if _config_font_label:
		_config_font_label.set("theme_override_colors/default_color", _primary_color)

	# 3. Atualizar textos já existentes no histórico
	if history_rows_node:
		for child in history_rows_node.get_children():
			_apply_color_to_node(child)
func _apply_color_to_node(node: Control):
	var rich_text_labels = node.find_children("", "RichTextLabel", true, false)
	for label in rich_text_labels:
		# Se o label for Nome ou Saidas, aplica a cor secundária
		if label.name in ["Name", "Exits"]:
			label.set("theme_override_colors/default_color", _secondary_color)
			label.set("theme_override_colors/font_color", _secondary_color)
		else:
			label.set("theme_override_colors/default_color", _primary_color)
			label.set("theme_override_colors/font_color", _primary_color)
		
	var labels = node.find_children("", "Label", true, false)
	for label in labels:
		# Mesma lógica para Labels simples
		if label.name in ["NameLabel", "Exits"]:
			label.set("theme_override_colors/font_color", _secondary_color)
		else:
			label.set("theme_override_colors/font_color", _primary_color)
		
@onready var font_selector: OptionButton = $Interface/MarginContainer/HBoxContainer/VBoxContainer/ConfigPanel/MarginContainer2/VBoxContainer/PanelContainer2/VBoxContainer/TrocarFonte/FontSelector

func _fontes():
	# Popula o OptionButton
	for nome in fonts.keys():
		font_selector.add_item(nome)

	# Conecta sinal
	font_selector.item_selected.connect(_on_font_selected)
	
func _on_font_selected(index: int) -> void:
	var selected_name = font_selector.get_item_text(index)
	var _selected_font  = fonts[selected_name]
	
	# Atualiza todas as labels
	_update_all_fonts(_selected_font)
	
func _update_all_fonts(new_font_file: FontFile) -> void:
	# Input (LineEdit)
	if input_node:
		input_node.add_theme_font_override("font", new_font_file)

	# Caret (Label ou RichTextLabel)
	if _caret_label:
		_caret_label.add_theme_font_override("font", new_font_file)

	# Textos da Config (RichTextLabel)
	if _config_title_label:
		_config_title_label.add_theme_font_override("font", new_font_file)
	if _config_font_label:
		_config_font_label.add_theme_font_override("font", new_font_file)

	# Histórico de mensagens
	if history_rows_node:
		for child in history_rows_node.get_children():
			_apply_font_to_node(child, new_font_file)


			
func _apply_font_to_node(node: Control, new_font: FontFile) -> void:
	for label in node.find_children("", "Label", true, false):
		label.add_theme_font_override("font", new_font)
	for rlabel in node.find_children("", "RichTextLabel", true, false):
		rlabel.add_theme_font_override("font", new_font)
		
		
func _on_audio_on_pressed() -> void:
	_audio_habilitado = true
	_tocar_audio_sala_atual()
	_tentar_iniciar_audio()
	#_update_audio_buttons_ui() 

func _on_audio_off_pressed() -> void:
	_audio_habilitado = false
	AudioPlayer.parar_audio()
	#_update_audio_buttons_ui() 


#func _update_audio_buttons_ui() -> void:
	#if _audio_habilitado:
		#_audio_on_button.disabled = false
		#_audio_off_button.disabled = true
	#else:
		#_audio_on_button.disabled = false
		#_audio_off_button.disabled = false
