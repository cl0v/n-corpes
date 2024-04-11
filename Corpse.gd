extends Node2D

const SCALE_IMAGE_RESIZE = 0.01
const SCALE_SPEED = pow(10, 14)
const SCALE_MASS = 10000

# Considerando a massa em Kg
@export var massa: float = 78
# Constante material em kg/mˆ2 (ou mˆ3 em 3D)
@export var densidade: float = 1


# Corpos considerados
var Cs = {}


var area = 0
var raio = 0

var repulsion_dir = Vector2()
var repulsion_acceleration:float = 100
var repulsion_F = massa * repulsion_acceleration



# Called when the node enters the scene tree for the first time.
func _ready():
	#massa *= SCALE_MASS
	area = pow(densidade / massa, -2) * SCALE_IMAGE_RESIZE
	raio = sqrt(area/PI)
	print('Area :', planet_name , ": " , area)
	print('Radio :', planet_name , ": " , raio)
	var shape = CircleShape2D.new()
	shape.set_radius(raio)
	$Area2D/CollisionShape2D.shape = shape
	Cs[planet_name]=[]
func _draw():
	draw_circle(Vector2(0,0), raio, Color.WHITE)


#@export var gravity_field_r: float = 98.1


# Representado em raio de metro quadrado (todos os corpos de prova são circulares)
# Medida em metros
# Para 3D será o valume
var F: float

@export var planet_name: String = "Planet 0"

#var g_force:float = 9.807 
var BigG: float = 6.674184 * pow(10, -11) # mˆ3 * kgˆ-1 * s^-2
#var BigG: float = 6.674184 * pow(10, -6) # mˆ3 * kgˆ-1 * s^-2

# m/s^2 = velocidade/tempo 
# PI * r^2

# F = G * (massa_1*massa_2)
#            distanciaˆ2
# 6 * 10^-11 * mˆ3 * kgˆ-1 * s^-2 


func _process(delta):
	if(Cs.is_empty()):
		return
	for c in Cs:
		var cmass = Cs[c][0]
		var cpos = Cs[c][1]
		var F = calc_force(cmass, cpos)
		var dir = calc_dir(cpos)
	
		var accel = (F / massa) * SCALE_SPEED
		var repulsion_accel = (repulsion_F / massa) * SCALE_SPEED
		#print_planet_prop('Acel', accel)
		global_position += dir * delta * accel
		global_position += repulsion_dir * delta * repulsion_accel
		#print_planet_prop('GPos', global_position)
	



func gravitacional_universal_law(
	# Massa do corpo secundário.
	body_mass: float,
	# Posição global do corpo secundário
	body_global_position: Vector2,
	# Nome atribuido ao planeta
	body_name: String):
	Cs[body_name] = [body_mass, body_global_position]

func print_cs():
	print_planet_prop('Lista',Cs)
	
	#var distance = get_global_position().distance_to(body_global_position)
	#
	#direction = get_global_position().direction_to(body_global_position)
	#F = BigG * (massa * body_mass) / pow(distance, 2)
	#
	#Fs[body_name] = [F, direction]
	#m*kg*s^2

func calc_force(body_mass: float, body_global_position: Vector2):
	var distance = get_global_position().distance_to(body_global_position)
	return BigG * (massa * body_mass) / pow(distance, 2)

func calc_dir(body_global_position: Vector2):
	return  get_global_position().direction_to(body_global_position)
	

func print_planet_prop(text:String, value, extra:String=''):
	print(planet_name,' :> ', text,' ', extra ,' : ',value)
	


func _on_area_2d_area_entered(area):
	var c = area.get_parent()
	if(c.Cs.has(planet_name)):
		c.Cs.erase(planet_name)
		Cs.erase(c.planet_name)

