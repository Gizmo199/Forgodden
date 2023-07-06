if ( !surface_exists(reflect_surf) ) { reflect_surf = surface_create(room_width, room_height); }
if ( !surface_exists(water_surf) ) { 
	water_surf = surface_create(room_width, room_height);
	
	surface_set_target(water_surf);
	draw_clear(c_black);
	surface_reset_target();
}
