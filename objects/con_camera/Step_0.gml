var xx = x;
var yy = y;
var zs = 1;

if ( zoom )
{
	zs = .9;
}
zoom--;

view_width = lerp(view_width, view_width_start * zs, .1);
view_height = lerp(view_height, view_height_start * zs, .1);


if ( target != noone )
{
	xx = target.x;
	yy = target.y;
}
view_buffer_x = lerp(view_buffer_x, xx, 0.15);
view_buffer_y = lerp(view_buffer_y, yy, 0.15);

view_buffer_x = clamp(view_buffer_x, ( view_width*.5 ) + view_left, ( room_width-view_width * .5) - view_right );
view_buffer_y = clamp(view_buffer_y, ( view_height*.5 ) + view_top,  ( room_height-view_height*.5) - view_bottom);

view_x = lerp(view_x, view_buffer_x, 0.08);
view_y = lerp(view_y, view_buffer_y, 0.08);

var cx = view_x - ( view_width * .5 );
var cy = view_y - ( view_height * .5);

camera_set_view_size(view_camera[0], view_width, view_height);
camera_set_view_pos(view_camera[0], cx, cy);

if ( paralax_layer != -1 )
{
	layer_x(paralax_layer, cx * .1);
	layer_y(paralax_layer, cy * .1);
}

layer_x(blay, cx * .5);
layer_y(blay, cy * .5);
fx_set_parameter(fbxlay, "g_DistortOffset", current_time/25000, 0);

fadein -= fade_speed;

red_amt = lerp(red_amt, red, 0.1);