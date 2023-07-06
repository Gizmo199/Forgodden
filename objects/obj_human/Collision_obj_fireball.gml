if ( !hurt ) exit;
instance_destroy();
with ( obj_player )
{
	player_win();
	con_audio.play_sound(snd_human_die, .5);
	
	instance_destroy(obj_tut);
}
instance_destroy(other);