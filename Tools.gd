class_name Tools extends Node

# Organiza as unidades de medida com as dimensoes corretas.
# Resultado de uma soma de valores 
func sum_dimensions(first: Dictionary, second: Dictionary) -> Dictionary:
	var dict = {}
	dict.merge(first)
	for d in second:
		if(dict.has(d)):
			dict[d]+= second[d]
		else:
			dict[d]=second[d]
	return dict

# Subtraia dimensões
# A ordem aqui é muito importante
func sub_dimensions(first: Dictionary, second: Dictionary) -> Dictionary:
	var dict = {}
	dict.merge(first)
	for d in second:
		if(dict.has(d)):
			dict[d]+= -second[d]
		else:
			dict[d]=-second[d]
	return dict
#
## Recebe o expoente na base 10 de numeros abaixo de 0
#func get_e_exp(value):
	#print(value)
	#var exp = 0
	#if(value < 10 and value > 0):
		#return null
	#while(value < 10):
		#exp += 1
		#value *= 10
	#return exp
