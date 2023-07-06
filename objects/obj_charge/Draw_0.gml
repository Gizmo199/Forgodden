var sz = big ? 32 : 16;
var rad = charge * sz;;

draw_set_color(c_magenta);
draw_set_alpha(alpha);
draw_circle(x, y, rad, false);
draw_circle(x, y, sz, true);