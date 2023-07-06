draw_sprite_ext(sprite_index,image_index,x,y,.5,1,-90,c_black,.15);
draw_sprite_ext(
	sprite_index,
	image_index,
	x, y - ( 8 + ( sin(current_time/240)*4) ),
	image_xscale,
	image_yscale,
	0,
	c_white,
	1
);