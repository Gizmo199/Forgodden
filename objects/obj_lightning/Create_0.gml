depth_enable();
single = true;
light = noone;
alarm[1] = 2;

alpha = 1;
alarm[0] = 5;

height = room_height;
reflected = false;
dir = 0;

with ( con_render )
{
	if ( surface_exists(water_surf) )
	{
		surface_set_target(water_surf);
		with ( other )
		{
			var scl = random_range(.75, 1.25);
			draw_sprite_ext(sp_strike, choose(0,1,2), x, y, scl, scl, random(360), c_white, 1);
		}
		surface_reset_target();
	}
}