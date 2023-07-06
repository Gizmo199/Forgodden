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