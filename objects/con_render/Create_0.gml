reflect_surf = -1;
water_surf = -1;

whiteout = -.3;

screen_shake(0);

psys = part_system_create();
p_type = part_type_create();
p_type2 = part_type_create();

part_type_direction(p_type, 0, 360, .5, 10);
part_type_speed(p_type, .01, .2, 0, 0);
part_type_alpha3(p_type, 0, 1, 0);
part_type_color3(p_type, c_magenta, c_yellow, c_red);
part_type_life(p_type, 240, 600);

part_type_direction(p_type2, 0, 360, .5, 10);
part_type_sprite(p_type2, sp_fire_part, 0, 0, 1);
part_type_size(p_type2, .2, .1, 0, 0);
part_type_speed(p_type2, .1, 1, 0, 0);
part_type_alpha2(p_type2, 1, 0);
part_type_color3(p_type2, c_magenta, c_yellow, c_red);
part_type_life(p_type2, 15, 60);

repeat(10)
{
	part_particles_create(psys, random(room_width), random(room_height), p_type, 1);	
}
