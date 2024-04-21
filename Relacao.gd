class_name R extends Node
# R representa a relação de medidas.

# Valor da relação (modulo)
var value: float = 1
# Sempre na ordem de grama, metro, segundo *GMS*
var unidades: Array[int] = [0,0,0]

# k Quilo, M Mega, G Giga, c centi, etc
# o funcionamento correto deve informar 
var preffix: Array[String] = ['','','']

const _un = ['g', 'm', 's']

#var unidades: Dictionary = {'g': 0, 'm': 0, 's':0}
# Sendo segundo na segunda dimensão, distancia na terceira e peso na primeira
const proposed_dimension: Dictionary = {'m': 3, 's': 2, 'g':1}


# Isso é um Vetor Tridimencional.
# Sendo a massa
# O tempo até minha posição (é constante nas leis de newton)
# O modulo da distancia até
func a_dict(_value: float, _units: Dictionary, _preffix = preffix) -> R:
	preffix.assign(_preffix)
	value = _value
	unidades = [_units['g'], _units['m'], _units['s']]
	return self

# Assign
func a(_value: float, _units: Array[int], _preffix = preffix) -> R:
	preffix.assign(_preffix)
	value = _value
	unidades.assign(_units)
	return self

func countDimensions(_unit: String) -> int:
	var idx = _un.find(_unit)
	return unidades[idx]

func sum(r:R):
	if(check_duplicated_units(r)):
		print('Ainda não sei somar relações de unidades diferentes')
		return null
	return 'Erro na soma'

func sub(r:R):
	if(check_duplicated_units(r)):
		print('Ainda não sei subtrair relações de unidades diferentes')
		return null
	return 'Erro na subtracao'


func copy():
	var r: R = R.new()
	r.a(value, unidades)
	return r

func check_duplicated_units(r:R)-> bool:
	return unidades == r.unidades

# Multiplica uma relação
func mult(r: R) -> R:
	return a(value * r.value, Tools.new().sum_dimensions(unidades, r.unidades))

# Divide uma relação
func div(r: R)-> R:
	return self.a(value / r.value, Tools.new().sub_dimensions(unidades, r.unidades))

func invert() -> R:
	unidades.assign(unidades.map(_filter_invert))
	return self


func _filter_invert(number):
	return int(number * -1)

func sqt(exp: int = 2) -> R:
	value = pow(value, 1.0/float(exp))
	unidades.assign(unidades.map(func(num): return num / exp))
	return self

func po(exp: int = 2) -> R:
	value = pow(value, exp)
	unidades.assign(unidades.map(func(num): return num * exp))
	return self

func print(text:String, show:bool=true, cientifica: bool = true)-> void:
	var relations = {
		[0,3,0] : 'volume (s)',
		[1,-3,0]: 'densidade',
		[0,1,-2]: 'aceleracao',
		[1,1,-2]: 'newton(s)',
	}
	
	var _value: String = ''
	if(cientifica):
		if(value > 10):
			var exp =  str(value).length() - 1
			var v = value / pow(10,exp)
			_value = str(v,' e', exp)
		else:
			#var exp = Tools.new().get_e_exp(value)
			#var _exp = str(value).split(".")[0].length() - 1
#
			#var v = value * 1
			_value = str(value)# str(v,' e', )
	else:
		_value = str(value)
	var _units
	if(relations.get(unidades) != null):
		_units = relations.get(unidades)
	else:
		_units = str(preffix[0],'g^',unidades[0], preffix[1],'.m^', unidades[1], preffix[2] ,'.s^', unidades[2])
	print(text, ': ',str(_value, ' ', _units))
