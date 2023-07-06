var cspd = charge_speed;
if ( big ) cspd *= 1.25;
charge = lerp(charge, 1, cspd);

//if ( big )
//{
//	x = lerp(x, obj_cloud.x, .1);
//	y = lerp(y, obj_cloud.y, .1);
//}

if ( charge > .9 )
{		
	if ( !big )
	{
		screen_shake(10);
		var ins = instance_create_layer(x, y, layer, obj_lightning);
		ins.single = single;
		instance_destroy();
	}
	else
	{
		if ( lnumber==0 )
		{
			screen_shake(15);
			alarm[0] = 5;
			lnumber = irandom_range(5, 8);
			con_audio.play_sound(snd_thunder, 1, random_range(1,3), 0, false);
			
			var flash = instance_create_layer(x, y, layer, obj_flash);
			flash.free_view_bottom = false;
			flash.spd = .08;
			flash.white = 0.3;
		}
		alpha_to = 0;
	}
	
	charge = 1;
}

alpha = lerp(alpha, alpha_to, .2);