if ( audio_is_playing(rain) )
{
	audio_stop_sound(rain);
}
if ( audio_is_playing(wind) )
{	
	audio_stop_sound(wind);
}
if ( audio_is_playing(msc_drums) && room != rm_boss_to )
{
	audio_stop_sound(msc_drums);
}
con_audio.play_sound(msc_drums_end);