target = { x : 0, y : 0, xstart : 0, ystart : 0 }

alarm[0] = 2;

triggered = false;

pitch = 0;
audio = con_audio.play_sound(snd_white_noise,0,pitch, 0, true);
audio2 = con_audio.play_sound(snd_evil_loop, 0, .1, 0, true);
audio_sound_gain(audio, 0, 0);
volume = 0;

psys = part_system_create();
p_type = part_type_create();

part_type_sprite(p_type, sp_raindrops_backwards, true, true, 0);
part_type_life(p_type, 16, 32);

white = 0;