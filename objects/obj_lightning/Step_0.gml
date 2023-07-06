alpha -= 0.01;
if ( alpha < .01 ) instance_destroy();

if ( collision_circle(x, y, 16, obj_spike, false, true) && alpha > .95 && !reflected )
{
	phy_active = false;
	reflected = true;
	
	with ( obj_cloud )
	{
		hit = true;
		hurt = true;
		alarm[0] = 10;
		
		hp--;
		other.dir = point_direction(other.x, other.y, x, y+z)-90;
	}
	
	con_audio.play_sound(choose(snd_explosion_1, snd_explosion_2));
}

with ( light ) image_alpha = other.alpha * .25;