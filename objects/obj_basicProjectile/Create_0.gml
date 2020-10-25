/// @description Insert description here
// You can write your code in this editor

initial = false;

//phy_rotation = -point_direction(x, y, mouse_x, mouse_y);
phy_rotation = -obj_weapon.image_angle
phy_speed_x = obj_player.phy_speed_x + lengthdir_x(100, -phy_rotation);
phy_speed_y = obj_player.phy_speed_y + lengthdir_y(100, -phy_rotation);

alarm_set(0, 2 * room_speed);