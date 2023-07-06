depth_enable();
reflect_enable();

hit = false;
z = -16;
zscale = 1.5;

can_hit = false;

timer = 0;
target = { x : obj_player.x, y : obj_player.y }

health_init(sprite_width, 40);

con_camera.view_bottom = 64;

con_audio.play_boss_tone();

if ( !audio_is_playing(msc_drums) && room != rm_boss_to )
{
	boss_music = con_audio.play_sound_fade(msc_drums, 1, 1, 0, true, 10000);
}
else
{
	boss_music = -1;	
}
con_audio.play_sound(msc_flute);
play_flute = false;

if ( audio_is_playing(msc_main) )
{
	audio_sound_gain(msc_main, 0, 0);
}