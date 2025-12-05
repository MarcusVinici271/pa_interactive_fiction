extends Resource

@export var tutorial_salas: Dictionary = {
	"tutorial_inicio": {
		"Nome": "Bem-vindo ao Treinamento (Sala 1/4)",
		"Descricao": "Este é o seu ponto de partida. [b]COMO JOGAR:[/b] Digite comandos simples como 'leste' e irá se movimentar pelo mapa.",
		"DescricaoSaidas": "Você vê uma saída ao [b]leste[/b].",
		"Saidas": { "leste": "tutorial_movimento" }
	},
	"tutorial_movimento": {
		"Nome": "Navegação (Sala 2/4)",
		"Descricao": "Você se moveu! A base do jogo é totalmente textual, então se prepare para ler bastante. Coisas importantes podem ser ditas então preste bem a atenção nas descrições disponiveis.",
		"DescricaoSaidas": "Há uma saída para [b]oeste[/b] e uma para [b]norte[/b].",
		"Saidas": { 
			"oeste": "tutorial_inicio",
			"norte": "tutorial_ajuda" 
		}
	},
	"tutorial_ajuda": {
		"Nome": "Pedindo Ajuda (Sala 3/4)",
		"Descricao": "Você sempre poderá pedir ajuda para lembrar dos comandos necessários. Digite [b]'ajuda'[/b] para obter a lista de comandos disponíveis",
		"DescricaoSaidas": "Há uma saída para [b]oeste[/b] e uma para [b]norte[/b].",
		"Saidas": { 
			"oeste": "tutorial_movimento",
			"norte": "tutorial_final" 
		}
	},
	"tutorial_final": {
	"Nome": "Fim do Treinamento (Sala 4/4)",
	"Descricao": "Parabéns! Você completou o tutorial. Esperamos muito que curta essa aventura em desenvolvimento!!!",
	"DescricaoSaidas": "[b]Para começar a aventura principal, digite: INICIO[/b].",
	"Saidas": {} 
}
}
