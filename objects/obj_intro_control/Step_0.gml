if ( triggered )
{
	if ( target.y > y )
	{
		if ( pitch > .5 )
		{
			pitch+=.01;
			target.y -=.5;	
			
			volume += .005;
			
			if ( irandom_range(-5, 1) )
			{
				part_particles_create(psys, random(room_width), random(room_height), p_type, 1);
			}
		}
		else
		{
			pitch+=.005;	
		}
	}
	else
	{
		if ( choose(0,1) )
		{
			part_particles_create(psys, random(room_width), random(room_height), p_type, 1);
		}
		pitch += .05;
		white += .0035;
	}
}

if ( pitch > 14 )
{
	audio_stop_sound(audio);
	audio_stop_sound(audio2);
	
	con_audio.play_sound(msc_drums_end);
	con_audio.play_boss_tone();
	room_goto(rm_title);
}
screen_shake((pitch/12) * 8);

audio_sound_gain(audio, volume*.5, 0);
audio_sound_pitch(audio, pitch);
audio_sound_gain(audio2, volume, 0);