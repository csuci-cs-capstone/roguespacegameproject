/// @description Insert description here
// You can write your code in this editor

if weaponIndex == 3
{
	if instance_exists(connectedInstance) && connectedInstance != noone && jointCreated
	{
		draw_set_color(c_blue)
		draw_line(obj_player.phy_position_x, obj_player.phy_position_y, connectedInstance.phy_position_x, connectedInstance.phy_position_y)
		draw_set_color(c_white)
	}
}