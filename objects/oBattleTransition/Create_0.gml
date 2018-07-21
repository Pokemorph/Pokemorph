/// @description Initialize

// initialize the image variables
//400-x1, 160-y1, 1219-x2, 640-y2
image_speed = 0;

ball_spin = 360;
ball_angle = 0;
ball_scale = 1;
animation_step_count = GAME_SPEED*2;

back_x = 810; //these two keep the background in the right place
back_y = 400;
x = back_x; //these two tell the ball where to appear
y = back_y;

separation = 0; //distance from center (y offset)
image_alpha = 0;
target_alpha = 1;
fade_step = 1/animation_step_count;

spin_direction = 1;
step_size = 800/animation_step_count;
spin_step_size = 3;
scale_step_size = 1/animation_step_count;

var rand = irandom_range(0, 3);

switch rand {
	case 0: //roll in from right
		x += step_size*animation_step_count;
		ball_angle -= spin_step_size * animation_step_count;
		break;
	case 1: //roll in from left
		x -= step_size*animation_step_count;
		ball_angle += spin_step_size * animation_step_count;
		break;
	case 2: //spin and shrink from super-sized
		ball_scale = 0;
		ball_angle -= spin_step_size * animation_step_count;
		break;
	case 3: //spin and grow from miniscule
		ball_scale = 2;
		ball_angle -= spin_step_size * animation_step_count;
		break;
	default: break;
}





/*okay so what will this object do? Firstly it will fade to black, set the pokeball to a random size and 
	position, and then roll it in toward this object's x and y coordinate. If the ball is in the same 
	place, it will spin in place for the same timeframe
	Okay, I also need something to keep track of the direction we're spinning, and the number of degrees
	we spin each frame. 
	How long do I give the animation to finish? I'm thinking 2 seconds. Any longer will get tedious. So
	let's store a timer value. Two seconds to fadeout, two seconds to roll the ball, two seconds to open
	it up?