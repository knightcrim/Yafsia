@tool
extends Node3D

@onready var eye_left_position: Marker3D = get_node("%eye_left_position")
@onready var eye_left_color: Sprite3D = get_node("%eye_left_color_sprite")
@onready var eye_left_sprite: Sprite3D = get_node("%eye_left_sprite")

@onready var eye_right_position: Marker3D = get_node("%eye_right_position")
@onready var eye_right_color: Sprite3D = get_node("%eye_right_color_sprite")
@onready var eye_right_sprite: Sprite3D = get_node("%eye_right_sprite")

@onready var nose_position: Marker3D = get_node("%nose_position")
@onready var nose_sprite: Sprite3D = get_node("%nose_sprite")

@onready var mouth_position: Marker3D = get_node("%mouth_position")
@onready var mouth_sprite: Sprite3D = get_node("%mouth_sprite")

@onready var hair_position: Marker3D = get_node("%hair_position")

@export_group("Appearance")
@export var eyes: Eyes = preload("res://data/characters/components/eyes_01.tres"):
    set(new_eyes):
        eyes = new_eyes
        if is_node_ready():
            eye_left_sprite.texture = new_eyes.eye
            eye_right_sprite.texture = new_eyes.eye
            if new_eyes.eye_color:
                eye_left_color.texture = new_eyes.eye_color
                eye_right_color.texture = new_eyes.eye_color
            else:
                eye_left_color.texture = null
                eye_right_color.texture = null
@export var eye_color: Color = Color.SADDLE_BROWN:
    set(new_clr):
        eye_color = new_clr
        if is_node_ready() and eyes.eye_color:
            eye_left_color.modulate = eye_color
            eye_right_color.modulate = eye_color
@export var nose: Nose = preload("res://data/characters/components/nose_01.tres"):
    set(new_nose):
        nose = new_nose
        if is_node_ready():
            nose_sprite.texture = new_nose.nose
@export var mouth: Mouth = preload("res://data/characters/components/mouth_01.tres"):
    set(new_mouth):
        mouth = new_mouth
        if is_node_ready():
            mouth_sprite.texture = new_mouth.mouth
@export var hair: Hair = preload("res://data/characters/components/hair_01.tres"):
    set(new_hair):
        hair = new_hair
        if is_node_ready() and new_hair.hair:
            var hair_scn = new_hair.hair.instantiate()
            hair_position.add_child(hair_scn)
            hair_mesh = hair_scn.get_child(0)
            if hair_mesh:
                hair_color = hair_color

@export var hair_color: Color = Color(0.251, 0.11, 0.012):
    set(new_clr):
        hair_color = new_clr
        if is_instance_valid(hair_mesh):
            var hair_material = StandardMaterial3D.new()
            hair_material.albedo_color = new_clr
            hair_material.diffuse_mode = BaseMaterial3D.DIFFUSE_TOON
            hair_material.specular_mode = BaseMaterial3D.SPECULAR_TOON
            hair_material.roughness = 0.5
            for om in hair_mesh.get_surface_override_material_count():
                hair_mesh.set_surface_override_material(om, hair_material)

var hair_mesh: MeshInstance3D

func _ready():
    eyes = eyes
    eye_color = eye_color
    nose = nose
    mouth = mouth
    hair = hair
    hair_color = hair_color
