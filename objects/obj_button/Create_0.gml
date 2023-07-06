selected = false;
active = true;
grow = 0;
alpha = 0;
index = 0;

color = c_yellow;

draw_set_font(fnt_main);

switch(text)
{
	case "Play":
		index = 0;
		func = function()
		{
			with ( obj_intro_control )
			{
				target.y-=48;
				triggered = true;
				with ( obj_button )
				{
					active = false;	
				}
			}
			con_audio.play_sound(snd_die);
			var ins = instance_create_layer(0,0,layer,obj_flash);
			ins.white = .25;
			ins.pause_player = false;
		}
	break;
	
	case "Fullscreen":
		index = 1;
		func = function()
		{
			window.set_size(1280, 720, !window.fullscreen);
			gui.set_size(window.width, window.height);
		}
	break;
	
	case "Audio":
		index = 2;
		func = function()
		{
			audio_master_gain(!audio_get_master_gain(0));	
			index = 2+(1-sign(audio_get_master_gain(0)));
		}
	break;
	
	case "Exit":
		index = 4;
		func = game_end;
	break;
}