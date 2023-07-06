image_alpha -= fade_spd;
if ( image_alpha <= 0 ) instance_destroy();

if ( !global._humanSaved )
{
	y = ystart + sin(current_time/240)*4;	
}

index += 0.25;
if ( index > 4 ) index = 4;