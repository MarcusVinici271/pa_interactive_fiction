extends VBoxContainer

func set_text(input: String, title: String) -> void:
	# Define o histórico do input (ex: "> ir norte")
	%InputHistory.text = "> " + input
	
	# Define a resposta do jogo
	%Response.text = title
