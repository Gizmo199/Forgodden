var scl = 1;
draw_sprite_ext(sp_button_prompts, index, x, y, scl, scl, 0, selected ? c_yellow : c_white, alpha);

var sclx = sprite_width * grow;
var scly = sprite_height * grow;
var sclx2 = ( sprite_width - 1 ) * grow;
var scly2 = ( sprite_height - 1 ) * grow;
draw_set_color(selected ? c_yellow : c_white );
draw_line(bbox_left, bbox_top, bbox_left + sclx2, bbox_top);
draw_line(bbox_right, bbox_top, bbox_right, bbox_top+scly2);
draw_line(bbox_right, bbox_bottom, bbox_right - sclx, bbox_bottom);
draw_line(bbox_left, bbox_bottom, bbox_left, bbox_bottom-scly);

