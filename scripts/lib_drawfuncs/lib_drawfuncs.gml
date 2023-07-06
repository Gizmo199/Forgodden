function draw_sprite_stack(sp,_x,_y,_z,ang)
{
	var num = sprite_get_number(sp);
	for ( var i=0; i<num; i++ )
	{
		draw_sprite_ext(
			sp, i,
			_x, (_y-i)+_z,
			1,1,
			ang,c_white,1
		);
	}
}	
function draw_self_stacked()
{
	///@func draw_self_stacked(*z, *zscale)
	var z = [ 0, 1 ];
	for ( var i=0; i<argument_count; i++ )
	{
		z[i] = argument[i];	
	}
	for ( var i=0; i<image_number; i++ )
	{
		draw_sprite_ext(
			sprite_index, i,
			x, (y-(i*z[1])) + z[0],
			image_xscale,image_yscale,
			image_angle,image_blend,image_alpha
		);
	}
}

// Reflections
global.__reflectList = ds_list_create();
function reflect_enable()
{
	ds_list_add(global.__reflectList, id);	
}

function draw_self_stacked_reflected()
{
	///@func draw_self_stacked_reflected(*z, *zscale)
	var z = [ 0, 1 ];
	for ( var i=0; i<argument_count; i++ )
	{
		z[i] = argument[i];	
	}
	for ( var i=image_number-1; i>-1; i-- )
	{
		draw_sprite_ext(
			sprite_index, i,
			x, (y-(i*-z[1])) -z[0],
			image_xscale,image_yscale,
			image_angle,image_blend,image_alpha * ( (image_number-i)/(image_number-1)) * .5
		);
	}
}
function draw_sprite_stacked_reflected(sp,_x,_y,_z,ang)
{
	var num = sprite_get_number(sp);
	for ( var i=0; i<num; i++ )
	{
		draw_sprite_ext(
			sp, (num-i),
			_x, (_y+i)-_z,
			1,1,
			ang,c_white,.5
		);
	}
}

function draw_self_reflected()
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, -image_yscale, image_angle, image_blend, image_alpha * .5);		
}
function draw_sprite_reflected(sp,i,_x,_y)
{
	draw_sprite_ext(sp, i, _x, _y, 1, -1, 0, c_white, .5);		
}
function draw_sprite_reflected_ext(sp,i,_x,_y,xs,ys,rot,col,alp)
{
	draw_sprite_ext(sp, i, _x, _y, xs, -ys, rot, col, alp * .5);		
}

function coord_to_gui(_x, _y)
{
	var vw = con_camera.view_width;
	var vh = con_camera.view_height;
	var dis_x = gui.width / vw;
	var dis_y = gui.height / vh;
	var vx = con_camera.view_x - vw*.5;
	var vy = con_camera.view_y - vh*.5;
	
	return { x : _x - vx * dis_x, y : _y - vy * dis_y }	
}