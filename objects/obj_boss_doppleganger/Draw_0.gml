var alpha = image_alpha;

if ( stop_when_in_area )
{
	alpha = 1-(point_distance(x, y, xstart, ystart)/32);
}
draw_sprite_ext(sprite_index,image_index, x, y, .5, 1, -90, c_black, .15);

draw_sprite_ext(
	sprite_index,
	image_index,
	x, y+z,
	image_xscale,
	image_yscale, 
	image_angle,
	image_blend,
	alpha
);
health_draw(16);