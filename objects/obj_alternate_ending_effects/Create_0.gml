ss = 0;
psys = part_system_create();
p_type = part_type_create();

part_type_sprite(p_type, sp_raindrops_backwards, true, true, 0);
part_type_life(p_type, 16, 32);

alpha = 0;
pitch = .1;

audio = con_audio.play_sound(snd_evil_loop, .5, .5, 0, true);
wnoise = con_audio.play_sound(snd_white_noise, 1, 0, 0, true);

con_audio.play_boss_tone();
alarm[0] = 300;