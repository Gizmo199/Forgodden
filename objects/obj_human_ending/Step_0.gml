var spd = .5;
var pd = direction;
sprite_index = sp_human_walk;

direction = round(point_direction(x, y, point_to[pos].x, point_to[pos].y)/90)*90;
x += dcos(direction) * spd;
y += -dsin(direction) * spd;

var xs = sign(dcos(pd));
if ( xs != 0 ) image_xscale = xs;

if ( point_distance(x, y, point_to[pos].x, point_to[pos].y) < 5 )
{
	with ( point_to[pos] ) instance_destroy();
	pos++;	
	if ( pos > array_length(point_to)-1 )
	{
		instance_destroy();
	}
}