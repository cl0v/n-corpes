extends Node


var Corpse = load("res://corpse.tscn")

const x = 1152
const y = 648

var cl = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _unhandled_input(event):
	if event is InputEventPanGesture:
		$RayCast2D.rotation += deg_to_rad(event.delta.normalized().angle())/2
	if event is InputEventMouseMotion:
		$RayCast2D.position = event.position
	
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var b = Corpse.instantiate()
			
			b.planet_name = build_name(3)
			b.position = event.position
			b.repulsion_dir = Vector2()$RayCast2D.rotation
			b.repulsion_acceleration = float($GUI/DefAcc.text)
			b.massa = float($GUI/Mass.text)
			b.densidade = float($GUI/Dens.text)
			
			add_child(b)
			
			for c in cl:
				b.gravitacional_universal_law(c.massa, c.get_global_position(), c.planet_name)
				c.gravitacional_universal_law(b.massa, b.get_global_position(), b.planet_name)
			cl.append(b)
			

func build_name(letters_count: int) -> String:
	var f = "Planeta-"
	var c = 0
	while(c < letters_count):
		c += 1
		f+= "abcdefghijklmnopqrstuvwxyz"[randi_range(0,24)].capitalize()
	return f
