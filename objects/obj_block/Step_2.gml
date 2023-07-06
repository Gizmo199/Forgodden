with ( con_render )
{
	if ( !surface_exists(water_surf) ) exit;
	surface_set_target(water_surf);
	with ( other )
	{
		draw_set_color(c_black);
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	}
	surface_reset_target();
}