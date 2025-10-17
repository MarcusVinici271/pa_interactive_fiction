extends Control

var sala_id_atual = "cabana_aconchegante"

var SALAS = {
	"cabana_aconchegante": {
		"nome": "Cabana Aconchegante",
		"descricao": "Você está na aconchegante cabana, seu lar. Há uma porta de madeira ao norte e uma velha escrivaninha de carvalho a leste. O sol da manhã entra pela janela.",
		"saidas": {
			"norte": "clareira_ensolarada",
			"leste": "escrivaninha"
		}
	},
	
	"clareira_ensolarada": {
		"nome": "Clareira Ensolarada",
		"descricao": "Você sai da cabana e encontra um claro ensolarado. O cheiro de pinho está forte no ar. A cabana fica ao sul, e você vê uma trilha larga seguindo para o oeste.",
		"saidas": {
			"sul": "cabana_aconchegante",
			"oeste": "trilha_estreita"
		}
	},
	
	"trilha_estreita": {
		"nome": "Trilha Estreita",
		"descricao": "A trilha fica mais escura e estreita à medida que a floresta se fecha sobre você. Você ouve o som de água corrente à distância, ao norte. A clareira ensolarada está a leste.",
		"saidas": {
			"leste": "clareira_ensolarada",
			"norte": "cascata_escondida"
		}
	},
	
	"cascata_escondida": {
		"nome": "Cascata Escondida",
		"descricao": "Você chega a uma pequena cascata escondida, onde a água desce sobre rochas cobertas de musgo. Há um nicho sombrio atrás da água. A trilha continua, subindo íngreme, a oeste.",
		"saidas": {
			"sul": "trilha_estreita",
			"oeste": "topo_do_penhasco"
		}
	},

	"topo_do_penhasco": {
		"nome": "Topo do Penhasco",
		"descricao": "O vento chicoteia em seu rosto. Você está no topo de um penhasco rochoso, com uma vista deslumbrante da floresta abaixo. Você não pode ir mais longe a oeste ou norte.",
		"saidas": {
			"leste": "cascata_escondida",
		}
	}
}

var javascript_bridge_available = false

@onready var texto_principal = $VBoxContainer/TextoPrincipal
@onready var entrada_comando = $VBoxContainer/EntradaComando

func _ready():
	javascript_bridge_available = Engine.has_singleton("JavaScriptBridge")
	
	# Esta linha deve estar COMENTADA se a conexão foi feita via Editor.
	# entrada_comando.text_entered.connect(processar_entrada) 

	carregar_sala(sala_id_atual) 

func carregar_sala(novo_id: String):
	if SALAS.has(novo_id):
		sala_id_atual = novo_id
		var nova_sala = SALAS[novo_id]
		
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
	var sala_data = SALAS[sala_id_atual]
	
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
		
		if SALAS.has(id_destino):
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
	
	exibir_texto("\n> " + comando) 
	
	processar_comando(comando)
