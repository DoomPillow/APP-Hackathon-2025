
gpu_set_ztestenable(true);

global.time = 0;
global.target_fps = 60;
global.timescale = 1;
global.delta = 0;

scribble_font_bake_outline_4dir("fnt_default", "fnt_outline", c_black, false,);
scribble_font_set_default("fnt_outline");

//application_surface_draw_enable(false);

global.wallcolor = 0;
global.backgroundcolor = 0;
global.level = 0;

window_set_cursor(cr_none);
cursor_sprite = spr_cursor;