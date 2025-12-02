extends Resource

@export var tutorial_salas: Dictionary = {
	"tutorial_inicio": {
		"Nome": "Bem-vindo ao Treinamento (Sala 1/3)",
		"Descricao": "Este é o seu ponto de partida. [b]COMO JOGAR:[/b] Digite comandos simples como 'ir [direção]' ou 'olhar'. Tente digitar 'ir leste'.",
		"DescricaoSaidas": "Você vê uma saída ao [b]leste[/b].",
		"Saidas": { "leste": "tutorial_movimento" }
	},
	"tutorial_movimento": {
		"Nome": "Navegação",
		"Descricao": "Você se moveu! Lembre-se: O ID desta sala é 'tutorial_movimento'. Tente digitar 'ir oeste' para voltar ou 'olhar' para ver o cômodo novamente.",
		"DescricaoSaidas": "Há uma saída para [b]oeste[/b] e uma para [b]norte[/b].",
		"Saidas": { 
			"oeste": "tutorial_inicio",
			"norte": "tutorial_final" 
		}
	},
	"tutorial_final": {
	"Nome": "Fim do Treinamento",
	"Descricao": "Parabéns! Você completou o tutorial.",
	"DescricaoSaidas": "[b]Para começar a aventura principal, digite: INICIO[/b].",
	"Saidas": {} 
}
}
