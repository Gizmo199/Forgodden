var sn = snd_fireball_3;
var xd = dcos(direction) * 16;
var yd = -dsin(direction) * 16;
var amt = random_range(8, 32);
var snd = con_audio.play_sound_at(sn, x+xd, y+yd, amt, amt*2, 1);
audio_sound_set_track_position(snd, .2);
audio_sound_pitch(snd, random_range(amt*.05, amt*.1));