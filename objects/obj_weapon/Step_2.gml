/// @description Insert description here
// You can write your code in this editor

leftHardpointX = ((obj_player.hardpointLeft[0] * sin(degtorad(-obj_player.phy_rotation))) + (obj_player.hardpointLeft[1] * cos(degtorad(-obj_player.phy_rotation)))) + obj_player.phy_position_x;
leftHardpointY = ((obj_player.hardpointLeft[0] * cos(degtorad(-obj_player.phy_rotation))) + (obj_player.hardpointLeft[1] * -sin(degtorad(-obj_player.phy_rotation)))) + obj_player.phy_position_y;

rightHardpointX = ((obj_player.hardpointRight[0] * sin(degtorad(-obj_player.phy_rotation))) + (obj_player.hardpointRight[1] * cos(degtorad(-obj_player.phy_rotation)))) + obj_player.phy_position_x;
rightHardpointY = ((obj_player.hardpointRight[0] * cos(degtorad(-obj_player.phy_rotation))) + (obj_player.hardpointRight[1] * -sin(degtorad(-obj_player.phy_rotation)))) + obj_player.phy_position_y;

if (side = 1)
{
	x = leftHardpointX;
	y = leftHardpointY;
}
else
{
	x = rightHardpointX;
	y = rightHardpointY;
}

if not obj_jumpGraphics.jump
{
	image_angle = point_direction(x, y, mouse_x, mouse_y) - get_sideways_velocity()*6;
}