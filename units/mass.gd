class_name Mass
extends Un

const default_unit: String = 'g' # grama
const default_char: String = 'm' # Massa
const default_dimension:int = 1




func i(_module:float, _dimension: int, _prefix=null)->Mass:
	nome = 'Peso'
	if(_dimension != null):
		dimension=_dimension
	module= _module * getPrefix(_prefix)
	return self

func copy()->Mass:
	var cp = Mass.new().i(module, dimension)
	return cp

func unitString() -> String:
	return 'grama(s)'
