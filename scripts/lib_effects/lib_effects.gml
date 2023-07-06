function screen_shake(magnitude)
{
	var ins = instance_create_depth(0,0,depth,obj_screenshake);
	ins.mag = magnitude;
}
function hitflash_set()
{
	gpu_set_fog(true,c_white,1,1);	
}
function hitflash_reset()
{
	gpu_set_fog(0,0,0,0);	
}