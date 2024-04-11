class_name Un extends Node

## Explicação da dimensão padrão da unidade neutra.
# [default_dimension]
# Formula + 0 * any [(+ 0 * any)?]
# Formula * 1 * 1 * 1
# + 1 não pode pois neutralizará a formula quando adição, desviando 1 do centro

var nome: String = 'Neutro'
var module: float = 1 # Equivalente a Value e 1 para .
var dimension: int = 1
#const default_unit: String = 'n' # neutro
#const default_dimension:int = 0 # Para multiplicação 0 para soma 1

#var actual_dimension: int = default_dimension


const SI_prefix = {
	'c': pow(10,-2),
	'k': pow(10,3),
	'M': pow(10,6),
	'G': pow(10,9),
}

func getPrefix(c)->int:
	if(c == null):
		return 1
	return SI_prefix[c]

func copy():
	# Acho que esse copy não funciona
	var s = self
	return self

func unitString() -> String:
	return 'neutro(s)'

func getMod1():
	return self.copy().i(1,1)
