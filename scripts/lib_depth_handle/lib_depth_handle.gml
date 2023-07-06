global.__depthMap = ds_grid_create(2,1);
global.__depthList = ds_list_create();

function depth_enable()
{
	visible = false;
	z = 0;
	shadow_enable = true;
	ds_list_add(global.__depthList, id);
}
function depth_draw_objects()
{
	var dgrid = global.__depthMap;
	var num = ds_list_size(global.__depthList);
	ds_grid_resize(dgrid, 2, num);
	
	var yy=0;
	for ( var i=0; i<num; i++ )
	{
		var _id = global.__depthList[|i];
		if ( !instance_exists(_id) )
		{
			ds_list_delete(global.__depthList, i);	
			i-=1;
			num-=1;
		}
		else
		{
			with(_id)
			{
				dgrid[# 0, yy] = id;
				dgrid[# 1, yy] = y - z;
				yy++;
			}
		}
	}	
	ds_grid_sort(dgrid, 1, true);
	
	var inst;
	yy = 0;
	repeat(num)
	{
		inst = dgrid[# 0, yy];
		with ( inst )
		{
			event_perform(ev_draw, 0);	
		}
		yy++;
	}
	
}
function depth_clear()
{
	ds_list_clear(global.__depthList);
}