draw_sprite_ext(
	sprite_index, 0,
	x, y, image_xscale, image_yscale, image_angle, c_black, .15
);

//draw_self_stacked(z, 2);
if ( hit ) gpu_set_fog(1, c_white, 1, 1);
draw_sprite_ext(
	sprite_index,
	image_index,
	x, y+z,
	image_xscale,
	image_yscale,
	image_angle, 
	image_blend, 
	image_alpha
);	
if ( hit ) gpu_set_fog(0,0,0,0);

health_draw(16);
