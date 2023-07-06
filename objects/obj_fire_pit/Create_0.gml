on = true;
triggered = false;
if ( !global._tutorial && room == rm_tutorial ) { on = false; }

depth_enable();

psys = part_system_create();
part_system_automatic_draw(psys, false);

p_type = part_type_create();

part_type_orientation(p_type, -90, -90, 0, 0, 0);
part_type_sprite(p_type, sp_fire_part, 0, 0, 1);
part_type_size(p_type, .5, 1, -.01, 0);
part_type_gravity(p_type, .1, 90);
part_type_alpha2(p_type, 1, 0);
part_type_color3(p_type, c_magenta, c_yellow, c_red);
part_type_life(p_type, 5, 30);

can_sound = true;
active = 5;

audio = con_audio.play_sound(snd_fire, 0, 1, random(1), true);

xscale = 1;
if ( place_meeting(x-1, y, obj_fire_pit) )
{
	xscale = -1;
}	

light = instance_create_layer(x, y, layer, obj_light);
light.image_alpha = 0.2;