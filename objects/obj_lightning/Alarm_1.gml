if ( single )
{
	var thun = con_audio.play_sound_at(snd_thunder, x, y, 100, 128);
	audio_sound_pitch(thun, random_range(1, 4));
	
	light = instance_create_layer(x, y, layer, obj_light);
	light.image_blend = make_color_rgb(255,255,0);
}
