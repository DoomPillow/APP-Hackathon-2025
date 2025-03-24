

//shader_set(shd_redscale);
//draw_surface(application_surface, 0, 0);
//shader_reset();

//var _wwidth =  camer_get_width();
//var _wheight = camer_get_height();


var _dw = display_get_gui_width();
var _dh = display_get_gui_height();

draw_sprite_better(spr_ouch, 0, 0, 0, _dw, _dh, 0, c_white, hurt_alpha * alpha);

var _scale = _dh / 640;
draw_sprite_ext(spr_transition, 0, (_dw + 200) - ((_dw  + 400) * (animcurve_channel_evaluate(trans_curve, trans_in))), 0, _scale, _scale, 0, c_white, 1);
draw_sprite_ext(spr_pixel, 0, (_dw + 500) - ((_dw  + 400) * (animcurve_channel_evaluate(trans_curve, trans_in))), 0, ((_dw  + 400) * (animcurve_channel_evaluate(trans_curve, trans_in))), _dw, 0, c_black, 1);

draw_sprite_ext(spr_transition, 1, (_dw + 200) - ((_dw  + 400) * (1-animcurve_channel_evaluate(trans_curve, trans_out))), 0, _scale, _scale, 0, c_white, 1);
draw_sprite_ext(spr_pixel, 0, -400, 0, _dw * (animcurve_channel_evaluate(trans_curve, trans_out)), _dw, 0, c_black, 1);


if room == rm_main_menu exit;

//

draw_sprite_better(spr_bar, 0, (_dw / 2) - 350, 40, 700, 70, 0, c_white, alpha);
draw_sprite_better(spr_bar, 1, (_dw / 2) - 350, 40, cleanliness * 700, 70, 0, c_white, alpha);

draw_sprite_ext(spr_arrow, 0, (_dw / 2) - 350 + cleanliness * 700 - 10, 45, 3, 3, 0, c_white, alpha);

scribble($"[fa_middle][fa_center]Cleanliness: {round(cleanliness*100)}%").transform(1.5,1.5).blend(c_white, alpha).draw((_dw / 2) - 350 + 350 - 10, 80);

//draw_sprite_ext(spr_bar, 0, room_width - 400, 20, 400 / 8, 2, 0, c_white, 1);
//draw_sprite_ext(spr_arrow, 0,  room_width - 400 + (_goodness / _sockets) * 800, 10, 1, 1, 0, c_white, 1);
//draw_sprite_ext(spr_bar, 1, room_width - 400, 20, ((_goodness / _sockets) * 400) / 8, 2, 0, c_white, 1);

for (var i = 0; i < obj_player.maxhp; i++) {
	var _filled = i > obj_player.hp;
	draw_sprite_ext(spr_heart, _filled, 60 + (64 * i), 70, 3, 3, 0, c_white, alpha);	
}

if obj_player.hp <= 0 {
	scribble("[c_red][fa_middle][fa_center][wheel]YOU ARE DEAD :(").transform(3,3).draw(_dw * 0.5, buttony + 240);	
}

scribble($"[fa_middle][fa_center][alpha, {alpha}]Level {global.level}").transform(2,2).draw(_dw * 0.9, 75);