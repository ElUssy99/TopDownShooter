extends KinematicBody2D

export (float) var rotation_speed = 1

var speed = 250
var rotation_dir = 0
var velocity = Vector2()
var m = Transform2D()

func get_input():
    # Detect up/down/left/right keystate and only move when pressed
    rotation_dir = 0
    velocity = Vector2()
    if Input.is_action_pressed('ui_right'):
        velocity.x += 1
    if Input.is_action_pressed('ui_left'):
        velocity.x -= 1
    if Input.is_action_pressed('ui_down'):
        velocity.y += 1
    if Input.is_action_pressed('ui_up'):
        velocity.y -= 1
    if Input.is_action_pressed('ui_rotation_left'):
        print(m)
        m = m.rotated(-1)
    if Input.is_action_pressed('ui_rotation_right'):
        m = m.rotated(+1)
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    move_and_collide(velocity * delta)