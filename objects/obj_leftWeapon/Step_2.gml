/// @description Insert description here
// You can write your code in this editor

x = player_coordintes_respect_to_world_x(obj_player.hardpointLeft[@ 0], obj_player.hardpointLeft[@ 1]);
y = player_coordintes_respect_to_world_y(obj_player.hardpointLeft[@ 0], obj_player.hardpointLeft[@ 1]);

if not obj_jumpMechanics.jump
{
	//image_angle = point_direction(x, y, mouse_x, mouse_y) - get_sideways_velocity()*6;
	image_angle = point_direction(x, y, mouse_x, mouse_y)
}
else
{
	image_angle = obj_jumpMechanics.jumpDirection;	
}