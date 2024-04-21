extends Node


func d(_module:float, _dimension: int = 1, _prefix=null) -> Distance:
	return Distance.new().i(_module, _dimension, _prefix)
func t(_module:float, _dimension: int = 1, _prefix=null) -> Tempo:
	return Tempo.new().i(_module, _dimension, _prefix)
func m(_module:float, _dimension: int = 1, _prefix=null) -> Mass:
	return Mass.new().i(_module, _dimension, _prefix)


# Called when the node enters the scene tree for the first time.
func _ready():
	Tests.new().i(d(1),t(1),m(1)).run_all()
	

func _input(event):
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit()

class Tests:
		
	func dd(_module:float, _dimension: int = 1, _prefix=null) -> Distance:
		return Distance.new().i(_module, _dimension, _prefix)
	func tt(_module:float, _dimension: int = 1, _prefix=null) -> Tempo:
		return Tempo.new().i(_module, _dimension, _prefix)
	func mm(_module:float, _dimension: int = 1, _prefix=null) -> Mass:
		return Mass.new().i(_module, _dimension, _prefix)
	func cc(items) -> M:
		return M.new().i(items)

	# Deprecated
	var m
	var s
	var g
	func i(m,s,g):
		self.m=m
		self.s=s
		self.g=g
		return self
	
	func run_all():
		first_law()
		workbanch_run()
		tmp_run()
		
		# Newer less important
		
		# Older important
		test_print()
		test_un_module()


	func workbanch_run():
		test_the_reduce_distortion()
		
		
		
		# Multiplicat m com m _multi_mm
	
		
		#var g = Operators.div()
		#var forca = Operators.mult(d(77),)
		#assert(Operators._send_mult(dd(77, 3), tt(10, 1)) == {'m':3, 's':1})
		#Operators._mult_module({'m':3, 's':1}, {'g':1, 's':1, 'm':1},) == {'m':4, 's': 2, 'g':1}
		pass
	
	func test_un_module():
		var _r = dd(20,2)
		assert(_r.getMod1().module == 1)
		assert(_r.module == 20)
		assert(_r.getMod1().dimension == 1)
		assert(_r.dimension == 2)
	
	func test_the_reduce_distortion():
		# Reduced M
		var m1 = M.new().i([dd(77), tt(10,2), dd(10, 2), mm(20, 2)]).reduce()
		var m2 = M.new().i([dd(77), dd(10, 2), mm(20, 2)]).reduce()
		
		assert(m2.tl.size() == 0)
		
		assert(m1.dl[0] == dd(770, 3))
		assert(m1.tl[0] == tt(10, 2))
		assert(m1.ml[0] == mm(20, 2))
	
	
	func test_print():
		# Testa as principais funcoes de print
		pass 
	
	func tmp_run():
		ok_sum()
		err_sum()
		ok_sub()
		err_sub()
		single_unit_multip_divide_dimension()
		assert_multip_unit()
		assert_multip_M()
	
	func assert_multip_M():
		var m1 = M.new().i([dd(77), tt(10,2)])
		var m2 = M.new().i([dd(77), tt(10,2)])
		
		var mult = Operators.mult(m1, dd(76))
		var mult2 = Operators.mult(dd(76), m2)

		#var expected = M.new().i([dd(77), dd(76), tt(10,2)])
		assert(mult.dl[0].module == 77)
		assert(mult.dl[1].module == 76)
		assert(mult.tl[0].module == 10)
		assert(mult2.dl[0].module == 77)
		assert(mult2.dl[1].module == 76)
		assert(mult2.tl[0].module == 10)
	
	func assert_multip_unit():
		var mult = Operators.mult(dd(77), tt(10,2))
		var expected = M.new().i([dd(77), tt(10,2)])
		assert(mult.ml == expected.ml)
		assert(mult.ml.size() == expected.ml.size())
		assert(mult.dl.size() == expected.dl.size())
		assert(mult.dl[0].module == 77)
		assert(mult.tl.size() == expected.tl.size())
		
	
	func single_unit_multip_divide_dimension():
		var mult = Operators.mult(dd(77,3), dd(10,1))
		var compareTo = dd(770,4)
		assert(mult.module == compareTo.module)
		assert(mult.dimension == compareTo.dimension)
		assert(is_instance_of(mult, Distance))
		
		var div = Operators.div(dd(90,3), dd(9,1))
		compareTo = dd(10,2)
		assert(div.module == compareTo.module)
		assert(div.dimension == compareTo.dimension)
		assert(is_instance_of(div, Distance))
		

	func first_law():
		assert(m is Distance)
		assert(is_instance_of(m, Distance))
		assert(s is Tempo)
		assert(is_instance_of(s, Tempo))
		assert(g is Mass)
		assert(is_instance_of(g, Mass))
		assert(m != m.copy(), 'Uma unidade deve ser diferente de sua copia')
		assert(m == m, 'Uma unidade deve ser igual a ela mesma')

	func ok_sum():
		var m1 = m.copy().i(10, 2)
		var m2 = m.copy().i(20, 2)
		var m3 = Operators.sum(m1, m2)
		assert(m3.module == 30)
		assert(m3.dimension == 2)

	func err_sum():
		var m1 = m.copy().i(10, 2)
		var m2 = m.copy().i(20, 1)
		var m3 = Operators.sum(m1, m2)
		assert(m3 is String)

	func ok_sub():
		var m1 = m.copy().i(10, 2)
		var m2 = m.copy().i(20, 2)
		var m3 = Operators.sub(m1, m2)
		assert(m3.module == -10)
		assert(m3.dimension == 2)
		
	func err_sub():
		var m1 = m.copy().i(10, 2)
		var m2 = m.copy().i(20, 1)
		var m3 = Operators.sub(m1, m2)
		assert(m3 is String)
