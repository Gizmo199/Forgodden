if ( layer_exists("Screenshake") )
{
	mag = lerp(mag, 0, spd);
	fx_set_parameter(fxl, "g_Magnitude", mag);
	if ( mag <= 0.05 ) instance_destroy();
}