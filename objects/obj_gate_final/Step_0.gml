if ( triggered )
{
	if ( !place_meeting(x, y, obj_player) )
	{
		phy_active = true;	
	}
	
	grow = lerp(grow, 1, speed);
	
	if ( !audio_is_playing(snd_stone_move) )
	{
		audio = con_audio.play_sound(snd_stone_move, 1);	
		audio_sound_gain(audio, 1, 0);
		audio_sound_set_track_position(audio, 1);
	}
}
//else
//{
//	if ( obj_player.y < ( bbox_bottom-32 ) )
//	{
//		phy_active = true;
//		with ( obj_gate_final )
//		{
//			triggered = true;
//			white = true;
			
//			alarm[0] = irandom_range(5, 15);
//		}
		
//		with ( obj_spawner )
//		{
//			triggered = true;
//		}	
//	}
//}

if ( grow > .9 && audio != -1 )
{
	audio_stop_sound(audio);
	if ( !closed && !audio_is_playing(snd_gate_close))
	{
		con_audio.play_sound(snd_gate_close, 1);		
		with ( obj_gate_final )
		{
			closed = true;	
		}
	}
	audio = -1;
}