extends RigidBody2D


@export var gravity_field_r: float = 9.81
@export var multiplier: float = 2
@export var massa_total: float
@export var raio_area: float = .2


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _ready():
	#if(massa_total == null):
		#massa_total = raio_area
	#elif(raio_area == null ):
		#$Sprite2D.scale = Vector2(10,10)*1000
		
	var shape = CircleShape2D.new()
	shape.set_radius (gravity_field_r+raio_area)
	
	$CollisionShape2D.shape = shape
