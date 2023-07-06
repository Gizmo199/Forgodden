draw_sprite_ext(sprite_index, image_index, x, y-2, .5, grow, -90, c_black, .15);

draw_sprite_part_ext(
	sprite_index, image_index,
	0, 0, sprite_width, sprite_height*grow, 
	x - sprite_width*.25, y + ( sprite_height*(1-grow)) - sprite_height, image_xscale, image_yscale, image_blend,
	image_alpha
);

