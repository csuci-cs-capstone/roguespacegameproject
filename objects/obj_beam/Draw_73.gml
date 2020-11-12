/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_beam, clamp(index, 0, 5), x + lengthdir_x(distanceFromInitial/2, -phy_rotation + 180),  y + lengthdir_y(distanceFromInitial/2, -phy_rotation + 180), distanceFromInitial/2, 1, -phy_rotation + 180, c_white, 1)