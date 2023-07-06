var num = instance_number(obj_boss_fire_section);
var total_active = 0;

for ( var i=0;i<num;i++ )
{
	var t = instance_find(obj_boss_fire_section, i);	
	total_active += t.active;
}
if ( total_active == 0 )
{
	state = boss_state_fall;
	con_audio.play_sound(choose(snd_explosion_1, snd_explosion_2));
	exit;
}


var tar = instance_find(obj_boss_fire_section, irandom_range(0, num-1));
while( !tar.active && tar != target )
{
	tar = instance_find(obj_boss_fire_section, irandom_range(0, num-1));	
}
if ( instance_exists(tar) )
{
	target = tar;
}
