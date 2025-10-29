extends Node
class_name mapa_salas

const SALAS = {
	"inicio": {
		"nome": "Cama",
		"descricao": "Esse é o inico de sua jornada. Para começar digite inicio",
		"saidas": {
			"inicio": "cabana_aconchegante",
		}
	},
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
