class_name Distance
extends Un

const default_unit: String = 'm' # metro
const default_char: String = 'd' # Distancia
const default_dimension:int = 3

func i(module, dimension, prefix=null, nome='Distance') -> Distance:
	return super._I(module, dimension, prefix, nome)

func unitString() -> String:
	return 'metro(s)'

