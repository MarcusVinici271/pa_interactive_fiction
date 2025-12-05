extends Resource

@export var salas: Dictionary = {
	"inicio": {
		"Nome": "Enfermaria do Santuário de Tisadya",
		"Descricao": "O cômodo é pequeno e simples, com paredes de alvenaria irregular. O ar é preenchido por um aroma calmante de ervas secas, lavanda e incenso suave. A luz é fraca, vinda de algumas velas de sebo e de uma pequena janela alta, próxima ao teto.[br][br]Três camas simples, feitas de palha e cobertas com linho áspero, estão dispostas no quarto. Ao lado de uma delas, há um banco de madeira gasto de três pernas. Em uma pequena prateleira na parede, repousam diversos frascos de barro etiquetados à mão e rolos de ataduras amareladas. Em um canto, há um pilão e ervas prontas para serem moídas.",
		"DescricaoSaidas": "Ao [b]leste[/b] você vê uma porta de madeira que leva ao santuário.",
		"Saidas": { "leste": "santuario_tisadya" }
	},
	"santuario_tisadya": {
		"Nome": "Santuário de Tisadya ",
		"Descricao": "O espaço é modesto e emana uma tranquilidade profunda. O teto é sustentado por vigas de madeira escura e áspera, e o chão é de lajotas de pedra gastas pelo tempo. Bancos de madeira simples, polidos pelo uso, estão alinhados em direção a um altar de pedra elevado. Atrás do altar, dominando o santuário, está a estátua de Tisadya. Pequenas oferendas, como fitas trançadas, flores silvestres e tigelas de grãos, estão dispostas aos pés da estátua, deixadas pelos poucos fiéis da vila.",
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
		"Descricao": "Um reflexo da personalidade prática da sacerdotisa, o aposento é pequeno e austero. O cheiro de ervas secas e incenso é mais suave aqui, misturado ao cheiro típico de pergaminho velho.[br][br]A luz é fraca, vinda de uma única vela sobre uma escrivaninha e de uma fresta estreita na parede de pedra, ao norte, que serve como janela. Em um canto há uma cama estreita com uma manta de lã dobrada. Um pequeno baú de madeira, sem adornos, fica aos pés dela. Na parede oposta à porta, um nicho raso foi cavado na pedra, contendo uma versão em miniatura, entalhada em madeira, de Tisadya.",
		"DescricaoSaidas": "Ao [b]oeste[/b] uma porta de mandeira leva de volta ao Santuário.",
		"Saidas": { "oeste": "santuario_tisadya" }
	},
	"cemiterio": {
		"Nome": "Cemitério",
		"Descricao": "O ar aqui é notavelmente mais frio do que no santuário. O  cemitério é pequeno e murado, tendo seu silêncio quebrado apenas pelo farfalhar do vento e pelo barulho de corvos. Lápides de pedra cinzenta, gastas pelo tempo e cobertas de líquen, pontilham a grama alta e mal cuidada.",
		"DescricaoSaidas": "Ao fundo, contra o muro [b]norte[/b], ergue-se um mausoléu de pedra, sua porta de ferro pesada e enferrujada.[br]No muro ao [b]leste[/b] se vê uma fenda na parte de baixo, suficiente para passar uma pessoa.[br]Ao [b]sul[/b] há um portal ogival que leva ao Santuário.",
		"Saidas": {
			"leste": "lugar_escuro",
			"norte": "mausoleu_bezeit",
			"sul": "santuario_tisadya"
		}
	},
	"lugar_escuro": {
		"Nome": "Lugar Escuro",
		"Descricao": "Este é um beco estreito e sem saída, espremido entre o alto muro do cemitério a oeste e a parede cega e úmida de um armazém abandonado a leste. Neste pequeno espaço a luz do sol mal penetra. Pilhas de barris quebrados e sacos rasgados estão jogados contra a parede do armazém, claramente servindo de esconderijo para ratos.[br][br]Uma única lamparina enferrujada ilumina o local. Em pé, sob a sua luz, vê-se um homem esguio com roupas escuras. É Toyol. Ele está de braços cruzados, encostado na parede, afiando pacientemente uma adaga.",
		"DescricaoSaidas": "No muro ao [b]oeste[/b] se vê a fenda que dá para o cemitério.",
		"Saidas": { "oeste": "cemiterio" }
	},
	"mausoleu_bezeit": {
		"Nome": "Mausoléu do Patriarca Bezeit",
		"Descricao": "O ar aqui dentro é pesado e frio, carregado com o cheiro de poeira antiga e pedra mofada. O espaço é um pequeno cômodo octogonal, mal iluminado pela luz que entra pela porta de ferro aberta ao sul.[br][br]No centro exato da sala, repousa um grande sarcófago de pedra, sua tampa uma laje maciça e sem adornos. Na parede norte, diretamente oposta à entrada, o brasão da família Bezeit está esculpido em relevo na pedra, coberto de teias de aranha.",
		"DescricaoSaidas": "Lá fora, ao [b]sul[/b], está o cemitério.",
		"Saidas": {
			"sul": "cemiterio",
			"baixo": "catacumbas_secretas"
		}
	},
	"catacumbas_secretas": {
		"Nome": "Catacumbas Secretas",
		"Descricao": "As catacumbas existentes sob a Vila Boeka.",
		"DescricaoSaidas": "É poissível [b]subir[/b] para o mausoléu.",
		"Saidas": { "cima": "mausoleu_bezeit" }
	},
	"jardim_santuario": {
		"Nome": "Jardim do Santuário",
		"Descricao": "Este é um pequeno pátio murado que serve como entrada principal para o santuário. O espaço é dominado por vários canteiros de madeira elevados, onde crescem de forma organizada dezenas de ervas e plantas medicinais. Contra o muro oeste há um banco de pedra simples para descanso.",
		"DescricaoSaidas": "Ao [b]norte[/b], um portal ogival leva para dentro do Santuário de Tisadya.[br]Ao [b]sul[/b], um portão de madeira simples, mas robusto, leva à praça central da vila.",
		"Saidas": {
			"norte": "santuario_tisadya",
			"sul": "praca_central"
		}
	},
	"praca_central": {
		"Nome": "Praça Central",
		"Descricao": "Este é o coração da vila Boeka, um espaço aberto de terra batida. O ar vibra com o som de vozes, o ranger ocasional de uma carroça e o tilintar distante do martelo de um ferreiro. No centro exato da praça há um poço de pedra, sua borda gasta e entalhada pelo atrito de inúmeras cordas.",
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
		"Descricao": "O ar quente e enfumaçado da taverna atinge você, carregado com o cheiro do hidromel derramado, gordura de porco e fumaça de cachimbo. É um salão amplo, mas de teto baixo, sustentado por vigas de madeira escura. O som de conversas altas, canecas batendo na madeira e uma música desafinada de alaúde vinda de um bardo sonolento no canto enchem o lugar.[br][br]Mesas de madeira pesada, manchadas e arranhadas, estão espalhadas pelo chão coberto de serragem, ocupadas por alguns moradores. No fundo de um balcão de bar, Befur, o taverneiro, limpa uma caneca com um pano sujo.[br][br]Uma lareira crepitante na parede leste aquece o ambiente e, acima dela, é possível ver a cabeça empalhada de um javali com uma expressão estranhamente perplexa.",
		"DescricaoSaidas": "A porta principal ao [b]norte[/b] leva de volta à praça central.[br]Há um pequeno alçapão no chão, atrás do balcão, por onde é possível [b]descer[/b].[br]Há uma escada de madeira [b]subindo[/b] pela lateral, ao lado do balcão.",
		"Saidas": {
			"norte": "praca_central",
			"cima": "estalagem",
			"baixo": "estoque_taverna"
		}
	},
	"estoque_taverna": {
		"Nome": "Estoque da Taverna",
		"Descricao": "O cômodo é pequeno, baixo e desorganizado. O chão de pedra está grudento em alguns pontos. Estantes de madeira tortas se alinham nas paredes leste e oeste, mas estão em boa parte vazias, exceto por alguns sacos de grãos rasgados e garrafas de vinho cobertas de poeira. Várias caixas soltas estão empilhadas aleatoriamente no centro, cobertas por grossas teias de aranha. Em um canto nos fundos, parcialmente escondido por uma pilha de barris vazios, há um canto de dormir improvisado. Uma única lâmpada a óleo, pendurada no teto baixo, mal ilumina o lugar.",
		"DescricaoSaidas": "Acima há um alçapão, acessível por uma escadinha, por onde é possível [b]subir[/b] de volta ao salão da taverna.",
		"Saidas": { "cima": "calice_sagrado" }
	},
	"estalagem": {
		"Nome": "Aposento para pernoitar",
		"Descricao": "Aqui os sons da taverna abaixo são ouvidos apenas como um murmúrio baixo e o tilintar ocasional de canecas batendo. Uma cama estreita com um colchão de palha irregular e cobertores de lã áspera ocupa a maior parte do espaço. Ao lado há uma pequena cômoda de madeira com uma bacia de metal lascada e uma jarra de água. Uma única janela pequena e empoeirada na parede norte deixa entrada uma luz cinzenta.",
		"DescricaoSaidas": "Uma porta leva de volta à escada por onde é possível [b]descer[/b] ao salão da taverna.",
		"Saidas": { "baixo": "calice_sagrado" }
	},
	"rua_principal_13": {
		"Nome": "Rua Principal",
		"Descricao": "Esta é a principal artéria de comércio da vila, embora seja pouco mais que um caminho largo e empoeirado. A rua é dominada pelo barulho e calor que emanam de um dos edifícios.",
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
		"Descricao": "A forja é um espaço funcional e caótico. A bigorna maciça domina o centro. No fundo, a fornalha queima com um brilho laranja-avermelhado, irradiando um calor intenso. As paredes estão cobertas de ferramentas penduradas: martelos, espadas, flechas... Prateleiras e barris estão cheios de peças de metal, ferraduras, pregos e uma diversidade de armas em diferentes estágios de conclusão ou reparo. Thorvak, o ferreiro anão, está parado ao lado da bigorna, limpando o suor com um antebraço musculoso.",
		"DescricaoSaidas": "A saída é ao [b]sul[/b], levando de volta à Rua Principal.[br]Existe uma escada que permite [b]subir[/b].",
		"Saidas": {
			"cima": "aposento_thovak",
			"sul": "rua_principal_13"
		}
	},
	"aposento_thovak": {
		"Nome": "Aposento de Thorvak",
		"Descricao": "Este pequeno aposento é um reflexo direto da personalidade de Thorvak, funcional e sem frescuras. As paredes de pedra bruta são escuras de fuligem, e o chão é de lajota nua, varrido de forma grosseira. Em um canto há uma cama baixa e larga, feita de tábuas grossas de madeira, coberta por uma pilha de peles desgrenhadas. Ao lado, um caixote virado serve de mesa, sobre o qual repousa uma caneca de metal amassada e um prato de estanho com migalhas. Aos pés da cama há um baú pesado, feito de madeira escura e reforçado com tiras grossas de ferro. Encostado na parede ao lado da cama, há um suporte vazio, feito para sustentar, ao que tudo indica, um grande machado.",
		"DescricaoSaidas": "É possível [b]descer[/b] pela escada, de volta à Forja de Thorvak.",
		"Saidas": { "baixo": "forja_thovak" }
	},
	"loja_armadura": {
		"Nome": "Loja de Armaduras de Gor-Noj",
		"Descricao": "O lugar é relativamente bem cuidado. É possível ouvir o barulho abafado da forja de Thorvak, do outro lado da rua, reduzido a um clang rítmico e distante. O cheiro dominante é uma mistura forte de couro curtido, óleo de polimento e cera de abelha. O espaço é amplo, mas parece abarrotado devido à enorme quantidade de equipamentos pendurados. Peças de armadura estão por toda parte: peitorais de couro batido pendurados em vigas do teto, cotas de malha enroladas em prateleiras na parede leste, e uma fileira de elmos variados (alguns amassados e reparados) em uma longa mesa central. Vários escudos de madeira e metal estão encostados na parede oeste. O dono, Gor-Noj, um meio-orc corpulento, está atrás de um balcão de madeira rústico no fundo da loja. Ele está metodicamente passando um pano oleado em um escudo de metal, ignorando sua entrada por um momento antes de levantar o olhar lentamente.",
		"DescricaoSaidas": "A porta ao [b]norte[/b] leva de volta à Rua Principal.",
		"Saidas": { "norte": "rua_principal_13" }
	},
	"portao_leste_19": {
		"Nome": "Portão Leste",
		"Descricao": "Aqui termina a rua principal, encontrando a alta paliçada de madeira que protege a vila. O Portão Leste é uma estrutura robusta de troncos grossos, reforçada com faixas de ferro e equipada com uma pesada tranca de madeira que atualmente repousa em seus suportes. O guarda humano, Beder, está postado no lado norte do portão; a guarda anã, Nirja, está postada no lado sul. Acima deles, uma plataforma de vigia permite observar o exterior. O portão está atualmente entreaberto, permitindo a passagem de uma pessoa de cada vez. Através dele, você pode ver um caminho de terra batida que persiste pelos campos ao leste.",
		"DescricaoSaidas": "A rua principal se estende para [b]oeste[/b], de volta ao coração da vila.[br]O caminho de terra batida a [b]leste[/b] continua para fora da vila.",
		"Saidas": {
			"leste": "caminho_para_mina",
			"oeste": "rua_principal_13"
		}
	},
	"caminho_para_mina": {
		"Nome": "Caminho para a Mina",
		"Descricao": "Um pequeno trecho que leva para as minas abandonadas de Boeka.",
		"DescricaoSaidas": "Você pode voltar pelo portao da vila a [b]oeste[/b], ou entrar na mina ao [b]norte[/b].",
		"Saidas": {
			"norte": "mina_abandonada",
			"oeste": "portao_leste_19"
		}
	},
	"mina_abandonada": {
		"Nome": "Mina Abandonada",
		"Descricao": "Apenas seguindo o mapa.",
		"DescricaoSaidas": "Corredores superiores diga [b]subir[/b], ou [b]descer[/b] para corredores inferiores. A saida está ao [b]sul[/b].",
		"Saidas": {
			"cima": "corredores_superiores_mina",
			"baixo": "corredores_inferiores_mina",
			"sul": "caminho_para_mina"
		}
	},
	"corredores_superiores_mina": {
		"Nome": "Corredores Superiores",
		"Descricao": "Onde os monstros residem, podemos fazer um pequeno labirinto.",
		"DescricaoSaidas": "Para voltar é só [b]descer[/b].",
		"Saidas": { "baixo": "mina_abandonada" }
	},
	"corredores_inferiores_mina": {
		"Nome": "Corredores Inferiores",
		"Descricao": "Onde os monstros residem, podemos por um item.",
		"DescricaoSaidas": "Para voltar é só [b]subir[/b].",
		"Saidas": { "cima": "mina_abandonada" }
	},
	"rua_principal_14": {
		"Nome": "Rua Principal",
		"Descricao": "Esta seção larga da Rua Principal serve como uma área de logística e patrulha. Ao norte fica um edifício de madeira robusto, de aparência funcional, com uma bandeira simples da vila pendurada na frente: o Posto da Milícia. Ao sul, há apenas mato alto com o que parecem ruínas de um armazém, e um caminho estreito seguindo em direção ao Portão Sul.",
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
		"Descricao": "Esta é a barreira sul da vila Boeka. O Portão Sul é uma estrutura imponente de madeira escura e ferro, parecendo mais robusto e permanentemente fechado do que o Portão Leste. O cheiro de piche, usado para tratar a madeira, e um leve odor de mofo pairam no ar. Elnor, um arqueiro elfo-humano nervoso, está sobre a vigia. Kel, uma maga humana, está à direita, o olhar fixo no caminho além do portão. Uma plataforma de vigia ergue-se acima da paliçada. O portão está fechado.",
		"DescricaoSaidas": "Através das frestas e da torre de vigia, você pode ver a estrada [b]sul[/b], um caminho que rapidamente se torna sombrio, flanqueado por árvores retorcidas e uma névoa rasteira que parece pairar mesmo sob o sol.[br]Ao [b]norte[/b], o caminho leva de volta à Rua Principal.",
		"Saidas": { "norte": "rua_principal_14" }
	},
	"posto_milicia": {
		"Nome": "Posto da Milícia",
		"Descricao": "Este é o quartel-general da milícia de Boeka. É um salão único, rústico e funcional, com paredes de troncos grossos e um teto baixo sustentado por vigas escuras. Um mapa grande da região está estendido sobre uma mesa central, marcado com círculos vermelhos e anotações. Pelo salão, há racks de armas contendo lanças e espadas curtas, e alguns escudos com o brasão simples da vila estão encostados na parede. O Capitão Jaffer está em uma mesa no canto oeste, observando o movimento.",
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
		"Descricao": "Este quarto é espartano, contendo apenas o essencial. As paredes de troncos são nuas. Uma cama de campanha estreita está encostada na parede norte, coberta por um cobertor de lã cinza, dobrado com precisão militar. Aos pés da cama, há um baú pessoal de madeira escura, reforçado com metal. Na parede oeste, há uma pequena janela gradeada e um suporte de armas vazio. Em um canto, há uma pequena bacia de estanho e uma jarra de água sobre um suporte de madeira.",
		"DescricaoSaidas": "A única porta, a [b]leste[/b], leva de volta ao Posto da Milícia.",
		"Saidas": { "leste": "posto_milicia" }
	},
	"aposento_guarda": {
		"Nome": "Aposento da Guarda",
		"Descricao": "O ambiente aqui é quente e abafado, com um cheiro forte de suor, roupa suja e couro velho. Este é um dormitório simples e abarrotado. Seis beliches de madeira bruta estão alinhados contra as paredes leste e oeste, a maioria deles desarrumada, com cobertores de lã jogados de qualquer maneira. Pequenos baús pessoais de madeira estão guardados sob cada beliche. No centro do cômodo, uma mesa tosca está cercada por alguns bancos, coberta de canecas de cerveja vazias, um baralho de cartas gorduroso e migalhas de uma refeição passada. Roupas sujas e peças de armadura de couro estão jogadas sobre os bancos e no chão.",
		"DescricaoSaidas": "A única porta, ao [b]sul[/b], leva de volta ao Posto da Milícia.",
		"Saidas": { "sul": "posto_milicia" }
	},
	"treinamento_milicia": {
		"Nome": "Sala de Treinamento",
		"Descricao": "Esta área é um pátio de armas funcional, com o chão de terra batida e compactada. O teto é alto e parcialmente aberto às vigas, permitindo a ventilação. Ao longo da parede leste há uma fileira de três bonecos de treino, feitos de palha amarrada em postes de madeira grossa. Seus corpos estão esfarrapados de tantos golpes. Um rack de armas de madeira na parede norte contém várias espadas de madeira cegas, bastões longos e alguns escudos de prática, lascados.",
		"DescricaoSaidas": "A arcada a [b]oeste[/b] leva de volta ao salão principal do Posto da Milícia.",
		"Saidas": { "oeste": "posto_milicia" }
	},
	"prisao_milicia": {
		"Nome": "Prisão",
		"Descricao": "O ar aqui embaixo é frio, parado e fétido. O teto de pedra baixo goteja água suja, formando poças no chão de terra irregular. A única luz vem de uma única lamparina em um suporte na parede perto da escada, lançando sombras longas e distorcidas. Este porão serve como a prisão da vila. Há duas celas pequenas, mas robustas, de barras de ferro enferrujadas, ocupando a parede norte. A maior parte do espaço restante é ocupada por barris velhos e caixas quebradas, cobertos de teias de aranha. Em um canto, perto da escada, há uma mesa tosca e um banco, presumivelmente para um guarda, embora esteja vazio agora.",
		"DescricaoSaidas": "A única saída é a escada de pedra que permite [b]subir[/b] de volta ao Posto da Milícia.",
		"Saidas": { "cima": "posto_milicia" }
	},
	"rua_principal_15": {
		"Nome": "Rua Principal",
		"Descricao": "Esta é a seção final da rua principal dentro das paliçadas. É um caminho de terra batida como o resto, mas as laterais são limpas. Ao sul há um edifício singular. É uma pequena loja de pedra e madeira, com uma placa pendurada que mostra um pilão e uma retorta borbulhante. Da sua chaminé torta sai uma fina coluna de fumaça roxa pálida. Este é o Recanto da Alquimista.",
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
		"Descricao": "O ar aqui dentro faz o nariz formigar, tendo uma mistura avassaladora de centenas de cheiros: enxofre, pétalas secas, poeira mineral e um toque metálico. O espaço é pequeno e abarrotado. A luz é fraca, vinda não de velas, mas do brilho suave de líquidos em frascos e de uma única lâmpada a óleo com uma chama verde pálida sobre o balcão. Prateleiras de madeira escura cobrem todas as paredes, do chão ao teto, repletas de incontáveis frascos de vidro, potes de cerâmica, caixas de madeira etiquetadas com uma caligrafia élfica elegante e pequenos sacos de pano. Estranhas partes de animais, como garras, penas e olhos em conserva, pendem das vigas do teto. Um balcão de madeira polida, mas marcado por queimaduras de ácido e manchas coloridas, separa a loja. Sobre ele há uma balança de latão delicada, um pilão de obsidiana e alguns frascos de poções prontos para venda. No fundo da loja, em uma área de trabalho, um complexo alambique de cobre borbulha suavemente, soltando a fina fumaça roxa que você viu lá fora. A dona, Gólirin, uma elfa de aparência acadêmica, está de costas, ajustando meticulosamente uma válvula no alambique. Ela não se vira, mas fala em voz clara: Limpe os pés. E não toque em nada, a menos que queira perder um dedo ou ganhar uma cauda. O que você precisa?",
		"DescricaoSaidas": "A porta ao [b]norte[/b] leva de volta à rua principal.",
		"Saidas": { "norte": "rua_principal_15" }
	},
	"portao_oeste_27": {
		"Nome": "Portão Oeste",
		"Descricao": "Este é o limite oeste da vila. O Portão Oeste é uma barreira sólida de troncos grossos, reforçada com faixas de ferro. Tem sido deixado aberto, permitindo a passagem. Uma pesada tranca de madeira repousa em suportes ao lado, fora de uso. Um único guarda da milícia, Varten, está postado aqui, parecendo mais um vigia do que um soldado. Através do portão aberto, você pode ver a estrada a oeste. Ela leva a uma grande clareira cheia de tocos e serragem e, mais além, desaparece na escuridão iminente da Floresta Lethien.",
		"DescricaoSaidas": "A estrada segue para o [b]oeste[/b], em direção ao perímetro dos lenhadores.[br]A Rua Principal se estende para [b]leste[/b], de volta à vila.",
		"Saidas": {
			"oeste": "perimetro_lenhadores",
			"leste": "rua_principal_15"
		}
	},
	"travessa_oeste_28": {
		"Nome": "Travessa Oeste",
		"Descricao": "A rua é um caminho tranquilo e residencial de cascalho. O barulho da rua principal e das lojas parece distante. As casas são pequenas, feitas de madeira e pau-a-pique, com pequenos jardins frontais.",
		"DescricaoSaidas": "Ao [b]sul[/b], o caminho de cascalho leva de volta à rua principal.[br]A [b]oeste[/b], você vê a porta de uma pequena casa de madeira com uma janela escura.[br]A travessa continua para o [b]norte[/b].",
		"Saidas": {
			"norte": "travessa_oeste_29",
			"oeste": "npc_28",
			"sul": "rua_principal_15"
		}
	},
	"npc_28": {
		"Nome": "Casa NPC",
		"Descricao": "Apenas uma futura casa de npc.",
		"DescricaoSaidas": "Para voltar [b]leste[/b].",
		"Saidas": { "leste": "travessa_oeste_28" }
	},
	"travessa_oeste_29": {
		"Nome": "Travessa Oeste",
		"Descricao": "A rua é um caminho tranquilo e residencial de cascalho. O barulho da rua principal e das lojas parece distante. A leste, você vê a porta de uma casa similar às outras, mas a madeira é tratada, a pintura da porta está fresca e pequenos vasos de ervas florescem na única janela, sugerindo um cuidado maior.",
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
		"Descricao": "A futura casa de alguem.",
		"DescricaoSaidas": "Para voltar ao [b]sul[/b].",
		"Saidas": { "sul": "travessa_oeste_29" }
	},
	"casa_golirin": {
		"Nome": "Casa Gólirin",
		"Descricao": "O chão de madeira está perfeitamente varrido. A luz entra por uma janela limpa a oeste, iluminando o ambiente. Contra a parede norte há uma estante cheia de pergaminhos. Em um canto há uma cama estreita com lençois de linho brancos e bem dobrados. Uma pequena mesa de carvalho polido com duas cadeiras retas fica no centro. Aos pés da cama há um pequeno baú de madeira escura com entalhes élficos.",
		"DescricaoSaidas": "A única porta, a [b]oeste[/b], leva de volta à Travessa.",
		"Saidas": { "oeste": "travessa_oeste_29" }
	},
	"travessa_oeste_30": {
		"Nome": "Travessa Oeste",
		"Descricao": "O caminho de cascalho da Travessa Oeste termina aqui, abrindo-se para um pátio varrido de pedra em frente à estrutura residencial mais imponente da vila. O ar aqui é quieto, e a casa projeta uma longa sombra sobre a rua. Dois guardas da milícia, parecendo tensos e um pouco desconfortáveis em seu posto, flanqueiam o portão de ferro.",
		"DescricaoSaidas": "A [b]leste[/b], a rua continua de volta à área residencial.[br]A [b]oeste[/b], bloqueando o caminho, ergue-se o Casarão Bezeit.",
		"Saidas": {
			"leste": "travessa_oeste_29",
			"oeste": "casarao_bezeit"
		}
	},
	"casarao_bezeit": {
		"Nome": "Casarão Bezeit",
		"Descricao": "A maior casa da vila, onde mora a familia Bezeit, que remonta aos fundadores de Boeka.",
		"DescricaoSaidas": "Volte ao [b]leste[/b].",
		"Saidas": { "leste": "travessa_oeste_30" }
	},
	"perimetro_lenhadores": {
		"Nome": "Perímetro dos Lenhadores",
		"Descricao": "Diversos tocos de árvores e pedaços de troncos organizados em pilhas.",
		"DescricaoSaidas": "Ao [b]norte[/b] está a cabana de Medel.[br]Ao [b]leste[/b] fica o portão oeste da vila.[br]Ao [b]oeste[/b] se estende a Floresta Lethien.",
		"Saidas": {
			"norte": "cabana_medel",
			"leste": "portao_oeste_27",
			"oeste": "floresta_lethien"
		}
	},
	"cabana_medel": {
		"Nome": "Cabana de Medel, o lenhador",
		"Descricao": "Ele corta lenha.",
		"DescricaoSaidas": "Volte ao [b]sul[/b].",
		"Saidas": { "sul": "perimetro_lenhadores" }
	},
	"floresta_lethien": {
		"Nome": "Entrada da floresta Lethien",
		"Descricao": "Entrada da floresta.",
		"DescricaoSaidas": "Pode-se voltar, ao [b]leste[/b].",
		"Saidas": { "leste": "perimetro_lenhadores" }
	},
}
