extends Node3D

@export_range(0, 100, 1) var camera_move_speed: float = 200.0
@onready var camera_socket: Node3D = $Camera_socket
@onready var camera: Camera3D = $Camera_socket/Camera3D

var camera_can_move_base:  bool = true
var camera_can_process:bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _unhandled_input(event: InputEvent) -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !camera_can_process:return
	camera_base_move(delta)

func camera_base_move(delta:float) -> void:
		if !camera_can_move_base: return
		var velocity_direction: Vector3 = Vector3.ZERO
		
		if Input.is_action_just_pressed("camera_fwd"): velocity_direction -= transform.basis.z
		if Input.is_action_just_pressed("camera_back"): velocity_direction += transform.basis.z
		if Input.is_action_just_pressed("camera_left"): velocity_direction -=transform.basis.x
		if Input.is_action_just_pressed("camera_right"): velocity_direction +=transform.basis.x
		
		position += velocity_direction.normalized() * delta * camera_move_speed
								
