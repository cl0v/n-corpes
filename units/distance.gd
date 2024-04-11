class_name Distance
extends Un

const default_unit: String = 'm' # metro
const default_char: String = 'd' # Distancia
const default_dimension:int = 3

func i(_module:float, _dimension: int, _prefix=null)->Distance:
	nome = 'Distância'
	if(_dimension != null):
		dimension=_dimension
	module= _module * getPrefix(_prefix)
	return self

func copy()->Distance:
	var cp = Distance.new().i(module, dimension)
	return cp

func unitString() -> String:
	return 'metro(s)'

