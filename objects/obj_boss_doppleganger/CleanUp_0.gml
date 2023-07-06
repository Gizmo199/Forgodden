with ( obj_gate_final )
{
	instance_destroy();
}	

if ( audio_is_playing(msc_drums) )
{
	audio_stop_sound(msc_drums);
	audio_stop_sound(msc_hihats);
	con_audio.play_sound(msc_drums_end);	
}