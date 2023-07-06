if ( wait > 0 ) 
{
	exit;
}
phy_speed_x = 0;
phy_speed_y = 0;
z = -1;
zspeed = -2;
wait = wait_set;

var d = point_direction(room_width*.5, (room_height*.5)-32, x, y);
target.x = (room_width*.5) + lengthdir_x(128 - ( phy_speed * 2), d );
target.y = ((room_height*.5)-32) + lengthdir_y(64 - ( phy_speed*2), d);
screen_shake(5);

con_audio.play_sound_at(choose(snd_slam_1, snd_slam_2), x, y, 100, 128);
con_audio.play_boss_tone();

hp--;
if ( hp <= 0) 
{ 
	with ( obj_fireball )
	{
		target = noone;	
	}
	
	with ( obj_cloud )
	{
		hurt = false;
	}	
	
	wait = 100000;
}
else
{
	hurt = true;	
}

instance_destroy();
