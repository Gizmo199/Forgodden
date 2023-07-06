depth_enable();
reflect_enable();

var num = instance_number(obj_human_pathpoint);
for ( var i=0; i<num; i++ )
{
	point_to[i] = instance_find(obj_human_pathpoint, i);
}
pos = 0;

if ( global._humanSaved )
{
	instance_create_layer(x, y, layer, obj_alternate_ending_effects);
}