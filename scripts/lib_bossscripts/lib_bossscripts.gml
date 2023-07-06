function play_boss_slam()
{
	if ( hp > 0 )
	{
		var a = con_audio.play_sound_at(choose(snd_slam_1, snd_slam_2), x, y, 100, 128);
		audio_sound_pitch(a, random_range(.5, 1));
		
		con_audio.play_boss_tone();
	}
}
function play_fire_hit()
{
	var sn = choose(snd_fire_hit_1, snd_fire_hit_2);
	var aud = con_audio.play_sound(sn, .5);
	audio_sound_pitch(aud, random_range(1.25, 1.75));	
}