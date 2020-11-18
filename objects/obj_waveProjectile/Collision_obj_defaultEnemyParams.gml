/// @description Insert description here
// You can write your code in this editor

with(other)
{
	physics_apply_impulse(x, y, lengthdir_x(100, point_direction(x, y, obj_player.x, obj_player.y) - 180), lengthdir_y(100, point_direction(x, y, obj_player.x, obj_player.y) - 180))	
}