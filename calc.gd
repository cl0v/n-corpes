extends Node2D

## Legenda
# Letra; vírgula; Valor numérico; ('m', 3) é pow('m', 3) 

var relacoes: Dictionary = {
	'v' = "'m', 3", # Volume
	'd' = "'g'/ 'm', 3", # Densidade
	
}

const area: Dictionary= {'m': 2}
const volume: Dictionary= {'m': 3}
const densidade: Dictionary = {'m': -3, 'g': 1}
const aceleracao: Dictionary = {'m': 1, 's':-2}
const newton: Dictionary = {'m': 1, 's':-2, 'kg': 1}
const t:  Dictionary= {'s': 2}
const tempo:  Dictionary= {'s': 2}
const m:String = 'm'
const s:String = 's'
const g:String = 'g'
# Como algumas unidades como Newton precisam de kg
# Se ve a necessidade de implementa o kg logo.
const kg: String = 'kg'

#main
func _ready():
	
	run_tests()
	var r_massa = r(5.972 * pow(10,24), {kg : 2})
	var r_distancia = r(pow(6.371 * pow(10, 6), 2), {'m': 2})
	var gravitacao: R = r(6.67408*pow(10, -11), newton).mult(r(1, area)).mult(r(1, {kg: -2}))
	#var x = r(5.972 * pow(10,24) * )
	#gravitacao.print('Gravitação')
	#var r_massa = r(5.972 * pow(10,24), {kg : 2})
	#var r_distancia = r(pow(6.371 * pow(10, 6), 2), {m: 2})
	##var r_massa = r(1, {kg : 1})
	##var r_distancia = r(1, {m: 1})
	#
	#var x2 = r_massa.div(r_distancia)
	#var x1 = x2.invert()
	#
	#var x0 = r_massa.sqt().div(r(1.5569243271*pow(10,19), tempo))
	#var sqrt_massa = r_massa.sqt()
	#
	#sqrt_massa.mult(x0).mult(x1).mult(x2).print('Terra gravidade')
	
	#var final = x2.mult(x1)
	#var inicio = r_massa.sqt().mult(r_distancia.sqt())
	##inicio.print('i')
	##print(sqrt(inicio.value))
	#var tempo = inicio.sqt()
	#tempo.print()
	#var s2 = r_massa.mult(r_distancia).mult(r_distancia.mult(r_distancia).div(r_massa.mult(r_massa)))
	#gravitacao.mult(x2).print('Força da Gravidade')
	#s2.mult(x2).print('S2')
	#var forca_gravitacional = gravitacao.mult(massa.div(distancia))
	##var acc = r(77, {'kg':1}).div(forca_gravitacional)
	#forca_gravitacional.div(r(1, {kg:1})).print()
	#var x = distancia.div(massa) # d2/M.m
	#var x = x_massa.div(x_distancia).invert()
	#var x2 = x_massa.div(x_distancia)
	#var reduce_force = x2.mult(x.invert())
	#r(1, {kg:1}).mult(reduce_force).print()
	#r(1,{kg:1}).mult(r(1,{m:1})).mult(x)
	
	#gravitacao.div(x).print()
	
	#var forca_resultante = u(0.1, kg, 1).mult_r(r(50, aceleracao))
	#r(100, newton).print()
	#
	#var relacaoDensidadeFerro = u(7.85 * pow(10, 6), g).div_au(u(1,m,3))
	#var rdFerro= r(7.85 * pow(10, 6), densidade)
	#var relacaoDensidadeFerro2 = relacaoDensidadeFerro.mult(relacaoDensidadeFerro)
	#relacaoDensidadeFerro2.print()
	
# Doc [read]:
	# Lê a forma correta de pronunciar a expressão.
	# Com Valor e Unidade. 
	# Ex: 10 metros; 12 segundos; 12 segundos ao quadrado, etc.
func u(value: float, unit: String, dimension: int = 1) -> U:
	var u = U.new()
	u.a(value, unit, dimension)
	#u.read_pt(value, unit, dimension)
	return u

func r(value: float, unit_dimension: Dictionary) -> R:
	var r = R.new()
	r.a(value, unit_dimension)
	return r

func run_tests():
	var t: Tools = Tools.new()
	print(t.sum_dimensions({'m':3, 's':1}, {'g':1, 's':1, 'm':1},) == {'m':4, 's': 2, 'g':1})
	print(t.sub_dimensions({'m':3, 's':1}, {'g':1, 's':1, 'm':1},) == {'m':2, 's': 0, 'g':-1})
	print(R.new().a(10, {'m':2}).check_duplicated_units(R.new().a(10, {'m':2})) == true)
	print(R.new().a(100, {'m':2}).sqt().value == 10)
	print(R.new().a(9, {'m':2}).sqt().value == 3)
	print(R.new().a(81, {'m':2}).sqt().value == 9)
	print(R.new().a(100, {'m':2}).sqt().unidades == {'m':1})
	print(R.new().a(10, {'m':2}).check_duplicated_units(R.new().a(10, {'m':1})) == false)
	print(R.new().a(10, {'m':2, 'f': 1}).check_duplicated_units(R.new().a(10, {'m':2})) == false)
	print(R.new().a(10, {'m':2, 'f': 1}).check_duplicated_units(R.new().a(10, {'f':2, 'm':1})) == false)
	print(R.new().a(10, {'f':1, 'm': 2}).check_duplicated_units(R.new().a(10, {'m':2, 'f':1})) == true)
	print(R.new().a(10, {'f': 1, 'a': 2}).invert().unidades == {'f': -1, 'a': -2})
	print(R.new().a(10, {'f': 1, 'a': 2}).invert().value == 10)
	#print(Tools.new().get_e_exp(0.00000006678) == 11)
