class_name U extends Node2D

var unidades: Array = [
	'n', # Neutro: Unidade placeholder
	's', # segundo: Unidade de tempo
	'm', # metro: Unidade de distância
	'g', # grama: Unidade de peso
]

var value: float = 1
var unit: String = 'n'
var dimension: int = 1

# Assign values
func a(_value: float, _unit: String, _dimension: int)->U:
	value = _value
	unit = _unit
	dimension = _dimension
	return self

func sum(u: U) -> U:
	if(u.unit != unit or u.dimension != dimension):
		return null
	var res: U = U.new()
	res.value = u.value + value
	res.dimension = dimension
	res.unit = unit
	return res

func sub(u: U)-> U:
	if(u.unit != unit or u.dimension != dimension):
		return null
	var res: U = U.new()
	res.value = u.value - value
	res.dimension = dimension
	res.unit = unit
	return res

func mult(u: U) -> U:
	if(u.unit != unit):
		return null
	var res: U = U.new()
	res.value = u.value * value
	res.dimension = u.dimension + dimension
	res.unit = unit
	return res

# _au representa outra unidade
func mult_au(u: U) -> R:
	var r: R = R.new()
	r.a(u.value * value, {unit : dimension, u.unit : u.dimension})
	return r

# Multiplica uma relação
func mult_r(r: R) -> R:
	var res: R= R.new()
	res.a(r.value * value, Tools.new().sum_dimensions({unit:dimension}, r.unidades))
	return res

func div(u: U) -> U:
	if(u.unit != unit):
		return null
	var res: U = U.new()
	res.value = u.value / value
	res.dimension = u.dimension - dimension
	res.unit = unit
	return res

# _au representa outra unidade
func div_au(u: U) -> R:
	var r: R = R.new()
	r.a(value / u.value , {unit : dimension, u.unit : -u.dimension})
	return r

func print():
	print(value)
	print(unit)
	print(dimension)
	
func read_pt(value: float, unit: String, dimension: int):
	var dict = {
		unidades[0] : 'neutro(s)',
		unidades[1] : 'segundo(s)',
		unidades[2] : 'metro(s)',
		unidades[3] : 'grama(s)',
		}
	var dict_dim = {
		1: 'uni',
		2: 'quadrado',
		3: 'cubo'
	}
	print(value, ' ', dict[unit], ' ao ', dict_dim[dimension])

func copy():
	var r: U = U.new()
	r.a(value, unit, dimension)
	return r


class UTools:
	func sum():
		pass
