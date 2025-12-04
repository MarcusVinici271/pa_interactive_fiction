extends Node

enum ResultType { MESSAGE, ROOM, META }

@export var room_data: Resource
@export var tutorial_rooms: Resource
@export var room_resume_data : Resource

var _salas: Dictionary
var _salas_resumidas: Dictionary
var _tutorial_salas: Dictionary
var _usar_tutorial: bool = false

var _player: Node = null

func _ready() -> void:
	if not room_data:
		printerr("Erro! 'room_data' não foi atribuído no CommandProcessor.")
		return
	
	if "salas" in room_data:
		_salas = room_data.salas
	
	if room_resume_data and "salas_resumidas" in room_resume_data:
		_salas_resumidas = room_resume_data.salas_resumidas
		print("DEBUG: Salas resumidas carregadas. Total de salas: ", _salas_resumidas.size())
		print("DEBUG: Conteúdo resumido do ID 'inicio': ", _salas_resumidas.get("inicio", {}))
	
	if tutorial_rooms and "tutorial_salas" in tutorial_rooms:
		_tutorial_salas = tutorial_rooms.tutorial_salas

	if _salas.is_empty():
		printerr("Erro! O dicionário de salas principal está vazio.")

func set_player(player_node: Node) -> void:
	_player = player_node
	if not _player:
		printerr("CommandProcessor: Referência do Player recebida é nula.")

func set_tutorial_mode(is_tutorial: bool) -> void:
	_usar_tutorial = is_tutorial

func _get_active_dictionary() -> Dictionary:
	if _usar_tutorial:
		return _tutorial_salas
	return _salas

# ----------------------------------------------------------------------
# ✅ Lógica Central: Obtém descrição longa ou curta e registra a visita.
# ----------------------------------------------------------------------
func get_room_description_by_status(room_id: String) -> Dictionary:
	if not _player:
		printerr("Erro: Player não definido no CommandProcessor.")
		return {}

	# SEGURANÇA: Garante que salas_visitadas é um Array válido.
	if not is_instance_valid(_player.salas_visitadas) or typeof(_player.salas_visitadas) != TYPE_ARRAY:
		_player.salas_visitadas = []

	var salas_ativas = _get_active_dictionary()
	
	if not salas_ativas.has(room_id):
		printerr("Erro: Tentativa de buscar sala inexistente: %s" % room_id)
		return {}

	# 1. Pega os dados completos da sala (Texto LONGO por padrão)
	var room_data = salas_ativas[room_id].duplicate()
	
	var is_visited = _player.salas_visitadas.has(room_id)

	# 2. Se a sala NUNCA foi visitada:
	if not is_visited:
		_player.salas_visitadas.append(room_id)
		return room_data 
		
		
	if _salas_resumidas.has(room_id):
		var resume_entry = _salas_resumidas[room_id]
		
		
		if "DescricaoResumida" in resume_entry:
			room_data.Descricao = resume_entry.DescricaoResumida
		

	# Retorna a descrição (agora com o texto de DescricaoResumida, se a substituição ocorreu).
	return room_data

func process_command(input_text: String) -> Dictionary:
	if not _player:
		return { "type": ResultType.MESSAGE, "message": "ERRO CRÍTICO: Player não definido." }
		
	var comando_limpo = input_text.strip_edges().to_lower()
	var palavras = comando_limpo.split(" ", false)

	if palavras.is_empty():
		return { "type": ResultType.MESSAGE, "message": "" }

	var primeira_palavra = palavras[0]

	match primeira_palavra:
		
		"n", "norte":
			return _mover("norte")
		"s", "sul":
			return _mover("sul")
		"l", "leste":
			return _mover("leste")
		"o", "oeste":
			return _mover("oeste")
		"c", "cima", "subir":
			return _mover("cima")
		"b", "baixo", "descer":
			return _mover("baixo")
		"v", "ver", "olhar":
			return _ver_sala()
		"desc":	
			return _ver_descricao_completa() # ✅ Comando para descrição COMPLETA
		"limpar", "clear":
			return _clear()
		"ajuda":
			return { "type": ResultType.META, "command": "help", "message": _help() }
		"salvar":
			return { "type": ResultType.META, "command": "save", "message": "Jogo salvo." }
		"carregar":
			return { "type": ResultType.META, "command": "load", "message": "Jogo carregado." }
		"menu":	
			return { "type": ResultType.META, "command": "menu", "message": "Retornando ao menu principal." }
		_:
			return { "type": ResultType.MESSAGE, "message": "Comando não reconhecido." }

# ----------------------------------------------------------------------
# ✅ Comando 'ver'/'olhar' (Retorna sempre o texto COMPLETO)
# ----------------------------------------------------------------------
func _ver_sala() -> Dictionary:
	var salas_ativas = _get_active_dictionary()
	
	# Pega os dados COMPLETOS, ignorando o status de visita para este comando.
	var sala_atual = salas_ativas[_player.localizacao]
	
	# Garante que a sala seja marcada como visitada.
	if not _player.salas_visitadas.has(_player.localizacao):
		_player.salas_visitadas.append(_player.localizacao)
	
	return {
		"type": ResultType.ROOM,
		"room": sala_atual,
		"message": "Você examina atentamente o seu redor."
	}
	
# ----------------------------------------------------------------------
# ✅ Comando 'desc' (Alias para o texto COMPLETO)
# ----------------------------------------------------------------------
func _ver_descricao_completa() -> Dictionary:
	# Reutiliza a lógica de _ver_sala, garantindo o texto completo.
	return _ver_sala()

# ----------------------------------------------------------------------
# ✅ _mover (Retorna ID para que o GameManager possa buscar o resumo/completo)
# ----------------------------------------------------------------------
func _mover(direcao: String) -> Dictionary:
	var salas_ativas = _get_active_dictionary()
	var sala_atual = salas_ativas[_player.localizacao]
	var saidas = sala_atual["Saidas"]

	if saidas.has(direcao):
		var proxima_sala_id = saidas[direcao]
		
		_player.localizacao = proxima_sala_id
		
		var mensagem_saida = ""
		match direcao:
			"cima":
				mensagem_saida = "Você sobe."
			"baixo":
				mensagem_saida = "Você desce."
			"norte", "sul", "leste", "oeste":
				mensagem_saida = "Você vai para o " + direcao + "."
			_:
				mensagem_saida = "Você avança."
		
		# Retorna o ID da sala e a mensagem de saída.
		return {
			"type": ResultType.ROOM,
			"room_id": _player.localizacao,
			"message": mensagem_saida
		}
	else:
		return {
			"type": ResultType.MESSAGE,
			"message": "Você não pode ir nessa direção."
		}

func _clear() -> Dictionary:
	return {
			"type": ResultType.META,
			"command": "clear",
			"message": ""
		}

func _help() -> String:
	return """[b]Comandos de movimento:[/b]
	- [b]norte[/b] (ou [b]n[/b])
	- [b]sul[/b] (ou [b]s[/b])
	- [b]leste[/b] (ou [b]l[/b])
	- [b]oeste[/b] (ou [b]o[/b])
	- [b]cima[/b] (ou [b]c[/b], [b]subir[/b])
	- [b]baixo[/b] (ou [b]b[/b], [b]descer[/b])
[b]Outros comandos:[/b]
	- [b]menu[/b] voltar para o menu principal
	- [b]desc[/b] para ler a descrição completa novamente
	- [b]ver[/b] ([b]v[/b] ou [b]olhar[/b])
	- [b]ajuda[/b]
	- [b]salvar[/b]
	- [b]carregar[/b]"""
