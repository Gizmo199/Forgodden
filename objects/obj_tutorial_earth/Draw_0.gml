//var h1 = sin(current_time/400)*4;
//var h2 = sin((current_time/400)+pi*.5)*4;
//var yy = bbox_bottom + ( 64 * (1-move_alpha) );
//draw_sprite_ext(sp_tut_pillars, 0, bbox_left, yy + h1, 1, 1, 0, c_white, move_alpha);
//draw_sprite_ext(sp_tut_pillars, 1, bbox_right, yy + h2 - 4, 1, 1, 0, c_white, move_alpha);

var h1 = sin(current_time/400)*4;
var h2 = sin((current_time/400)+pi*.5)*4;
var yy = (y + sprite_height*.5);
draw_sprite_ext(sp_tut_pillars, 4, bbox_left, yy + h1, 1, 1, 0, c_white, water_alpha * alpha);
draw_sprite_ext(sp_tut_pillars, 5, bbox_right, yy + h2 - 4, 1, 1, 0, c_white, water_alpha * alpha);