//audio_master_gain(0);

function play_sound(sound_id)
{
	///@func play_sound(sound_id, *volume, *pitch, *track_pos, *loop);
	var pl_sn = [ sound_id, 1, 1, 0, false ];
	for ( var i=0; i<argument_count; i++ )
	{
		pl_sn[i] = argument[i];	
	}
	
	var aud = audio_play_sound(pl_sn[0], .5, pl_sn[4]);
	audio_sound_gain(aud, pl_sn[1], 0);
	audio_sound_pitch(aud, pl_sn[2]);
	
	var len = audio_sound_length(pl_sn[0]);
	audio_sound_set_track_position(aud,	len * pl_sn[3]);
	
	return aud;
}
function play_sound_fade(sound_id)
{
	///@func play_sound_fade(sound_id, *volume, *pitch, *track_pos, *loop, *fade_time);
	
	// Example: Fade-in
	// play_sound_fade(sound1, 1, 1, 0, true, 1000); <- Fades sound to the volume 1 over 1000 iterations
	// play_sound_fade(sound1, 1, 1, 0, true, -1000); <- Fades sounds from the volume 1 to 0 over 1000 iterations
	
	var pl_sn = [ sound_id, 1, 1, 0, false, 0 ];
	for ( var i=0; i<argument_count; i++ )
	{
		pl_sn[i] = argument[i];	
	}
	
	var aud = audio_play_sound(pl_sn[0], .5, pl_sn[4]);
	var ato = pl_sn[1];
	if ( sign(pl_sn[5]) > 0 )
	{
		audio_sound_gain(aud, 0, 0);
	}
	else
	{
		audio_sound_gain(aud, pl_sn[1], 0);	
		ato = 0;
	}
	audio_sound_gain(aud, ato, abs(pl_sn[5]));
	audio_sound_pitch(aud, pl_sn[2]);
	
	var len = audio_sound_length(pl_sn[0]);
	audio_sound_set_track_position(aud,	len * pl_sn[3]);
	
	return aud;
}
function play_sound_at(sound_id, _x, _y, _fr, _fd)
{
	///@func play_sound_at(sound_id, _x, _y, falloff_ref, falloff_dist, *volume, *pitch, *loop);
	var pl_sn = [ sound_id, _x, _y, _fr, _fd, 1, 1, 1, false ];
	for ( var i=0; i<argument_count; i++ )
	{
		pl_sn[i] = argument[i];	
	}
	
	var aud = audio_play_sound_at(pl_sn[0], pl_sn[1], pl_sn[2], 0, pl_sn[3], pl_sn[4], 1, pl_sn[8], .5);
	audio_sound_pitch(aud, pl_sn[7]);
	audio_sound_gain(aud, pl_sn[6], 0);
	
	return aud;
}
function play_sound_at_fade(sound_id, _x, _y, _fr, _fd)
{
	///@func play_sound_at_fade(sound_id, _x, _y, falloff_ref, falloff_dist, *volume, *pitch, *loop, *fadetime);
	var pl_sn = [ sound_id, _x, _y, _fr, _fd, 1, 1, 1, false, 0 ];
	for ( var i=0; i<argument_count; i++ )
	{
		pl_sn[i] = argument[i];	
	}
	
	var aud = audio_play_sound_at(pl_sn[0], pl_sn[1], pl_sn[2], 0, pl_sn[3], pl_sn[4], 1, pl_sn[8], .5);
	audio_sound_pitch(aud, pl_sn[7]);
	
	var v = pl_sn[6];
	if ( pl_sn[9] < 0 )
	{
		v = 0;
		audio_sound_gain(aud, pl_sn[6], 0);
	}
	else
	{
		audio_sound_gain(aud, 0, 0);
	}	
	audio_sound_gain(aud, v, abs(pl_sn[9]));
	
	return aud;
}


audio_falloff_set_model(audio_falloff_exponent_distance);
audio_listener_orientation(0, 0, 1, 0, -1, 0);

// Room ambience
ambience = play_sound_fade(amb_room, .5, 1, 0, true, 1000);

// Boss tones
boss_tone = 0;
boss_tone_wait = 0;
boss_tone_arr = [ snd_scarytone_1, snd_scarytone_2, snd_scarytone_3 ];
function play_boss_tone()
{
	if ( !boss_tone_wait )
	{
		if ( !audio_is_playing(boss_tone_arr[boss_tone]) )
		{
			play_sound(boss_tone_arr[ boss_tone ], 1);
		}
		boss_tone++;
		if ( boss_tone > 2) boss_tone = 0;
		
		boss_tone_wait = 400;
	}
}
