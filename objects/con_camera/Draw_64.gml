shader_set(sh_lut);
shader_set_sampler("s_Lut", lut_tex);

gpu_set_blendenable(false);
draw_surface_stretched(application_surface, 0, 0, gui.width, gui.height);
gpu_set_blendenable(true);

var app_size = { x : surface_get_width(application_surface), y : surface_get_height(application_surface) }
var scl_x = gui.width / app_size.x;
var scl_y = gui.height / app_size.y;
with ( obj_light )
{
	var coord = coord_to_gui(x * scl_x, y * scl_y);
	draw_sprite_ext(sprite_index, image_index,
	coord.x, coord.y,
	image_xscale * scl_x, image_yscale * scl_y, 
	image_angle, image_blend, image_alpha);
}

shader_reset();

draw_sprite_stretched_ext( sp_vig, 0, 0, 0, gui.width, gui.height, c_white, (1-red_amt)*.5);
gpu_set_fog(1, c_red, 1, 1);
draw_sprite_stretched_ext( sp_vig, 0, 0, 0, gui.width, gui.height, c_white, red_amt*.5);
gpu_set_fog(0,0,0,0);

if ( fadein > 0.05 )
{
	draw_set_alpha(fadein);
	draw_set_color(c_black);
	draw_rectangle(0,0,gui.width,gui.height,false);
	draw_set_alpha(1);
}