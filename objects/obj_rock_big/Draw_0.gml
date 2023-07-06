draw_sprite_ext(sp_rock_shadow, 0, x, y, image_xscale*.5, image_yscale*1, 0, c_black, .15 * clamp(image_alpha, 0, 1));

if ( can_kill > 0 && ever_kill )
{
	draw_set_alpha(image_alpha);
	draw_set_color(c_magenta);
	var ssc = 1-(point_distance(z,0,zstart,0)/abs(zstart));
	draw_circle(x, y, sprite_width*image_xscale*(1-(ssc))*.5, false);
	draw_circle(x, y, sprite_width*image_xscale*.5, true);
	draw_set_alpha(1);
}

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y + z,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);