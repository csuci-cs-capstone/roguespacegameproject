/// @description Insert description here
// You can write your code in this editor

if (side = 1)
{
	x = obj_player.leftHardpointX;
	y = obj_player.leftHardpointY;
}
else
{
	x = obj_player.rightHardpointX;
	y = obj_player.rightHardpointY;
}

image_angle = point_direction(x, y, mouse_x, mouse_y);