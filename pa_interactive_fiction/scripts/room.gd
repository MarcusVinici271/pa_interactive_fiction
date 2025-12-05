extends VBoxContainer

# Função para atualizar os textos da interface da sala
# Note que usei 'room_name' em vez de 'name' para evitar o aviso de sombreamento 
# da propriedade 'name' do próprio Node.
func set_text(room_name: String, description: String, exit: String, objects: String = "Não há objetos nesta sala.") -> void:
	# O operador % é o equivalente direto ao GetNode("%Nome") para Unique Names
	%Name.text = room_name
	%Description.text = description
	%Exits.text = exit
	%Objects.text = objects
