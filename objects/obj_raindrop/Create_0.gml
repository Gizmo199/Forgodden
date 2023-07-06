image_xscale = random_range(1, 2);
image_yscale = image_xscale;

if ( place_meeting(x, y, obj_block) ) { instance_destroy(); exit; }

if ( place_meeting(x, y, obj_cloud) )
{
	with ( con_render )
	{
		if ( surface_exists(water_surf) )
		{
			surface_set_target(water_surf);
			with ( other )
			{
				draw_self();	
			}
			surface_reset_target();	
		}
	}
	
	visible = true;
}

alarm[0] = 2;