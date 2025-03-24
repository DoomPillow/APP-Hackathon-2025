

view_width = display_get_width()/5;
view_height = display_get_height()/5;

window_scale = 3;
zoom = 2;

window_set_size(view_width*window_scale,view_height*window_scale);

surface_resize(application_surface,view_width*window_scale,view_height*window_scale);

camx = 0;
camy = 0;


view_enabled = true;
view_visible[0] = true;