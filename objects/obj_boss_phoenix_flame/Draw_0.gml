draw_set_color(c_magenta);
draw_circle(target.x, target.y, 8, true);

var pd = 1-((-z) / 64);
draw_circle(target.x, target.y, clamp(pd, 0, 1) * 8, false );

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