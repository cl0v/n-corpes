class_name M extends Node3D
# Fator M
# Representa a coexistência das 3 unidades, mesmo quando não presente (dimensão = 0)
var total_mass: Array[Mass] = []
var total_distance: Array[Distance] = []
var total_tempo: Array[Tempo] = []


const default_unit: String = 'c' # complex
const default_char: String = 'fator' # 

func i(items: Array):
	for it in items:
		if(it is Mass):
			total_mass.append(it)
		if(it is Distance):
			total_distance.append(it)
		if(it is Tempo):
			total_tempo.append(it)
	return self

func reduce():
	# Reduz os 3 arrays para apenas 1 elemento para cada dimensão
	# Dimensões elevadas a 0 serão removidas
	# Caso duas listas estejam vazias, a unidade natural será retornada.
	
	pass
