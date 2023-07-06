z = 0;
zspeed = -4;
target = { x : x, y : y }

var scale = random_range(.5, .75);
image_xscale = scale;
image_yscale = scale;

with ( con_render )
{
	if ( surface_exists(water_surf) )
	{
		surface_set_target(water_surf);
		with ( other )
		{
			draw_set_color(c_black);
			draw_set_alpha(1);
			draw_circle(x, y, 4, false);
		}
		surface_reset_target();
	}
}
visible = 0;

con_audio.play_sound(choose(snd_fireball_1, snd_fireball_2, snd_fireball_3), 1, 1.5);