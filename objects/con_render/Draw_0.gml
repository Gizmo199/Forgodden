draw_set_alpha(1);

with ( obj_player )
{
	draw_sprite_ext(sprite, index, x, y, .5, 1, -90, c_black, .15);	
}
with ( obj_enemy )
{
	if ( shadow_enable )
	{
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle-90, c_black, .15);	
	}
}

surface_set_target(reflect_surf);
draw_clear($F3BF00);

var rf = global.__reflectList;
for ( var i=0; i<ds_list_size(rf); i++ )
{
	with ( rf[| i] )
	{
		event_user(0);
	}
}

shader_set(shd_cutout);
shader_set_float("LUM", 1);
draw_surface(water_surf, 0, 0);

surface_reset_target();

shader_set(shd_cutout);
shader_set_float("LUM", 0);
draw_surface_part_ext(reflect_surf, bbox_left, bbox_top, sprite_width, sprite_height, bbox_left, bbox_top, 1, 1, c_white, .5);
shader_reset();

depth_draw_objects();

with ( obj_player )
{
	silhouette_draw();	
}