
function sprite_get_data(_spr,_submg, _func)
{
	
	var _surf = -1;
	
	//get sprite data + Set variables
	var _w = sprite_get_width(_spr);
	var _h = sprite_get_height(_spr);

	
	//set surface
	_surf = surface_create(_w,_h);
	
	//draw sprite
	surface_set_target(_surf);
	draw_clear_alpha(0,0);
	draw_sprite(_spr,_submg,0,0)
	surface_reset_target();

	//convert surface to buffer
	
	var _buff = buffer_create(4 * _w * _h, buffer_fast, 1);
	buffer_get_surface(_buff, _surf, 0);
	surface_free(_surf);
	
	for (var _y = 0; _y < _h; ++_y) {
			for (var _x = 0; _x < _w; ++_x) {
					buffer_seek(_buff, buffer_seek_start, 4 * (_x + _y * _w));
					var _r = buffer_read(_buff, buffer_u8);
					var _g = buffer_read(_buff, buffer_u8);
					var _b = buffer_read(_buff, buffer_u8);
					//var _a = buffer_read(_buff, buffer_u8);
					
					var _col = make_color_rgb(_r,_g,_b);
					
					_func(_x, _y, _col)

			}
	}
	//clean up
	buffer_delete(_buff);
	surface_free(_surf);
	
}