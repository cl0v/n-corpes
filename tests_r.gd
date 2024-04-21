class_name TestsR extends Node


func assert_gravity():
	var massa_terra = pes(5973332 * pow(10,21), 1)
	var distancia_terra_mar = dis(pow(6378137, 1), 1)
	var d2 = distancia_terra_mar.mult(distancia_terra_mar)
	var m2 = massa_terra.mult(pes(1,1))
	
	var slice = m2.div(d2)
	
	assert(gravitacao.mult(slice).unidades == newton)
	assert(gravitacao.mult(slice).unidades == newton)
	#var gravitacao = gravitacao_universal.mult()
	
func run_tests():
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
	assert(Distancia.new().instance(27, 3).cibic().value == 3)
	assert(Distancia.new().instance(27, 3).cibic().unidades == [0,1,0])
	assert(Distancia.new().instance(10, 2).check_duplicated_units(R.new().a(10, [0,2,0])))
	assert(R.new().a(10, [0,2,1]).check_duplicated_units(Distancia.new().instance(10, 2)) == false)
	assert(R.new().a(10, [0,2,1]).check_duplicated_units(R.new().a(10, [0,1,2])) == false)
	assert(R.new().a(10, [0,2,1]).check_duplicated_units(R.new().a(10, [0,2,1])) == true)
	assert(R.new().a(10, [2,0,1]).invert().unidades == [-2,0,-1])
	assert(R.new().a(10, [2,0,1]).invert().value == 10)
	#print(Tools.new().get_e_exp(0.00000006678) == 11)
