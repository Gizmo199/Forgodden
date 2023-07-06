if ( irandom_range(-3, 1) )
{
	part_particles_create(psys, random(room_width), random(room_height), p_type, 1);	
}

var s = psys;
var t = p_type2;
with ( obj_fireball )
{
	//if ( irandom_range(-1, 1) )
	//{
		part_type_orientation(t, direction, direction, 0, 0, false);
		part_particles_create(s, x, y + z, t, 1);	
	//}
}