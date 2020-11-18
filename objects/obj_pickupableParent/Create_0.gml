/// @description Insert description here
// You can write your code in this editor

phy_rotation = random(360);
force = random(20);
if instance_exists(obj_player)
{
	phy_speed_x = obj_player.phy_speed_x + lengthdir_x(force, -phy_rotation);
	phy_speed_y = obj_player.phy_speed_y + lengthdir_y(force, -phy_rotation);
}

image_speed = 0;

attractiveForce = 100;