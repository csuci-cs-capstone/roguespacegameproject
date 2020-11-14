/// @description Insert description here
// You can write your code in this editor

x = coordintes_respect_to_world_x(obj_player.hardpointLeft[@ 0], obj_player.hardpointLeft[@ 1], obj_player.phy_position_x, obj_player.phy_rotation);
y = coordintes_respect_to_world_y(obj_player.hardpointLeft[@ 0], obj_player.hardpointLeft[@ 1], obj_player.phy_position_y, obj_player.phy_rotation);

if not obj_jumpMechanics.jump
{
	//image_angle = point_direction(x, y, mouse_x, mouse_y) - get_sideways_velocity()*6;
	image_angle = point_direction(x, y, mouse_x, mouse_y)
}
else
{
	image_angle = obj_jumpMechanics.jumpDirection;	
}