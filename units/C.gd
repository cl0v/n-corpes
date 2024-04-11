class_name C extends Node3D
# Representa a coexistência das 3 unidades, mesmo quando não presente (dimensão = 0)

var total_mass: Array[Mass] = []
var total_distance: Array[Distance] = []
var total_tempo: Array[Tempo] = []


func reduce():
	# Reduz os 3 arrays para um unico elemento com a soma de todos.
	pass
