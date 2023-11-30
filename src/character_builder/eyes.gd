class_name Eyes
extends CharacterBuilderComponent

@export_group("Eyes")
##Texture used for eyes.
@export var eye: Texture
##Texture used for eye color. Optional.
@export var eye_color: Texture
##Offset x, y, z of Eye Color
@export var color_offset: Vector3 = Vector3(0,0,0)
@export var color_scale: float = 0.0