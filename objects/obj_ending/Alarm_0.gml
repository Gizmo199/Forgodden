//var aud = [ snd_now_we_feast, snd_you_are_free ];
//con_audio.play_sound(aud[global._humanSaved]);
var aud = con_audio.play_sound(amb_room, 0, 1, 0, true);
audio_sound_gain(aud, 1, 1000);
room_goto(rm_intro);