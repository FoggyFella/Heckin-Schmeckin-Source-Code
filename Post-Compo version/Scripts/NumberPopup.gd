extends Position2D

var type = ""
var amount = 0
var velocity = Vector2.ZERO
var random_rotation = 0

func _ready():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	$Label.text = str(amount)
	match type:
		"Green":
			$Label.set("custom_colors/font_color", Color("57d219"))
			$Label.set("custom_colors/font_color_shadow", Color("3d970a"))
		"Red":
			$Label.set("custom_colors/font_color", Color("d21940"))
			$Label.set("custom_colors/font_color_shadow", Color("670813"))
	randomize()
	random_rotation = rand_range(-10,10)
	var side_mov = randi() % 81 - 40
	velocity = Vector2(side_mov,50)
	tween.tween_property($Label,"rect_scale",Vector2(1,1),0.3)
	tween.tween_interval(0.3)
	tween.tween_property($Label,"rect_scale",Vector2(0.1,0.1),0.5)
	tween.connect("finished",self,"on_tween_finished")

func on_tween_finished():
	self.queue_free()

func _process(delta):
	randomize()
	random_rotation = rand_range(-10,10)
	rotation_degrees = lerp(rotation_degrees,random_rotation,0.5)
	position -= velocity * delta
