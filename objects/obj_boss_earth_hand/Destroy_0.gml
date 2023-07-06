instance_destroy(collider);
with ( obj_boss_earth_hand ) 
{
	speed = -.1;	
}

if ( alone )
{
	obj_boss_earth.target.x = room_width*.5;
	obj_boss_earth.target.y = room_height*.5;
}

var d = 0;
var r = irandom_range(3, 5);
var i = 0;
repeat(r)
{
	var spd = random_range(8, 12);
	var obj = obj_rock_small;
	if ( i < 2 ) obj = choose(obj_rock_small, obj_rock_big);
	var ins = instance_create_layer(x+random_range(-8, 8), y + random_range(-8, 8), layer, obj);
	ins.phy_speed_x = dcos(-d)*spd;
	ins.phy_speed_y = -dsin(-d)*spd;
	ins.z = random_range(-image_number, -image_number*.5);
	ins.zspeed = random_range(-6, -4);
	ins.ever_kill = false;

	d += 360/r;
	i ++;
}
repeat(irandom_range(2, 4))
{
	instance_create_layer(x, y, layer, obj_explosion_poof);
}	

con_audio.play_sound(choose(snd_explosion_1, snd_explosion_2));
