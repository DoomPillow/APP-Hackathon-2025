


shader_set(shd_sinewave);
var _time = shader_get_uniform(shd_sinewave, "u_time");
shader_set_uniform_f(_time, global.time);

draw_self();

shader_reset();



scribble("[fa_middle][fa_center][#ffecbf][wheel]House Flipper").transform(2.5, 2.5).draw(x,y+130);