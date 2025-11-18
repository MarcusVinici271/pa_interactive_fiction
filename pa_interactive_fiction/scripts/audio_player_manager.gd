# AudioPlayerManager.gd
extends AudioStreamPlayer

# Dicionário que mapeia nomes de sala (strings) para arquivos de áudio (.ogg, .wav)
# Você precisará preencher isso no Inspetor ou no _ready.
@export var audio_por_sala: Dictionary = {
	"inicio": preload("res://assets/audio/inicio.ogg"),
	"santuario_tisadya": preload("res://assets/audio/santuario_tisadya.ogg"),
	"aposentos_eleyren": preload("res://assets/audio/aposentos_eleyren.ogg"),
	"cemiterio": preload("res://assets/audio/cemiterio.ogg"),
	"mausoleu_bezeit": preload("res://assets/audio/mausoleu_bezeit.ogg"),
	"lugar_escuro": preload("res://assets/audio/lugar_escuro.ogg"),
	"jardim_santuario": preload("res://assets/audio/jardim_santuario.ogg"),
	"praca_central": preload("res://assets/audio/praca_central.ogg"),
	"calice_sagrado": preload("res://assets/audio/calice_sagrado.ogg"),
	"estoque_taverna": preload("res://assets/audio/estoque_taverna.ogg"),
	"estalagem": preload("res://assets/audio/estalagem.ogg"),
	"rua_principal_13": preload("res://assets/audio/rua_principal_13.ogg"),
	"forja_thovak": preload("res://assets/audio/forja_thovak.ogg"),
	"aposento_thovak": preload("res://assets/audio/aposento_thovak.ogg"),
	"loja_armadura": preload("res://assets/audio/loja_armadura.ogg"),
	"portao_leste_19": preload("res://assets/audio/portao_leste_19.ogg"),
	"rua_principal_14": preload("res://assets/audio/rua_principal_14.ogg"),
	"portao_sul": preload("res://assets/audio/portao_sul.ogg"),
	"posto_milicia": preload("res://assets/audio/posto_milicia.ogg"),
	"aposento_jaffer": preload("res://assets/audio/aposento_jaffer.ogg"),
	"aposento_guarda": preload("res://assets/audio/aposento_guarda.ogg"),
	"treinamento_milicia": preload("res://assets/audio/treinamento_milicia.ogg"),
	"rua_principal_15": preload("res://assets/audio/rua_principal_15.ogg"),
	"prisao_milicia": preload("res://assets/audio/prisao_milicia.ogg"),
	"recanto_alquimista": preload("res://assets/audio/recanto_alquimista.ogg"),
	"portao_oeste_27": preload("res://assets/audio/portao_oeste_27.ogg"),
	"travessa_oeste_28": preload("res://assets/audio/travessa_oeste_28.ogg"),
	"travessa_oeste_29": preload("res://assets/audio/travessa_oeste_29.ogg"),
	"travessa_oeste_30": preload("res://assets/audio/travessa_oeste_30.ogg"),
	"casa_golirin": preload("res://assets/audio/casa_golirin.ogg"),
	
}

# ----------------------------------------------------
# ⚠️ IMPORTANTE: Chame esta função a partir do seu GameManager
# ----------------------------------------------------
func tocar_audio_da_sala(nome_da_sala: String):
	# 1. Tenta encontrar o áudio para a sala
	print("Tentando tocar áudio para sala: ", nome_da_sala)
	if audio_por_sala.has(nome_da_sala):
		var novo_audio = audio_por_sala[nome_da_sala]
		
		# 2. Verifica se o áudio já está tocando e se é o mesmo (para evitar recomeçar)
		if stream == novo_audio and playing:
			return
			
		# 3. Troca o áudio e toca
		stop() # Para o áudio atual (do ambiente anterior)
		stream = novo_audio
		play()
		
	else:
		print("—> ERRO: Chave ", nome_da_sala, " não encontrada no dicionário.")
		# Se não houver áudio para esta sala, pare qualquer áudio em execução.
		stop()
		
func parar_audio():
	if playing:
		stop()
