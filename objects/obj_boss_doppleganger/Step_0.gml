health_update(x, y);
state();

if ( stop_when_in_area && point_distance(x, y, obj_player.x, obj_player.y) < 96 && 
	point_distance(x, y, xstart, ystart) < 10 )
	{
		audio_stop_sound(msc_drums);
		audio_stop_sound(msc_hihats);
		con_audio.play_sound(msc_drums_end);	
		
		stop_when_in_area = false;
	}
	
if ( audio_is_playing(drums) && audio_is_playing(hhats) )
{
	audio_sound_set_track_position(hhats, audio_sound_get_track_position(drums));
}