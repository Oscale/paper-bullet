extends Area2D 

@export var speed = 600 #export allows you to change the value of a varible in the inspector
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Resets the player's movement vector to (0,0) every frame. (By default, the player should not be moving.)
	#At the same time, this also initialzes velocity variable to be a vector in R2. 
	var velocity = Vector2.ZERO 
	
	#Checks if keys associated with the action we created under [project settings->input map] are bieng pressed
	#Then we add or subtract 1 from the velocity vector accordingly. 
	#For example, if you hold right and down the resulting vector will be (1,1) and the character will move downwards
	#Since the velocity vecotr is reset every tick the velocity will not grow to be greater than 1.
	if Input.is_action_pressed("move_right"): 
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		#When the player is moving diagonally, they move faster because they are moving with a speed of 1 in both directions
		#we fix this with the "normalized()" function which sets velocity back to 1.  
		velocity = velocity.normalized() * speed		
		
	#delta represents the amount of time the prev. frame took to complete. using this value ensures your movement will remain constant.
	position += velocity * delta 
	#the clamp() function prevents a vector from going past a set of desired coordinates, in this case, the screen size.
	position = position.clamp(Vector2.ZERO, screen_size) 
