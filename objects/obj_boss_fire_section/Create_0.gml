active = 0;
pit_id = [];

var list = ds_list_create();
var col = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_fire_pit, false, true, list, true);

for ( var i=0; i<col; i++ )
{
	pit_id[i] = list[| i];
}
ds_list_destroy(list);

function ignite_all()
{
	///@func ignite_all()
	for ( var i=0; i<array_length(pit_id); i++ )
	{
		with ( pit_id[i] )
		{
			alarm[0] = 1;
		}
		active = 4;
	}
}