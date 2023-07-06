can_grow = !can_grow;
alarm[0] = grow_time;

if ( sound_id != -1 )
{
	con_audio.play_sound_at(sound_id, x, y, 100, 64);	
	sound_id = -1;
}

can_die = true;