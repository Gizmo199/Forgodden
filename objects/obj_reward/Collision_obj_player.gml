if ( z > -17 )
{
	switch(image_index)
	{
		case 0:
			global._reward.earth.got = true;
		break;
	
		case 1:
			global._reward.fire.got = true;
		break;
	
		case 2:
			global._reward.water.got = true;
		break;
	}
	instance_destroy();
	
	var fl = instance_create_layer(x, y, layer, obj_flash);
	fl.pause_player = false;
	fl.white = .3;
	
	con_audio.play_sound(snd_reward, 1);
}