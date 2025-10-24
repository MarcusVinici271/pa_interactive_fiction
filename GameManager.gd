extends Control
const MAPA_SALAS_DADOS = preload("res://mapa_salas.gd")
const MAPA_DE_DADOS_SALAS = MAPA_SALAS_DADOS.SALAS


var sala_id_atual = "inicio"

var javascript_bridge_available = false

@onready var texto_principal = $VBoxContainer/TextoPrincipal
@onready var entrada_comando = $VBoxContainer/EntradaComando

func _ready():
	javascript_bridge_available = Engine.has_singleton("JavaScriptBridge")
	
	# Mantenha esta linha comentada, a conexão foi feita via Editor.
	# entrada_comando.text_entered.connect(processar_entrada) 

	carregar_sala(sala_id_atual) 

func carregar_sala(novo_id: String):
	if MAPA_DE_DADOS_SALAS.has(novo_id):
		sala_id_atual = novo_id
		var nova_sala = MAPA_DE_DADOS_SALAS[novo_id]
		
		var texto_completo = "--- " + nova_sala.nome + " ---\n" + nova_sala.descricao
		exibir_texto("\n" + texto_completo)
		falar_texto(nova_sala.nome + ". " + nova_sala.descricao)
		
	else:
		var erro = "Erro de mapa: Local " + novo_id + " não existe."
		exibir_texto(erro)
		falar_texto(erro)

func processar_entrada(texto: String):
	exibir_texto("\n> " + texto)
	processar_comando(texto)
	entrada_comando.clear()

func exibir_texto(texto: String):
	texto_principal.append_text(texto + "\n")
	texto_principal.scroll_to_line(texto_principal.get_line_count() - 1)

func processar_comando(comando: String):
	var comando_limpo = comando.to_lower().strip_edges()
	var palavras = comando_limpo.split(" ")
	var resposta = "Comando não reconhecido."
	var sala_data = MAPA_DE_DADOS_SALAS[sala_id_atual]
	
	var direcao = ""

	if palavras.size() == 1:
		if palavras[0] in sala_data.saidas:
			direcao = palavras[0]
		else:
			resposta = "Comando '" + palavras[0] + "' não reconhecido."
			exibir_texto(resposta)
			falar_texto(resposta)
			return

	elif palavras.size() >= 2:
		var verbo = palavras[0]
		var alvo = palavras[1]
		
		if verbo == "ir":
			if alvo in sala_data.saidas:
				direcao = alvo
			else:
				resposta = "Você não pode ir para " + alvo + "."
		
		elif verbo == "olhar" and alvo in sala_data.saidas:
			resposta = "Você olha para " + alvo + ". Está empoeirado."
		
		else:
			resposta = "Comando '" + verbo + " " + alvo + "' não reconhecido."
	
	if direcao != "":
		var id_destino = sala_data.saidas[direcao]
		
		if MAPA_DE_DADOS_SALAS.has(id_destino):
			carregar_sala(id_destino)
			return
		else:
			resposta = "Você não pode sair por " + id_destino + "."
			
	exibir_texto(resposta)
	falar_texto(resposta)

func falar_texto(texto: String):
	if javascript_bridge_available:
		var texto_limpo = texto.replace("'", "\\'") 
		JavaScriptBridge.eval("falar_texto('" + texto_limpo + "')") 
	else:
		pass

func iniciar_comando_voz():
	if javascript_bridge_available:
		JavaScriptBridge.eval("iniciar_escuta()")
	else:
		falar_texto("WebSpeech API não está disponível. Por favor, exporte para Web.")

func receber_comando_voz(comando: String):
	print("Comando de voz recebido do JS:", comando)
	
	if comando.length() > 0:
		exibir_texto("\n> " + comando)
		processar_comando(comando)
