view_enabled = true;
view_visible[0] = true;
view_width = 480;
view_height = 270;
view_width_start = view_width;
view_height_start = view_height;

view_buffer_x = x;
view_buffer_y = y;
view_buffer_x = clamp(view_buffer_x, view_width*.5, room_width-view_width*.5);
view_buffer_y = clamp(view_buffer_y, view_height*.5, room_height-view_height*.5);
view_top = 0;
view_bottom = 0;
view_left = 0;
view_right = 0;

zoom = 0;
red = 0;
red_amt = 0;

view_x = view_buffer_x;
view_y = view_buffer_y;
target = id;
camera_set_view_size(view_camera[0], view_width, view_height);
camera_set_view_pos(view_camera[0], x - view_width*.5, y - view_height * .5);

surface_resize(application_surface, view_width, view_height);
gui.set_size(window.width, window.height);

var olay = layer_get_id("Overlay");
paralax_layer = -1;
if ( layer_exists(olay) )
{
	paralax_layer = olay;
}

blay = layer_get_id("Background");
fbxlay = layer_get_fx("Fog");
fadein = 1;
fade_speed = .05;

lut_tex = sprite_get_texture(sp_lut, 0);