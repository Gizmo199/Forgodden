if ( reflected )
{
	draw_sprite_ext(
		sprite_index, 
		image_index,
		x, y,
		1, 10,
		dir, 
		c_yellow,
		alpha
	);
}
else
{
	draw_sprite_stretched_ext(
		sprite_index,
		image_index,
		x, y,
		sprite_width,
		height,
		image_blend,
		alpha
	);	
}

with ( light )
{
	gpu_set_blendmode(bm_add);
	draw_self();	
	gpu_set_blendmode(bm_normal);
}