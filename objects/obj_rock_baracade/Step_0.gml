var c = collision_circle(x, y, sprite_width*.8, obj_spike, false, true); 
if ( c && can_hit )
{
	hp-=c.damage;
	instance_destroy(c);

	can_hit = false;
	flash = true;
	alarm[0] = 5;

	if ( hp <= 0 )
	{
		instance_destroy();	
	}
	else
	{
		con_audio.play_sound_at(choose(snd_fire_hit_1, snd_fire_hit_2), x, y, 100, 64);	
	}
}	

health_update(x, y);
if ( !can_hit )
{
	if ( !instance_exists(obj_spike) )
	{
		can_hit = true;	
	}
}