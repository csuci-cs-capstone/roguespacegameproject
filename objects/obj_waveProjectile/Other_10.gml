/// @description Insert description here
// You can write your code in this editor

phy_rotation = -aimTowards;

phy_speed_x = obj_player.phy_speed_x + lengthdir_x(get_stat("projectileSpeedStat"), -phy_rotation)
phy_speed_y = obj_player.phy_speed_y + lengthdir_y(get_stat("projectileSpeedStat"), -phy_rotation)