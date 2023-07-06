if ( !global._tutorial) exit; 

global._tutorial = false;	
with ( obj_fire_pit )
{
	on = false;
}
audio_stop_sound(hbeat);
	
if ( !triggered )
{
	con_audio.play_sound(snd_fire_hit_1);
}

save_game();