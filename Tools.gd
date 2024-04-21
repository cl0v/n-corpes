class_name Tools extends Node

const default_units = {
	'g': 0,
	'm': 0,
	's': 0,
}

# Organiza as unidades de medida com as dimensoes corretas.
# Resultado de uma soma de valores 
func sum_dimensions(first: Array[int], second:  Array[int]) -> Array[int]:
	var _array: Array[int] = [0,0,0]
	for idx in range(0,3):
		_array[idx] = first[idx]+second[idx]
	return _array

# Subtraia dimensões
# A ordem aqui é muito importante
func sub_dimensions(first: Array[int], second: Array[int]) -> Array[int]:
	var _array: Array[int] = [0,0,0]
	for idx in range(0,3):
		_array[idx] = first[idx]-second[idx]
	return _array

#func 
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
