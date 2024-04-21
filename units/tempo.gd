#class_name Tempo
#extends Un
#
#const default_unit: String = 's' # segundo
#const default_char: String = 't' # Tempo
#const default_dimension:int = 2
#
#func i(_module:float, _dimension: int, _prefix=null)->Tempo:
	#nome = 'Tempo'
	#if(_dimension != null):
		#dimension=_dimension
	#module= _module * getPrefix(_prefix)
	#return self
#
#func copy()->Tempo:
	#var cp = Tempo.new().i(module, dimension)
	#return cp
#
#func unitString() -> String:
	#return 'segundo(s)'
