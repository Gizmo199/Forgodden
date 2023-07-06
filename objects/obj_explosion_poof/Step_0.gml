speed = lerp(speed, 0, 0.2);

x += dcos(direction)*speed;
y += -dcos(direction)*speed;

scale = lerp(scale, 0, 0.05);

if ( scale < .05 )
{
	instance_destroy();	
}

zspd = lerp(zspd, 0, 0.1);
z -= zspd;
