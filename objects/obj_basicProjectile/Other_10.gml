/// @description Insert description here
// You can write your code in this editor

//phy_rotation = -point_direction(x, y, mouse_x, mouse_y);
phy_rotation = -aimTowards;
physics_apply_impulse(x, y, obj_player.phy_speed_x + lengthdir_x(get_stat("projectileSpeedStat"), -phy_rotation), obj_player.phy_speed_y + lengthdir_y(get_stat("projectileSpeedStat"), -phy_rotation))
//phy_speed_x = 
//phy_speed_y = 

alarm_set(0, 2 * room_speed);