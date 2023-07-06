draw_set_color(c_white);

var ldx = lengthdir_x(tail * length, direction);
var ldy = lengthdir_y(tail * length, direction);
var ldx2 = lengthdir_x(head * length, direction);
var ldy2 = lengthdir_y(head * length, direction);

draw_line(x + ldx2, y + ldy2, x + ldx, y + ldy);