extends Resource

@export var salas_resumidas: Dictionary = {
	"inicio": {
		"Nome": "Enfermaria do Santuário de Tisadya",
		"DescricaoResumida": "TESTE SUCESSO! SEGUNDA VISITA ATIVADA. Você pode digitar 'desc' para o texto completo.",
		"DescricaoSaidas": "Ao [b]leste[/b] você vê uma porta de madeira que leva ao santuário.",
		"Saidas": { "leste": "santuario_tisadya" }
	},
	"santuario_tisadya": {
		"Nome": "Santuário de Tisadya ",
		"DescricaoResumida": "Você está de volta ao santuário. O chão de lajotas gastas leva aos bancos e ao altar de pedra onde se ergue a estátua de Tisadya. Pequenas oferendas dos fiéis ainda estão dispostas aos pés da imagem.",
		"DescricaoSaidas": "Ao [b]oeste[/b] você vê uma porta de madeira que leva à enfermaria.[br]Ao [b]norte[/b] há um portal ogival que leva ao cemitério.[br]Ao [b]sul[/b] há um portal que leva para o jardim do santuário.[br]Ao [b]leste[/b] há uma porta de madeira que leva aos aposentos de Éleyren.",
		"Saidas": {
			"norte": "cemiterio",
			"sul": "jardim_santuario",
			"leste": "aposentos_eleyren",
			"oeste": "inicio"
		}
	},
	"aposentos_eleyren": {
		"Nome": "Aposento de Éleyren",
		"DescricaoResumida": "O aposento de Éleyren, com o cheiro suave de ervas e incenso misturado ao pergaminho. A luz aqui é fraca, vinda de uma única vela e de uma estreita fresta na parede. O quarto contém uma cama e um baú de madeira. No nicho da parede, repousa uma estátua em miniatura de Tisadya.",
		"DescricaoSaidas": "Ao [b]oeste[/b] uma porta de mandeira leva de volta ao Santuário.",
		"Saidas": { "oeste": "santuario_tisadya" }
	},
	"cemiterio": {
		"Nome": "Cemitério",
		"DescricaoResumida": "O ar frio envolve o cemitério murado, onde o vento e os corvos quebram o silêncio. As lápides de pedra e cobertas de líquen pontilham a grama alta. Ao fundo, o mausoléu com sua porta de ferro enferrujada domina o muro norte.",
		"DescricaoSaidas": "Ao fundo, contra o muro [b]norte[/b], ergue-se um mausoléu de pedra, sua porta de ferro pesada e enferrujada.[br]No muro ao [b]leste[/b] se vê uma fenda na parte de baixo, suficiente para passar uma pessoa.[br]Ao [b]sul[/b] há um portal ogival que leva ao Santuário.",
		"Saidas": {
			"leste": "lugar_escuro",
			"norte": "mausoleu_bezeit",
			"sul": "santuario_tisadya"
		}
	},
	"lugar_escuro": {
		"Nome": "Lugar Escuro",
		"DescricaoResumida": "Você está de volta ao beco escuro e sem saída. O espaço é apertado entre o muro do cemitério e a parede do armazém, cheio de barris e sacos quebrados. A lamparina enferrujada mal ilumina a figura de Toyol, que continua afiando sua adaga, encostado na parede.",
		"DescricaoSaidas": "No muro ao [b]oeste[/b] se vê a fenda que dá para o cemitério.",
		"Saidas": { "oeste": "cemiterio" }
	},
	"mausoleu_bezeit": {
		"Nome": "Mausoléu do Patriarca Bezeit",
		"DescricaoResumida": "Você retorna ao pequeno cômodo octogonal do mausoléu. O ar é pesado e frio, com cheiro de mofo. No centro, repousa o grande sarcófago. Na parede oposta à entrada, o brasão da família Bezeit está coberto de teias.",
		"DescricaoSaidas": "Lá fora, ao [b]sul[/b], está o cemitério.",
		"Saidas": {
			"sul": "cemiterio",
			"baixo": "catacumbas_secretas"
		}
	},
	"catacumbas_secretas": {
		"Nome": "Catacumbas Secretas",
		"DescricaoResumida": "As catacumbas existentes sob a Vila Boeka.",
		"DescricaoSaidas": "É poissível [b]subir[/b] para o mausoléu.",
		"Saidas": { "cima": "mausoleu_bezeit" }
	},
	"jardim_santuario": {
		"Nome": "Jardim do Santuário",
		"DescricaoResumida": "Você está no pequeno pátio murado que serve de entrada para o santuário. O espaço é dominado pelos canteiros cheios de ervas e plantas medicinais crescendo de forma organizada. Contra o muro oeste, um banco te convida ao descanso.",
		"DescricaoSaidas": "Ao [b]norte[/b], um portal ogival leva para dentro do Santuário de Tisadya.[br]Ao [b]sul[/b], um portão de madeira simples, mas robusto, leva à praça central da vila.",
		"Saidas": {
			"norte": "santuario_tisadya",
			"sul": "praca_central"
		}
	},
	"praca_central": {
		"Nome": "Praça Central",
		"DescricaoResumida": "Você está no coração da vila Boeka, um espaço aberto de terra batida onde o ar vibra com o som das vozes e atividades. O elemento central é o poço de pedra, cuja borda está gasta pelo uso constante das cordas.",
		"DescricaoSaidas": "Ao [b]norte[/b], você vê o portão de madeira simples que leva ao Jardim do Templo.[br]A saída [b]leste[/b] da rua principal leva em direção ao som do martelar de um ferreiro.[br]A saída [b]oeste[/b] da rua principal leva em direção ao que parece uma loja de alquimia.[br]Ao [b]sul[/b] da praça é possível ver um edifício de madeira: a taverna Cálice Sagrado.",
		"Saidas": {
			"norte": "jardim_santuario",
			"sul": "calice_sagrado",
			"leste": "rua_principal_13",
			"oeste": "rua_principal_14"
		}
	},
	"calice_sagrado": {
		"Nome": "Taverna Cálice Sagrado",
		"DescricaoResumida": "O ar quente e enfumaçado da taverna, misturado ao cheiro de hidromel e gordura, atinge você. O salão é barulhento, com conversas e a música desafinada do bardo sonolento. Mesas manchadas estão espalhadas, e Befur, o taverneiro, limpa canecas atrás do balcão. O Cálice Sagrado está sobre a lareira crepitante.",
		"DescricaoSaidas": "A porta principal ao [b]norte[/b] leva de volta à praça central.[br]Há um pequeno alçapão no chão, atrás do balcão, por onde é possível [b]descer[/b].[br]Há uma escada de madeira [b]subindo[/b] pela lateral, ao lado do balcão.",
		"Saidas": {
			"norte": "praca_central",
			"cima": "estalagem",
			"baixo": "estoque_taverna"
		}
	},
	"estoque_taverna": {
		"Nome": "Estoque da Taverna",
		"DescricaoResumida": "Você está de volta ao estoque. O chão de pedra grudento e as estantes vazias dão um ar de abandono. Caixas soltas e cobertas por teias de aranha estão empilhadas no centro, e um canto de dormir improvisado está parcialmente escondido nos fundos.",
		"DescricaoSaidas": "Acima há um alçapão, acessível por uma escadinha, por onde é possível [b]subir[/b] de volta ao salão da taverna.",
		"Saidas": { "cima": "calice_sagrado" }
	},
	"estalagem": {
		"Nome": "Aposento para pernoitar",
		"DescricaoResumida": "O barulho da taverna ainda é audível aqui. O quarto é pequeno e quase todo ocupado pela cama, com seu colchão irregular. Uma cômoda ao lado sustenta a bacia e a jarra de água. A única janela deixa entrar uma luz cinzenta.",
		"DescricaoSaidas": "Uma porta leva de volta à escada por onde é possível [b]descer[/b] ao salão da taverna.",
		"Saidas": { "baixo": "calice_sagrado" }
	},
	"rua_principal_13": {
		"Nome": "Rua Principal",
		"DescricaoResumida": "Você está na principal rua de comércio. O ambiente é dominado pelo barulho e calor da forja de frente aberta ao norte. Diretamente ao sul, a loja de armaduras, identificada pela placa do elmo e peitoral, chama a atenção. A Praça Central está a oeste.",
		"DescricaoSaidas": "Ao [b]norte[/b], você vê a fonte do barulho: uma forja de frente aberta, de onde sai o brilho de um forno e o clang de metal contra metal.[br]Ao [b]sul[/b], diretamente oposta à forja, há um edifício robusto de madeira com uma placa de um elmo e um peitoral pintados de forma grosseira: uma loja de armaduras.[br]A rua continua mais para [b]leste[/b] em direção ao Portão Leste.[br]A Praça Central fica a [b]oeste[/b].",
		"Saidas": {
			"norte": "forja_thovak",
			"sul": "loja_armadura",
			"leste": "portao_leste_19",
			"oeste": "praca_central"
		}
	},
	"forja_thovak": {
		"Nome": "A Forja de Thorvak",
		"DescricaoResumida": "Você está na forja . A bigorna maciça domina o centro, e a fornalha incandescente irradia calor intenso. As paredes estão cheias de ferramentas e peças de metal. Thorvak, o ferreiro anão, está ao lado da bigorna, limpando o suor.",
		"DescricaoSaidas": "A saída é ao [b]sul[/b], levando de volta à Rua Principal.[br]Existe uma escada que permite [b]subir[/b].",
		"Saidas": {
			"cima": "aposento_thovak",
			"sul": "rua_principal_13"
		}
	},
	"aposento_thovak": {
		"Nome": "Aposento de Thorvak",
		"DescricaoResumida": "Você entra no aposento de Thorvak, escuro de fuligem. A cama baixa e larga, coberta por peles, ocupa o espaço. Um caixote virado serve de mesa. O aposento contém um baú pesado reforçado com ferro e um suporte vazio na parede, feito para um grande machado.",
		"DescricaoSaidas": "É possível [b]descer[/b] pela escada, de volta à Forja de Thorvak.",
		"Saidas": { "baixo": "forja_thovak" }
	},
	"loja_armadura": {
		"Nome": "Loja de Armaduras de Gor-Noj",
		"DescricaoResumida": "As batidas em ritmo da forja são ouvidas e o cheiro forte de couro e óleo domina o ar. O lugar está abarrotado com peças de armadura penduradas em vigas e espalhadas por prateleiras e mesas. Gor-Noj, está atrás do balcão, polindo um escudo de metal, e levanta os olhos para você.",
		"DescricaoSaidas": "A porta ao [b]norte[/b] leva de volta à Rua Principal.",
		"Saidas": { "norte": "rua_principal_13" }
	},
	"portao_leste_19": {
		"Nome": "Portão Leste",
		"DescricaoResumida": "Você está no final da rua principal, onde a alta paliçada de madeira cerca a vila. O Portão Leste, está entreaberto. O guarda humano Beder está no lado norte e a guarda anã Nirja no lado sul. A plataforma de vigia está acima, e o caminho de terra se estende para o leste.",
		"DescricaoSaidas": "A rua principal se estende para [b]oeste[/b], de volta ao coração da vila.[br]O caminho de terra batida a [b]leste[/b] continua para fora da vila.",
		"Saidas": {
			"leste": "caminho_para_mina",
			"oeste": "rua_principal_13"
		}
	},
	"caminho_para_mina": {
		"Nome": "Caminho para a Mina",
		"DescricaoResumida": "Um pequeno trecho que leva para as minas abandonadas de Boeka.",
		"DescricaoSaidas": "Você pode voltar pelo portao da vila a [b]oeste[/b], ou entrar na mina ao [b]norte[/b].",
		"Saidas": {
			"norte": "mina_abandonada",
			"oeste": "portao_leste_19"
		}
	},
	"mina_abandonada": {
		"Nome": "Mina Abandonada",
		"DescricaoResumida": "Apenas seguindo o mapa.",
		"DescricaoSaidas": "Corredores superiores diga [b]subir[/b], ou [b]descer[/b] para corredores inferiores. A saida está ao [b]sul[/b].",
		"Saidas": {
			"cima": "corredores_superiores_mina",
			"baixo": "corredores_inferiores_mina",
			"sul": "caminho_para_mina"
		}
	},
	"corredores_superiores_mina": {
		"Nome": "Corredores Superiores",
		"DescricaoResumida": "Onde os monstros residem, podemos fazer um pequeno labirinto.",
		"DescricaoSaidas": "Para voltar é só [b]descer[/b].",
		"Saidas": { "baixo": "mina_abandonada" }
	},
	"corredores_inferiores_mina": {
		"Nome": "Corredores Inferiores",
		"DescricaoResumida": "Onde os monstros residem, podemos por um item.",
		"DescricaoSaidas": "Para voltar é só [b]subir[/b].",
		"Saidas": { "cima": "mina_abandonada" }
	},
	"rua_principal_14": {
		"Nome": "Rua Principal",
		"DescricaoResumida": "Você está de volta à Rua Principal usada para logística. Ao norte, ergue-se o Posto da Milícia, um edifício robusto com a bandeira da vila. Ao sul, há apenas mato alto e as ruínas de um armazém, de onde parte um caminho estreito para o Portão Sul.",
		"DescricaoSaidas": "A praça central fica a [b]leste[/b].[br]A rua continua para [b]oeste[/b], levando à seção final da rua principal.[br]Ao [b]sul[/b] um caminho mais estreito corre em direção ao Portão Sul.[br]Ao [b]norte[/b] há uma porta que leva ao Posto da Milícia.",
		"Saidas": {
			"norte": "posto_milicia",
			"sul": "portao_sul",
			"leste": "praca_central",
			"oeste": "rua_principal_15"
		}
	},
	"portao_sul": {
		"Nome": "Portão Sul",
		"DescricaoResumida": "O Portão Sul, uma estrutura imponente de madeira e ferro que parece estar permanentemente fechada. O cheiro de piche e mofo paira no ar. O arqueiro Elnor está na vigia, e a maga Kel está ao lado, observando o caminho além do portão.",
		"DescricaoSaidas": "Através das frestas e da torre de vigia, você pode ver a estrada [b]sul[/b], um caminho que rapidamente se torna sombrio, flanqueado por árvores retorcidas e uma névoa rasteira que parece pairar mesmo sob o sol.[br]Ao [b]norte[/b], o caminho leva de volta à Rua Principal.",
		"Saidas": { "norte": "rua_principal_14" }
	},
	"posto_milicia": {
		"Nome": "Posto da Milícia",
		"DescricaoResumida": "O Posto da Milícia, com um mapa grande e marcado, está estendido sobre a mesa central. Estandes com armas , lanças e escudos estão nas paredes. O Capitão Jaffer observa o movimento de sua mesa no canto oeste.",
		"DescricaoSaidas": "Uma porta de madeira simples a [b]oeste[/b] parece levar a um escritório particular.[br]Uma arcada larga a [b]leste[/b] leva a uma área com piso de terra batida, de onde vêm sons de esforço físico.[br]Uma porta ao [b]norte[/b], entreaberta, parece ser um local para a guarda dormir.[br]No canto sudeste, um alçapão de madeira pesada com um anel de ferro dá acesso ao subsolo ([b]descer[/b]).[br]A porta principal ao [b]sul[/b] leva de volta à Rua Principal.",
		"Saidas": {
			"norte": "aposento_guarda",
			"sul": "rua_principal_14",
			"leste": "treinamento_milicia",
			"oeste": "aposento_jaffer",
			"baixo": "prisao_milicia"
		}
	},
	"aposento_jaffer": {
		"Nome": "Aposento de Jaffer",
		"DescricaoResumida": "Você entra no quarto de Jaffer. O lugar é funcional: uma cama de campanha, com seu cobertor dobrado com precisão militar, e um baú pessoal aos pés. Uma janela gradeada e um suporte de armas vazio chamam a atenção.",
		"DescricaoSaidas": "A única porta, a [b]leste[/b], leva de volta ao Posto da Milícia.",
		"Saidas": { "leste": "posto_milicia" }
	},
	"aposento_guarda": {
		"Nome": "Aposento da Guarda",
		"DescricaoResumida": "O dormitório é quente e abafado, com forte cheiro de suor e couro velho. O espaço está abarrotado com seis beliches desarrumados e baús pessoais por baixo. No centro, uma mesa está coberta por canecas e migalhas, e roupas sujas estão jogadas no chão.",
		"DescricaoSaidas": "A única porta, ao [b]sul[/b], leva de volta ao Posto da Milícia.",
		"Saidas": { "sul": "posto_milicia" }
	},
	"treinamento_milicia": {
		"Nome": "Sala de Treinamento",
		"DescricaoResumida": "Você retorna ao pátio de armas, com o chão de terra batida e boa ventilação. O foco está nos três bonecos de treino de palha, visivelmente esfarrapados pelos golpes. Um rack de armas na parede contém espadas cegas e escudos de prática.",
		"DescricaoSaidas": "A arcada a [b]oeste[/b] leva de volta ao salão principal do Posto da Milícia.",
		"Saidas": { "oeste": "posto_milicia" }
	},
	"prisao_milicia": {
		"Nome": "Prisão",
		"DescricaoResumida": "O ar é frio, parado e fétido, com o teto baixo gotejando. A lamparina lança sombras distorcidas na prisão da vila. Duas celas robustas de ferro enferrujado ocupam a parede norte. O resto do espaço está cheio de barris velhos e caixas quebradas, e uma mesa marca o posto de guarda vazio.",
		"DescricaoSaidas": "A única saída é a escada de pedra que permite [b]subir[/b] de volta ao Posto da Milícia.",
		"Saidas": { "cima": "posto_milicia" }
	},
	"rua_principal_15": {
		"Nome": "Rua Principal",
		"DescricaoResumida": "Você está na seção final da Rua Principal. Ao sul, a pequena loja do Recanto da Alquimista se destaca. A fumaça roxa pálida saindo da chaminé a identificam.",
		"DescricaoSaidas": "Ao [b]norte[/b], um caminho de cascalho mais estreito se afasta da rua principal, ladeado por algumas casas simples. Uma placa de rua simples diz Travessa Oeste.[br]A [b]oeste[/b], a rua termina no Portão Oeste, uma estrutura de madeira robusta que parece ser o limite da vila nessa direção.[br]A [b]leste[/b], a rua principal leva de volta à área do Posto da Milícia.[br]Ao [b]sul[/b] há o Recanto da Alquimista.",
		"Saidas": {
			"norte": "travessa_oeste_28",
			"sul": "recanto_alquimista",
			"leste": "rua_principal_14",
			"oeste": "portao_oeste_27"
		}
	},
	"recanto_alquimista": {
		"Nome": "Recanto da Alquimista",
		"DescricaoResumida": "O seu nariz formiga com uma mistura de enxofre, minerais e pétalas. O local possui frascos, potes e sacos nas prateleiras do chão ao teto, iluminados pelo brilho verde pálido da lâmpada. Um alambique de cobre borbulha suavemente nos fundos. Gólirin, a elfa alquimista, está ajustando uma válvula. Se lembre: Não toque em nada.",
		"DescricaoSaidas": "A porta ao [b]norte[/b] leva de volta à rua principal.",
		"Saidas": { "norte": "rua_principal_15" }
	},
	"portao_oeste_27": {
		"Nome": "Portão Oeste",
		"DescricaoResumida": "Você está no limite oeste da vila. O Portão Oeste, foi deixado aberto. O guarda Varten está postado, agindo como vigia. Através do portão, você vê a clareira antes que a estrada desapareça na escuridão da Floresta Lethien.",
		"DescricaoSaidas": "A estrada segue para o [b]oeste[/b], em direção ao perímetro dos lenhadores.[br]A Rua Principal se estende para [b]leste[/b], de volta à vila.",
		"Saidas": {
			"oeste": "perimetro_lenhadores",
			"leste": "rua_principal_15"
		}
	},
	"travessa_oeste_28": {
		"Nome": "Travessa Oeste",
		"DescricaoResumida": "A rua é um caminho tranquilo e residencial de cascalho. O barulho da rua principal e das lojas parece distante. As casas são pequenas, feitas de madeira e pau-a-pique, com pequenos jardins frontais.",
		"DescricaoSaidas": "Ao [b]sul[/b], o caminho de cascalho leva de volta à rua principal.[br]A [b]oeste[/b], você vê a porta de uma pequena casa de madeira com uma janela escura.[br]A travessa continua para o [b]norte[/b].",
		"Saidas": {
			"norte": "travessa_oeste_29",
			"oeste": "npc_28",
			"sul": "rua_principal_15"
		}
	},
	"npc_28": {
		"Nome": "Casa NPC",
		"DescricaoResumida": "Apenas uma futura casa de npc.",
		"DescricaoSaidas": "Para voltar [b]leste[/b].",
		"Saidas": { "leste": "travessa_oeste_28" }
	},
	"travessa_oeste_29": {
		"Nome": "Travessa Oeste",
		"DescricaoResumida": "Você volta para o caminho tranquilo de cascalho. A casa ao leste se destaca das outras: a madeira tratada e a pintura fresca da porta mostram cuidado, e pequenos vasos de ervas florescem na janela.",
		"DescricaoSaidas": "A travessa continua para [b]oeste[/b], em direção a um casarão que se vê ao longe.[br]A travessa continua para o [b]sul[/b], em direção a mais casas.[br]A casa de Gólirin, a elfa, está ao [b]leste[/b].[br]Ao [b]norte[/b] vê-se a casa de algum aldeão.",
		"Saidas": {
			"norte": "npc_29",
			"sul": "travessa_oeste_28",
			"oeste": "travessa_oeste_30",
			"leste": "casa_golirin"
		}
	},
	"npc_29": {
		"Nome": "Casa NPC",
		"DescricaoResumida": "A futura casa de alguem.",
		"DescricaoSaidas": "Para voltar ao [b]sul[/b].",
		"Saidas": { "sul": "travessa_oeste_29" }
	},
	"casa_golirin": {
		"Nome": "Casa Gólirin",
		"DescricaoResumida": "O chão de madeira reflete a luz da janela. O ambiente é composto por uma estante cheia de pergaminhos, uma cama com lençois e uma mesa ao centro. Aos pés da cama, um baú de madeira escura tem entalhes élficos.",
		"DescricaoSaidas": "Para voltar digite [b]oeste[/b].",
		"Saidas": { "oeste": "travessa_oeste_29" }
	},
	"travessa_oeste_30": {
		"Nome": "Travessa Oeste",
		"DescricaoResumida": "Você chega ao pátio de pedra varrido no final da Travessa Oeste. O ar é calmo em frente à estrutura residencial mais imponente da vila, que projeta uma longa sombra. O portão de ferro é flanqueado por dois guardas da milícia, que parecem tensos no posto.",
		"DescricaoSaidas": "A [b]leste[/b], a rua continua de volta à área residencial.[br]A [b]oeste[/b], bloqueando o caminho, ergue-se o Casarão Bezeit.",
		"Saidas": {
			"leste": "travessa_oeste_29",
			"oeste": "casarao_bezeit"
		}
	},
	"casarao_bezeit": {
		"Nome": "Casarão Bezeit",
		"DescricaoResumida": "A maior casa da vila, onde mora a familia Bezeit, que remonta aos fundadores de Boeka.",
		"DescricaoSaidas": "Volte ao [b]leste[/b].",
		"Saidas": { "leste": "travessa_oeste_30" }
	},
	"perimetro_lenhadores": {
		"Nome": "Perímetro dos Lenhadores",
		"DescricaoResumida": "Diversos tocos de árvores e pedaços de troncos organizados em pilhas.",
		"DescricaoSaidas": "Ao [b]norte[/b] está a cabana de Medel.[br]Ao [b]leste[/b] fica o portão oeste da vila.[br]Ao [b]oeste[/b] se estende a Floresta Lethien.",
		"Saidas": {
			"norte": "cabana_medel",
			"leste": "portao_oeste_27",
			"oeste": "floresta_lethien"
		}
	},
	"cabana_medel": {
		"Nome": "Cabana de Medel, o lenhador",
		"DescricaoResumida": "Ele corta lenha.",
		"DescricaoSaidas": "Volte ao [b]sul[/b].",
		"Saidas": { "sul": "perimetro_lenhadores" }
	},
	"floresta_lethien": {
		"Nome": "Entrada da floresta Lethien",
		"DescricaoResumida": "Entrada da floresta.",
		"DescricaoSaidas": "Pode-se voltar, ao [b]leste[/b].",
		"Saidas": { "leste": "perimetro_lenhadores" }
	},
}
