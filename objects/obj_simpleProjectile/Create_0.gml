/// @description Insert description here
// You can write your code in this editor

phy_rotation = -point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
phy_speed_x = obj_player.phy_speed_x + lengthdir_x(40, -phy_rotation);
phy_speed_y = obj_player.phy_speed_y + lengthdir_y(40, -phy_rotation);

lifeTime = 2 * room_speed;