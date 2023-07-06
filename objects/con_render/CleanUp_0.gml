if ( surface_exists(reflect_surf) ) surface_free(reflect_surf);
if ( surface_exists(water_surf) ) surface_free(water_surf);

part_type_destroy(p_type);
part_type_destroy(p_type2);
part_system_destroy(psys);

depth_clear();