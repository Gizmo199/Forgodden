if ( lnumber > 0 )
{
	var d = random(360);
	var r = random(32);
	var xx = x + lengthdir_x(r,d);
	var yy = y + lengthdir_y(r,d);
	
	var ins = instance_create_layer(xx, yy, layer, obj_charge);
	ins.charge_speed = .2;
	ins.single = false;
}
lnumber--;

if ( lnumber <= 0 )
{
	instance_destroy();
}
else
{
	alarm[0] = irandom_range(2, 5);	
}