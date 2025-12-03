extends Node

enum Raca {
	ELFO,
	ORC,
	HUMANO,
	ANAO
}

var nome: String = "Jogador"
var raca: Raca = Raca.HUMANO
var sexo: String = "Indefinido"
var idade: int = 20
var descricao: String = "Uma descrição genérica e breve."


var localizacao: String = "inicio"
var salas_visitadas: Array = []

func _ready():
	pass
