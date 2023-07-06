draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(alpha);
draw_set_color(c_white);
draw_text(room_width*.5, room_height*.5, @"WARNING: 
This game may potentially trigger seizures for people with photosensitive epilepsy. 
Player discretion is advised.");

draw_set_alpha(1);