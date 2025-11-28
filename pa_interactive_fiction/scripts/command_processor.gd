extends Node

enum ResultType { MESSAGE, ROOM, META }

@export var room_data: Resource


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
	
	if "salas_resumidas" in room_data:
		_salas_resumidas = room_data.salas_resumidas
	
	if "tutorial_salas" in room_data:
		_tutorial_salas = room_data.tutorial_salas

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

func get_room_data(room_id: String) -> Dictionary:
	var salas_ativas = _get_active_dictionary()
	if salas_ativas.has(room_id):
		return salas_ativas[room_id]
	printerr("Erro: Tentativa de buscar sala inexistente: %s" % room_id)
	return {}

func get_starting_room_data() -> Dictionary:
	if not _player:
		printerr("Erro! Player não foi definido no CommandProcessor.")
		return {}
		
	return get_room_data(_player.localizacao)

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
		"limpar", "clear":
			return _clear()
		"ajuda":
			return { "type": ResultType.MESSAGE, "message": _help() }
		"salvar":
			return { "type": ResultType.META, "command": "save", "message": "Jogo salvo." }
		"carregar":
			return { "type": ResultType.META, "command": "load", "message": "Jogo carregado." }
		_:
			return { "type": ResultType.MESSAGE, "message": "Comando não reconhecido." }

func _ver_sala() -> Dictionary:
	var salas_ativas = _get_active_dictionary()
	var sala_atual = salas_ativas[_player.localizacao]
	return {
		"type": ResultType.ROOM,
		"room": sala_atual,
		"message": ""
	}

func _mover(direcao: String) -> Dictionary:
	var salas_ativas = _get_active_dictionary()
	var sala_atual = salas_ativas[_player.localizacao]
	var saidas = sala_atual["Saidas"]

	if saidas.has(direcao):
		var proxima_sala_id = saidas[direcao]
		
		_player.localizacao = proxima_sala_id
		
		var nova_sala = salas_ativas[_player.localizacao]
		
		var mensagem_saida = ""
		
		match direcao:
			"cima":
				mensagem_saida = "Você sobe."
			"baixo":
				mensagem_saida = "Você desce."
			"norte", "sul", "leste", "oeste":
				mensagem_saida = "Você vai para o " + direcao + "."
			_:
				mensagem_saida = "Você vai para " + direcao + "."
		
		return {
			"type": ResultType.ROOM,
			"room": nova_sala,
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
	- [b]ver[/b] ([b]v[/b] ou [b]olhar[/b])
	- [b]ajuda[/b]
	- [b]salvar[/b]
	- [b]carregar[/b]"""
