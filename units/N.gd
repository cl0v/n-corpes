class_name N
extends Un

const default_unit: String = 'n' # Neutro
const default_char: String = 'n' # Neutro
const default_dimension:int = 3

func i(_module:float, _dimension: int, _prefix=null)->N:
	if(_dimension != null):
		dimension=_dimension
	module= _module * getPrefix(_prefix)
	return self

func copy()->N:
	var cp = N.new().i(module, dimension)
	return cp

func unitString() -> String:
	return 'neutro(s)'

