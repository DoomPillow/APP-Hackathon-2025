
while !place_meeting(x + lengthdir_x(1, image_angle), y + lengthdir_y(1, image_angle), par_collidable) && !place_meeting(x + lengthdir_x(1, image_angle), y + lengthdir_y(1, image_angle), par_furniture) {
	image_xscale += ( 1 / 64)
}