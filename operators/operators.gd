extends Node

func sum(un1, un2):
	if(un1.dimension != un2.dimension):
		return str('Erro: Impossível fazer a soma de: ', un1.module,un1.dimension, ' + ',un2.module, un2.dimension)
	return un1.copy().i(un1.module+un2.module, un1.dimension)

func sub(un1, un2):
	if(un1.dimension != un2.dimension):
		return str('Erro: Impossível fazer a subtração de: ', un1.module,un1.dimension, ' - ',un2.module, un2.dimension)
	return un1.copy().i(un1.module-un2.module, un1.dimension)


func mult(un1, un2):
	if(un1.default_unit != un2.default_unit):
		return mult_d(un1,un2)

	var mod = un1.module * un2.module
	var dim = un1.dimension + un2.dimension

	return un1.copy().i(mod, dim)

func div(un1, un2):
	if(un1.default_unit != un2.default_unit):
		return div_m(un1,un2)
	var mod = un1.module / un2.module
	var dim = un1.dimension - un2.dimension
	return un1.copy().i(mod, dim)

func div_m(un1, un2):
	pass

# Multiplica dimensões
func mult_d(un1, un2): # Retorna Un ou M
	if(un1 is M):
		return mult_m(un1, un2)
	if(un2 is M):
		return mult_m(un2, un1)
			
	return M.new().i([un1,un2])
	
	var d1 ={un1.default_unit : un1.dimension}
	var d2 = {un2.default_unit : un2.dimension}
	Tools.new().sum_dimensions(d1,d2)
	pass
	#return 
	# Adicionar uma camada de checagem para ver a possibilidade de retornar a mesma unidade 
	# (massa * massa2) pode ser massa3 e não CC
	# porém cc não pode virar 


# Multiplica um complexo por unitario
func mult_m(un1: M, un2) -> M:
	if(un2 is M):
		return mult_mm(un1, un2)
	var res = un1.i([un2])
	return res

# Multiplica dois complexos
func mult_mm(un1: M, un2:M):
	return 'Ainda não implementado'
	

#func _send_mult(un1, un2) -> Dictionary:
	#un1.default_unit
	#un2.default_unit
	#pass
