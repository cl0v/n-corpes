class_name M extends Node3D
# Fator M : The R but better
# Representa a coexistência das 3 unidades, mesmo quando não presente (dimensão = 0)
var ml: Array[Mass] = []
var dl: Array[Distance] = []
var tl: Array[Tempo] = []

const default_unit: String = 'c' # complex
const default_char: String = 'fator' # 

func i(items: Array):
	for it in items:
		if(it is Mass):
			ml.append(it)
		if(it is Distance):
			dl.append(it)
		if(it is Tempo):
			tl.append(it)
	return self

func reduce():
	var _count : Un = null
	# Reduz os 3 arrays para apenas 1 ou 0 elemento para cada dimensão
	# Dimensões elevadas a 0 serão removidas
	# Caso duas listas estejam vazias, a unidade natural será retornada.
	for _i in ml:
		#_count = Operators.sum(_i.copy(), _) 
		ml.erase(_i)
	
	if(_count == null):
		return self
		

func copy() -> M:
	var me = M.new()
	me.ml = ml
	me.dl = dl
	me.tl = tl
	return me
