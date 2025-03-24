
if room == rm_main_menu exit;

if !surface_exists(deathsurf) {
	deathsurf = surface_create(room_width + padding, room_height + padding);
}

var _pad = padding * 0.5;

var _radius = 60 + (sin(global.time * 0.015)*10);

surface_set_target(deathsurf);
draw_clear_alpha(c_black, 1);

gpu_set_blendmode(bm_subtract);
draw_circle(obj_player.x + _pad, obj_player.y + _pad, death_radius + _radius, false);
gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(deathsurf, -_pad, -_pad);

