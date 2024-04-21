class_name Distancia extends R

func instance(value: float = 1, dimension: int = 1, preffix=null) -> R:
	return a(value, [0, dimension, 0], ['',preffix,''])
