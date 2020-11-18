/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_player)
{
	image_alpha = alarm_get(0)/((room_speed * get_stat("pulseLifetimeStat"))/8)

	collision_line_list(x + lengthdir_x(43, -phy_rotation - 90), y + lengthdir_y(43, -phy_rotation - 90), x + lengthdir_x(43, -phy_rotation + 90), y + lengthdir_y(43, -phy_rotation + 90), obj_defaultEnemyParams, false, true, listOfCollisions, false)
	collision_line_list(x + lengthdir_x(43, -phy_rotation - 90), y + lengthdir_y(43, -phy_rotation - 90), x + lengthdir_x(43, -phy_rotation + 90), y + lengthdir_y(43, -phy_rotation + 90), obj_destroyableWeapon, false, true, listOfCollisions, false)
	collision_line_list(x + lengthdir_x(43, -phy_rotation - 90), y + lengthdir_y(43, -phy_rotation - 90), x + lengthdir_x(43, -phy_rotation + 90), y + lengthdir_y(43, -phy_rotation + 90), obj_obstacleParent, false, true, listOfCollisions, false)

	for (var i = 0; i < ds_list_size(listOfCollisions); i++)
	{
		with(listOfCollisions[| i])
		{
			physics_apply_impulse(x, y, lengthdir_x(80, point_direction(x, y, obj_player.x, obj_player.y) - 180), lengthdir_y(80, point_direction(x, y, obj_player.x, obj_player.y) - 180))
		}
	}
}