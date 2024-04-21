extends Node2D

## Legenda
# Letra; vírgula; Valor numérico; ('m', 3) é pow('m', 3) 
#
#var relacoes: Dictionary = {
	#'v' = "'m', 3", # Volume
	#'d' = "'g'/ 'm', 3", # Densidade
	#
#}

const area: Dictionary= {'m': 2}
const volume: Dictionary= {'m': 3}
const densidade: Array[int] = [1,-3,0] # {'m': -3, 'g': 1}
const aceleracao: Dictionary = {'m': 1, 's':-2}
const newton: Array[int] = [1, 1, -2] # { 'g': 1, 'm': 1, 's':-2}
const t:  Dictionary= {'s': 2}
const tempo:  Dictionary= {'s': 2}


var constante_gravitacao_universal: R = r(6.67408*pow(10, -11-6), [0,0,0]).copy()

var force_law_divide_time = tim(1,2).copy().invert()
var force_law_mass = pes(1, 1).copy()
var force_law_distance = dis(1,1).copy()

var default_mass_distance_relation = default().mult(dis(1, 2)).mult(pes(1,2).invert())
#var force_law = R.new().a(1, densidade).invert().mult(force_law_divide_time)
var module_newton = default().mult(pes(1,1)).mult(dis(1,1)).mult(tim(1,-2))
var gravitacao_universal: R = r(6.67408*pow(10, -11-3), newton).copy().mult(dis(1,2)).mult(pes(1,-2)).copy()
var massa_terra = pes(5973332 * pow(10,21), 1).copy()
var objectTo_terra_centro = dis(pow(6378137, 1), 1)


const noPrefix = ['','','']

func default(v=1, d:Array[int]=[0,0,0]):
	return R.new().a(v,d, noPrefix)
func tim(v, d) -> Tempo:
	return Tempo.new().instance(v,d,noPrefix)
func pes(v,d)->Peso:
	return Peso.new().instance(v,d,noPrefix)
func dis(v,d)->Distancia:
	return Distancia.new().instance(v,d,noPrefix)

#main
func _ready():
	default_mass_distance_relation.print('default relation')
	gravitacao_universal.print('Gravitação universal')
	print(gravitacao_universal.value * pow(10,16))
	# massa_terra.copy().po(-2).print('mt')
	#var x = massa_terra.copy().po(-2).div(objectTo_terra_centro.po(-2))
	#x.print('x: ')
	# print(default_mass_distance_relation)
	run_tests()

	# gravitacao_universal.print('Gravitacao universal')
	
	
# Doc [read]:
	# Lê a forma correta de pronunciar a expressão.
	# Com Valor e Unidade. 
	# Ex: 10 metros; 12 segundos; 12 segundos ao quadrado, etc.
func u(value: float, unit: String, dimension: int = 1) -> U:
	var u = U.new()
	u.a(value, unit, dimension)
	#u.read_pt(value, unit, dimension)
	return u

func r(value: float, units: Array[int]) -> R:
	if(units.size() != 3):
		print('Ocorreu um erro na criação do R')
		return null
	var r = R.new()
	r.a(value, units)
	return r

func newObj(obj):
	return R.new().a(obj.value, obj.unidades)

func _input(event):
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit()
		

# Formula = 1 / (densidade * tempo^2) => r(1, densidade).mult(temp(1)
func assert_build_gravity_base_on_dimensions_formula():
	assert(r(1, densidade + [0,0,2]).unidades == [1,-3,2] )
	#assert(constante_gravitacao_universal.mult())
	
func assert_gravity():
	# A massa maior deve estar sempre na frente nos calculos.
	# O Mzão representa a maior massa, pois ela quem prevalece e exerce forca sob a massa menor.
	# 
	# Pergunta: Qual a diferença de representar a massa menor como o Mzão?
	var massa_terra = pes(5973332 * pow(10,21), 1) 
	var objeto = pes(1,1)
	var distancia_terra_mar = dis(pow(6378137, 1), 1)
	var d2 = distancia_terra_mar.mult(distancia_terra_mar)
	var m2 = massa_terra.mult(pes(1,1))
	
	var slice = m2.div(d2)
	#var forca_gravitacional = 
	
	assert(gravitacao_universal.copy().mult(slice).unidades == newton)
	assert(gravitacao_universal.copy().mult(slice).value > 9.799)
	#print('Força da gravidade aqui na terra: ',gravitacao_universal.copy().mult(slice).print().value)
	gravitacao_universal.copy().mult(slice).print('Força da gravidade aqui na terra')
	
	#var _accel = 
	
	#var gravitacao = gravitacao_universal.mult()
func assert_pow_vars():
	var x1 = R.new().a(1, [1,0,0])
	assert(R.new().a(1, [1,0,0]).unidades == [1,0,0])
	assert(R.new().a(1, [1,0,0]).po().unidades == [2,0,0])
	assert(R.new().a(1, [1,0,0]).po().unidades == [2,0,0])
	assert(R.new().a(x1.value, x1.unidades).po().unidades == [2,0,0])
	assert(R.new().a(x1.value, x1.unidades).po().unidades == [2,0,0])
	assert(x1.po().unidades == [2,0,0])
	assert(x1.po().unidades == [4,0,0])
	
	assert(R.new().a(massa_terra.value, massa_terra.unidades).unidades == [1, 0, 0])
	assert(R.new().a(massa_terra.value, massa_terra.unidades).po().unidades == [2,0,0])
	assert(R.new().a(massa_terra.value, massa_terra.unidades).unidades ==[1, 0, 0] )
	assert(massa_terra.po().value > 35680695182223 * pow(10,21))

func run_tests():
	assert_pow_vars()
	assert_gravity()
	assert(Peso.new().instance(4,2).value == 4)
	assert(Peso.new().instance(2,3).unidades[0] == 3)
	assert(Distancia.new().instance(4,2).value == 4)
	assert(Tempo.new().instance(4,2).value == 4)
	assert(Distancia.new().instance(pow(6378137, 2), 2).value == 40680631590769)
	
	
	
	var t: Tools = Tools.new()
	assert(t.sum_dimensions([0,3,1], [1,1,1]) == [1,4,2])
	assert(t.sub_dimensions([0,3,1], [1,1,1]) == [-1,2,0])
	assert(Distancia.new().instance(10, 2).check_duplicated_units(Distancia.new().instance(10, 2)) == true)
	assert(Distancia.new().instance(100, 2).sqt().value == 10)
	assert(Distancia.new().instance(9, 2).sqt().value == 3)
	assert(Distancia.new().instance(81, 2).sqt().value == 9)
	assert(Distancia.new().instance(100, 2).sqt().unidades == [0,1,0])
	assert(Distancia.new().instance(27, 3).sqt(3).value == 3)
	assert(Distancia.new().instance(27, 3).sqt(3).unidades == [0,1,0])
	assert(Distancia.new().instance(10, 2).check_duplicated_units(R.new().a(10, [0,2,0])))
	assert(R.new().a(10, [0,2,1]).check_duplicated_units(Distancia.new().instance(10, 2)) == false)
	assert(R.new().a(10, [0,2,1]).check_duplicated_units(R.new().a(10, [0,1,2])) == false)
	assert(R.new().a(10, [0,2,1]).check_duplicated_units(R.new().a(10, [0,2,1])) == true)
	assert(R.new().a(10, [2,0,1]).invert().unidades == [-2,0,-1])
	assert(R.new().a(10, [2,0,1]).invert().value == 10)
	#print(Tools.new().get_e_exp(0.00000006678) == 11)
