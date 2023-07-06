on = true;
with ( con_render )
{
	surface_set_target(water_surf);
	with ( other )
	{
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_circle(x, y, sprite_width*.5, false);
	}
	surface_reset_target();
}

part_type_color3(p_type, c_magenta, c_yellow, c_red);
part_type_size(p_type, .5, 1, -.01, 0);

var aud = con_audio.play_sound_at(snd_fireball_3, x, y, 32, 16);
audio_sound_pitch(aud, random_range(1, 2));
audio_sound_set_track_position(aud, .2);

triggered = false;