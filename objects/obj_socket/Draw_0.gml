
if !good {
	var _scale = 1 + (0.05*sin(x + global.time*0.04)); 
	draw_sprite_ext(spr_socket, image_index, x, y, _scale, _scale, 0, c_yellow, 0.8);	
} else {
	draw_sprite_ext(spr_socket, image_index, x, y, 1, 1, 0, c_lime, 0.5);	
}