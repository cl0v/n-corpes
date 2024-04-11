class_name R extends Node
# R representa a relação de medidas.

# Valor da relação
var value: float = 1
# Unidade de medida e dimensão (m^3) (s^2) (s^-2) 
var unidades: Dictionary = {}

# Isso é um Vetor Tridimencional.
# Sendo a massa
# O tempo até minha posição (é constante nas leis de newton)
# O modulo da distancia até

# Assign
func a(_value: float, _units: Dictionary) -> R:
	value = _value
	unidades = _units
	return self

func sum(r:R) -> R:
	if(check_duplicated_units(r)):
		print('Ainda não sei somar relações de unidades diferentes')
		return null
	var res: R= R.new()
	return res

func sub(r:R) -> R:
	if(check_duplicated_units(r)):
		print('Ainda não sei subtrair relações de unidades diferentes')
		return null
	var res: R= R.new()
	return res


func copy():
	var r: R = R.new()
	r.a(value, unidades)
	return r

func check_duplicated_units(r:R)-> bool:
	return unidades == r.unidades

# Multiplica uma relação
func mult(r: R) -> R:
	var res: R= R.new()
	res.a(r.value * value, Tools.new().sum_dimensions(unidades, r.unidades))
	return res

# Divide uma relação
func div(r: R)-> R:
	return mult(r).invert()

func invert() -> R:
	var res: R= R.new()
	var _uni = {}
	for i in unidades:
		_uni[i] = -1 * unidades[i]
	return res.a(value, _uni)

func sqt() -> R:
	var res: R = R.new()
	var _uni = {}
	for i in unidades:
		_uni[i] = unidades[i]/2
	res.a(sqrt(value), _uni)
	return res

func print(text:String, show:bool=true, cientifica: bool = true):
	print(text)
	var relations = {
		{'m': 3} : 'volume',
		{'m': -3, 'g': 1}: 'densidade',
		{'m': 1, 's':-2}: 'aceleracao',
		{'m': 1, 's':-2, 'kg': 1}: 'newton',
	}
	# Define a unidade de medida
	var _units = ''
	if(relations.get(unidades) == null or show):
		var uni = ''
		for i in (unidades.keys()):
			if(unidades[i] == 1):
				uni += str(i)
			else:
				uni += str(i, '^', unidades[i])
			uni += ';'
		_units = uni
	else:
		_units = relations.get(unidades)
	# Define o valor em caso de notacao cientifica
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
	print(str(_value, ' ', _units))
