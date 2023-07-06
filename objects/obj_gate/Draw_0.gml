draw_set_alpha(1);
if ( !white )
{
	draw_sprite_stretched(sprite_index, image_index, x, y + ( sprite_height*(1-grow*height) ), 
	sprite_width, sprite_height*(grow*height));
}
else
{
	gpu_set_fog(1,c_white,1,1);
	draw_sprite_stretched(sprite_index, image_index, x, y + ( sprite_height*(1-grow*height) ), 
	sprite_width, sprite_height*(grow*height));
	gpu_set_fog(0,0,0,0);
}