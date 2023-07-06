white = lerp(white, 0, spd);
if ( white <= 0.02 )
{
	instance_destroy();	
}

if ( white < .4 )
{
	if ( pause_player )
	{
		with ( obj_player )
		{
			paused = false;
		}
		physics_world_update_speed(1);
	}
}
else
{
	if ( pause_player )
	{
		physics_world_update_speed(0);
	}
	else
	{
		physics_world_update_speed(1);	
	}
}
if ( free_view_bottom )
{
	con_camera.view_bottom = vb * clamp(white, 0, 1);
}

if ( layer_exists("Grayscale") )
{
	var fx_lay = layer_get_fx("Grayscale");
	fx_set_parameter(fx_lay, "g_Intensity", white);
}